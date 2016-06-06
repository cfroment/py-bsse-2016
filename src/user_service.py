from sqlalchemy import text, bindparam
from model.connection import ConnectionManager
from model.candidate import Evaluator
import utilities


class UserService:
    """ Service class to perform operations related to a BSSE user """

    @staticmethod
    def get_user(user_id=None):
        """
        :rtype : int
        :return : Evaluator
        """
        if not user_id:
            return None
        session = ConnectionManager.get_instance().get_session()
        rows = session.query(Evaluator).filter(Evaluator.id == user_id)
        # session.close()
        try:
            return rows[0]
        except:
            return None

    @staticmethod
    def update_user(evaluator):
        if not evaluator:
            return
        session = ConnectionManager.get_instance().get_session()
        user = session.merge(evaluator)
        try:
            session.commit()
        except:
            session.rollback()
            raise
        finally:
            return user

    @staticmethod
    def get_missing_evaluations(user_id=None):
        if not user_id:
            return []
        session = ConnectionManager.get_instance().get_session()
        rows = session.execute(text("""
            SELECT id, name FROM candidate WHERE id NOT IN (
                SELECT candidate FROM ranking WHERE evaluator = :evaluator_id)
            ORDER BY id """, bindparams=[bindparam('evaluator_id', user_id)]))
        return utilities.result_set_to_dict(rows)
