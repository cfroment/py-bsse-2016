"""
Created on Nov 29, 2013

@author: be07336
"""
from sqlalchemy.ext.declarative.api import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy.schema import Column, ForeignKey
from sqlalchemy.types import Integer, String, NUMERIC
from model.connection import ConnectionManager

Base = declarative_base(bind=ConnectionManager.get_instance().get_engine())


class Candidate(Base):
    """
    Candidate class
    """

    __tablename__ = 'CANDIDATE'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    email = Column(String)
    year = Column(String)
    destination = Column(String)
    company = Column(String)

    evaluations = relationship("Evaluation", primaryjoin="Candidate.id == Evaluation.candidate")

    others = relationship("Document", primaryjoin="and_(Candidate.id == Document.candidate,"
                                                  " Document.type=='OTHER')")
    cvs = relationship("Document", primaryjoin="and_(Candidate.id == Document.candidate, Document.type=='CV')")
    motivations = relationship("Document", primaryjoin="and_(Candidate.id == Document.candidate, Document.type=='MOT')")

    def __init__(self):
        """ Constructor """


class Evaluator(Base):
    __tablename__ = 'EVALUATOR'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    email = Column(String)
    password = Column(String)

    def __init__(self):
        pass

    def is_authenticated(self):
        return True

    def is_active(self):
        return True

    def is_anonymous(self):
        return False

    def get_id(self):
        return self.email

    def __repr__(self):
        return '<User %r>' % self.email


class Evaluation(Base):
    """ classdocs """

    __tablename__ = 'EVALUATION'

    id = Column('id', Integer, primary_key=True)
    grade = Column(NUMERIC(precision=2, scale=1))
    comments = Column(String)
    candidate = Column(Integer, ForeignKey('CANDIDATE.id'))
    evaluator = Column(Integer, ForeignKey('EVALUATOR.id'))
    criterion = Column(Integer, ForeignKey('CRITERION.id'))

    def __init__(self, **kwargs):
        """ Constructor """

        self.id = kwargs.get('id')
        self.grade = kwargs.get('grade')
        self.comments = kwargs.get('comments')
        self.candidate = kwargs.get('candidate')
        self.evaluator = kwargs.get('evaluator')
        self.criterion = kwargs.get('criterion')


class Criterion(Base):
    """ classdocs """

    __tablename__ = 'CRITERION'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    description = Column(String)
    weight = Column(NUMERIC(precision=3, scale=0))

    def __init__(self):
        pass


class Document(Base):
    """ classdocs """

    __tablename__ = 'CANDIDATE_DOCS'

    id = Column(Integer, primary_key=True)
    url = Column(String)
    type = Column(String)
    candidate = Column(Integer, ForeignKey('CANDIDATE.id'))

    def __init__(self):
        pass


class Ranking(Base):
    """' classdocs """

    __tablename__ = 'RANKING'

    ranking = Column(Integer)
    evaluator = Column(Integer, primary_key=True)
    candidate = Column(Integer, primary_key=True)

    def __init__(self, **kwargs):
        self.ranking = kwargs.get('ranking', 999)
        self.evaluator = kwargs.get('evaluator')
        self.candidate = kwargs.get('candidate')
