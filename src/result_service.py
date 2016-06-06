from model.connection import ConnectionManager
from sqlalchemy import text, bindparam
import utilities

__author__ = 'Corentin'


def get_comments_per_criterion(candidate_id=None):
    """
    This function returns all the evaluator comments per criterion.
    :return: a dict of criteria with their respective list of ccmments.
    """
    session = ConnectionManager.get_instance().get_session()
    rows = session.execute(text("""
            SELECT criterion as CRITERION, comments as COMMENT FROM evaluation
            WHERE comments is not null and comments not like '' and candidate=:candidate_id""",
                                bindparams=[bindparam('candidate_id', candidate_id)]))
    result_list = utilities.result_set_to_dict(rows)
    result_map = dict()
    for a_dict in result_list:
        if not a_dict['CRITERION'] in result_map:
            result_map.update({a_dict['CRITERION']: []})
        result_map[a_dict['CRITERION']].append(a_dict['COMMENT'])
    return result_map
