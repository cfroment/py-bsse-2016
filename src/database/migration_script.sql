DROP TABLE IF EXISTS EVALUATION;
DROP TABLE IF EXISTS CANDIDATE_DOCS;
DROP TABLE IF EXISTS RANKING;
DROP TABLE IF EXISTS EVALUATOR;
DROP TABLE IF EXISTS CRITERION;
DROP TABLE IF EXISTS CANDIDATE;

CREATE TABLE CANDIDATE (COMPANY TEXT, ID INTEGER PRIMARY KEY, NAME TEXT, EMAIL TEXT, YEAR TEXT, DESTINATION TEXT, PICTURE BLOB);
CREATE TABLE CRITERION (ID INTEGER PRIMARY KEY, NAME TEXT, DESCRIPTION TEXT, WEIGHT NUMERIC);
CREATE TABLE EVALUATOR (PASSWORD TEXT, ID INTEGER PRIMARY KEY, EMAIL TEXT, NAME TEXT);
CREATE TABLE CANDIDATE_DOCS (ID INTEGER PRIMARY KEY, TYPE TEXT, URL TEXT, CANDIDATE NUMERIC, 
    FOREIGN KEY(CANDIDATE) REFERENCES CANDIDATE(ID));
CREATE TABLE EVALUATION (ID INTEGER PRIMARY KEY AUTOINCREMENT, CANDIDATE NUMERIC, EVALUATOR NUMERIC, GRADE NUMERIC, CRITERION NUMERIC, COMMENTS TEXT, 
    FOREIGN KEY(CANDIDATE) REFERENCES CANDIDATE(ID),
    FOREIGN KEY(EVALUATOR) REFERENCES EVALUATOR(ID),
    FOREIGN KEY(CRITERION) REFERENCES CRITERION(ID));
CREATE TABLE RANKING(CANDIDATE NUMERIC, EVALUATOR NUMERIC, RANKING NUMERIC, 
    PRIMARY KEY(CANDIDATE, EVALUATOR),
    FOREIGN KEY(CANDIDATE) REFERENCES CANDIDATE(ID),
    FOREIGN KEY(EVALUATOR) REFERENCES EVALUATOR(ID));

insert into candidate values('Spierings Medische Techniek BV',1,'Jonathan Delchambre','jodelcha@ulb.ac.be','MA1','Nijmegen, The Netherlands',null);
insert into candidate values('Adobe',2,'François Remy','francois.remy@live.be','MA1','San Jose, CA, USA',null);
insert into candidate values('Eternit',3,'Jules Delacroix','jules.delacroix@hotmail.fr','MA1','Lima, Peru',null);
insert into candidate values('Université de Bologne',4,'Sophie Eeckhout','sophie.eeckhout@equiveto.be','MA1','Bologne, Italy',null);
insert into candidate values('SPX Cooling Technologies',5,'Antoine Dujardin','antoine.dujardin@ulb.ac.be','MA1','Zhangjiakou, China',null);
insert into candidate values('National Research Council Aerospace Manufacturing Technologies Centre (NRC-AMTC)',6,'Nicolas Turomsza Remy','nicolas.turomsza@ulb.ac.be','MA1','Montréal, Canada',null);
insert into candidate values('Université Pierre et Marie Curie',7,'Florence Giesen','florence.giesen@yahoo.com','MA1','Paris, France',null);
insert into candidate values('1000Mercis',8,'Loukas Kozonis','loukas.kozonis@student.ecp.fr','MA1','Paris, France',null);
insert into candidate values('Business Solution Center IBM',9,'Valentin Haarscher','vhaarscher@gmail.com','MA1','Nice, France',null);
insert into candidate values('Technical University of Dortmund',10,'Mathieu Molle','mamolle@ulb.ac.be','MA1','Dortmund, Germany',null);
insert into candidate values('University College London',11,'Pauline Leclercq','leclercq-pauline@hotmail.fr','MA1','London, United-Kingdom',null);

insert into criterion values(1,'Apport professionnel','Apport du stage comme expérience professionnelle', 30);
insert into criterion values(2,'Apport personnel','Apport du stage dans le développement personnel', 20);
insert into criterion values(3,'Qualité de la candidature','Qualité de la candidature', 15);
insert into criterion values(4,'Pro-activité et motivation','Pro-activité et motivation exprimées', 15);
insert into criterion values(5,'Nécessité financière','Nécessité financière', 20);

insert into evaluator values('password',1,'corentin.froment@gmail.com','Corentin Froment');
insert into evaluator values('password',2,'laurent.huenaerts@gmail.com','Laurent Huenaerts');
insert into evaluator values('password',3,'fscottin@gmail.com','Florence Scottini');

insert into candidate_docs values(1,'CV','https://docs.google.com/file/d/0B0AzjT-JXudLZG12SDBGQ0xuYkU',1);
insert into candidate_docs values(2,'CV','https://docs.google.com/file/d/0B0AzjT-JXudLdE1QazRIVGh6MXM',2);
insert into candidate_docs values(3,'CV','https://docs.google.com/file/d/0B0AzjT-JXudLX3VORHQwS1lsVG8',3);

insert into evaluation(id, candidate, evaluator, grade, criterion, comments) values(1,1,1,4,1,'Some useful comment');
insert into evaluation(id, candidate, evaluator, grade, criterion, comments) values(2,1,1,3,2,'Some useful comment 2');
insert into evaluation(id, candidate, evaluator, grade, criterion, comments) values(3,1,1,4,3,'Some useful comment 3');
insert into evaluation(id, candidate, evaluator, grade, criterion, comments) values(4,1,1,5,4,'');
insert into evaluation(id, candidate, evaluator, grade, criterion, comments) values(5,1,1,3,5,null);
insert into evaluation(id, candidate, evaluator, grade, criterion, comments) values(6,1,2,3.5,1,null);
insert into evaluation(id, candidate, evaluator, grade, criterion, comments) values(7,1,2,3.25,2,null);

insert into ranking(candidate, evaluator, ranking) values(1,1,4);