"""
Created on Nov 29, 2013

@author: be07336
"""

from model.candidate import Candidate, Evaluation, Evaluator, Criterion, Ranking
from model.connection import ConnectionManager
import utilities


class Service(object):

    @staticmethod
    def list_to_dict(key_function, values):
        new_dict = dict((key_function(v), v) for v in values)
        for i in range(1, 6):
            if not new_dict.get(i):
                new_eval = Evaluation()
                new_eval.criterion = i
                new_eval.grade = 0
                new_dict.__setitem__(i, new_eval)
        return new_dict

    @staticmethod
    def all_candidates():
        session = ConnectionManager.get_instance().get_session()
        result = session.query(Candidate).order_by(Candidate.id)
        session.close()
        return result

    @staticmethod
    def get_progress(evaluator_id=None):
        if not evaluator_id:
            return 0

        session = ConnectionManager.get_instance().get_session()
        evaluated = session.execute("""
            SELECT COUNT(*) FROM candidate WHERE id IN (
            SELECT candidate FROM ranking WHERE ranking is not null AND ranking <> 999 AND evaluator=:evaluator_id)""",
                                    {'evaluator_id': evaluator_id}).fetchone()[0]
        total = session.execute("""SELECT COUNT(*) FROM candidate""").fetchone()[0]
        return int(evaluated * 1.0 / total * 100)

    @staticmethod
    def get_candidate(candidate_id=None):
        if not candidate_id:
            raise ValueError("The id of the candidate cannot be null!")
        session = ConnectionManager.get_instance().get_session()
        rows = session.query(Candidate).filter(Candidate.id == candidate_id)
        # session.close()
        print(rows)
        try:
            return rows[0]
        except:
            return None

    @staticmethod
    def get_evaluations(candidate_id=None, evaluator_id=None):
        if not candidate_id or not evaluator_id:
            raise ValueError("The id of the candidate or the id of the evaluator cannot be None!")
        session = ConnectionManager.get_instance().get_session()
        rows = session.query(Evaluation) \
            .filter(Evaluation.candidate == candidate_id, Evaluation.evaluator == evaluator_id) \
            .order_by(Evaluation.criterion)
        rows_dictionary = Service.list_to_dict(lambda evaluation: evaluation.criterion, rows)
        session.close()
        return rows_dictionary

    @staticmethod
    def save_evaluations(evaluations=None):
        if not evaluations or not isinstance(evaluations, list):
            return

        session = ConnectionManager.get_instance().create_session()
        for evaluation in evaluations:
            session.merge(evaluation)
        try:
            session.commit()
            print('Commited!')
        except:
            print('Exception!!!!')
            session.rollback()
            raise
        finally:
            session.close()

    @staticmethod
    def save_ranking(ranking=None):
        if not ranking:
            return
        session = ConnectionManager.get_instance().create_session()
        session.merge(ranking)
        try:
            print('Ranking:', ranking.ranking, 'evaluator', ranking.evaluator, 'candidate', ranking.candidate)
            session.commit()
        except:
            session.rollback()
            raise
        finally:
            session.close()

    @staticmethod
    def report_for_candidate(candidate_id=None):
        if not candidate_id:
            raise ValueError("Cannot generate a report for a non-defined user...")
        # TODO: complete and returns a report for the candidate
        return 1

    @staticmethod
    def get_evaluator(evaluator_password=None, evaluator_email=None):
        if not evaluator_email:
            raise ValueError("Email is required to perform search")
        session = ConnectionManager.get_instance().get_session()
        rows = session.query(Evaluator).filter(Evaluator.email == evaluator_email,
                                               Evaluator.password == evaluator_password)

        session.close()
        try:
            return rows[0]
        except:
            return None

    @staticmethod
    def get_ranking(evaluator_id=None, candidate_id=None):
        if not evaluator_id or not candidate_id:
            raise ValueError
        session = ConnectionManager.get_instance().get_session()
        rows = session.query(Ranking).filter(Ranking.evaluator == evaluator_id, Ranking.candidate == candidate_id)
        try:
            return rows[0]
        except:
            return 999

    @staticmethod
    def get_user(user_email):
        if not user_email:
            return None
        session = ConnectionManager.get_instance().get_session()
        rows = session.query(Evaluator).filter(Evaluator.email == user_email)
        # session.close()
        try:
            return rows[0]
        except:
            return None

    @staticmethod
    def get_criteria():
        return ConnectionManager.get_instance().get_session().query(Criterion).order_by(Criterion.id).all()

    @staticmethod
    def get_missing_evaluators():
        session = ConnectionManager.get_instance().get_session()
        rows = session.execute("""
            SELECT name, email FROM evaluator WHERE id NOT IN (
                SELECT evaluator
                FROM ranking
                WHERE ranking is not null AND ranking <> 999
                GROUP BY evaluator
                HAVING COUNT(ranking) >= 12) AND id <> 0 """)
        result_list = []
        for row in rows:
            result_list.append(dict(row))
        return result_list

    @staticmethod
    def get_ranking_result():
        session = ConnectionManager.get_instance().get_session()
        rows = session.execute("""
            SELECT c.name AS NAME,  SUM(13 - r.ranking) AS RANKINGSUM, AVG(r.ranking) AS AVERAGERANKING,
                COUNT(r.ranking) AS COUNTRANKING
            FROM ranking r JOIN candidate c ON c.id = r.candidate
            WHERE ranking is not null AND ranking <> 999
            GROUP BY c.name
            ORDER BY RANKINGSUM DESC
        """)
        result_list = []
        for row in rows:
            result_list.append(dict(row))
        return result_list

    @staticmethod
    def get_criteria_average():
        session = ConnectionManager.get_instance().get_session()
        rows = session.execute("""
            SELECT c.id, c.name, e.criterion, round(avg(e.grade),3) AS AVERAGE
            FROM evaluation e JOIN candidate c ON c.id=e.candidate
            GROUP BY c.id, c.name, e.criterion
            ORDER BY c.id, e.criterion
            """)
        result_list = utilities.result_set_to_dict(rows)
        result_map = dict()
        for a_dict in result_list:
            if not a_dict['NAME'] in result_map:
                result_map.update({a_dict['NAME']: {a_dict['CRITERION']: a_dict['AVERAGE']}})
            else:
                result_map[a_dict['NAME']].update({a_dict['CRITERION']: a_dict['AVERAGE']})
        return result_map

    @staticmethod
    def get_system_ranking():
        session = ConnectionManager.get_instance().get_session()
        rows = session.execute("""
            SELECT SUM(ponderation) AS RANKING, ID, NAME
            FROM (
                SELECT candidate AS ID, c.name AS NAME, crit.weight/100.0 * AVG(grade) as ponderation
                FROM evaluation e JOIN candidate c ON c.id = candidate JOIN criterion crit ON crit.id = e.criterion
                GROUP BY criterion, candidate, crit.weight
            )
            GROUP BY ID, NAME
            ORDER BY RANKING DESC
        """)
        return utilities.result_set_to_dict(rows)
