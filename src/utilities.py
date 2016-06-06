def result_set_to_dict(result_set=None):
    """ Transforms a SQLAlchemy result set to a list of tuples """
    if not result_set:
        return []
    result_list = []
    for row in result_set:
        result_list.append(dict(row))
    return result_list
