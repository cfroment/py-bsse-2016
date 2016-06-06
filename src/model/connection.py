"""
Created on Nov 29, 2013

@author: be07336
"""
from sqlalchemy.engine import create_engine
from sqlalchemy.orm.session import sessionmaker
from properties import DATABASE_PATH


class ConnectionManager(object):
    """
    Class managing the connection to the database.
    """
    INSTANCE = None
    __session = None
    __engine = None

    def __init__(self):
        """
        Constructor
        """
        if ConnectionManager.INSTANCE:
            raise ValueError("Singleton implementation")
        self.__engine = create_engine('sqlite:///' + DATABASE_PATH)

    @staticmethod
    def get_instance():
        if not ConnectionManager.INSTANCE:
            ConnectionManager.INSTANCE = ConnectionManager()
        return ConnectionManager.INSTANCE

    def create_session(self):
        if not self.__session:
            new_session = sessionmaker(bind=self.__engine)
            self.__session = new_session()
        return self.__session

    def get_session(self):
        return self.create_session()

    def get_engine(self):
        return self.__engine
