DROP TABLE IF EXISTS EVALUATION;
DROP TABLE IF EXISTS CANDIDATE_DOCS;
DROP TABLE IF EXISTS RANKING;
DROP TABLE IF EXISTS CANDIDATE;
DROP TABLE IF EXISTS EVALUATOR;
DROP TABLE IF EXISTS CRITERION;

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

insert into criterion values(1,'Apport professionnel','Apport du stage comme expérience professionnelle', 30);
insert into criterion values(2,'Apport personnel','Apport du stage dans le développement personnel', 20);
insert into criterion values(3,'Qualité de la candidature','Qualité de la candidature', 15);
insert into criterion values(4,'Pro-activité et motivation','Pro-activité et motivation exprimées', 15);
insert into criterion values(5,'Nécessité financière','Nécessité financière', 20);    

insert into evaluator(id,name,email,password) values(1,'Corentin Froment','corentin.froment@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(2,'Laurent Huenaerts','laurent.huenaerts@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(3,'Adrien Lebrun','adri.lebrun@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(4,'Amaury Caprasse','amaury.caprasse@diplobel.fed.be','bsse2014');
insert into evaluator(id,name,email,password) values(5,'Benjamin Genêt','benjamin.genet@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(6,'Benoit Mattlet','bmattlet@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(7,'Bernard Campion','campionbernard@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(8,'Bruno Van Tuykom','bvtuykom@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(9,'Candice Nagel','candice.l.nagel@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(10,'Cedric Boey','cboey@ulb.ac.be','bsse2014');
insert into evaluator(id,name,email,password) values(11,'Charlotte Philippe','charlotteke.philippe@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(12,'Christophe Van Durme','cvdurme@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(13,'Constantin Delhaute','delhaute@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(14,'Damien Hemmeryckx','damien.he@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(15,'Dimitri Vanbellinghen','dimitri.vanbellinghen@gdfsuez.com','bsse2014');
insert into evaluator(id,name,email,password) values(16,'Dimitri Van Assche','dvassche@ulb.ac.be','bsse2014');
insert into evaluator(id,name,email,password) values(17,'Florence Scottini','fscottin@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(18,'François-Xavier Dubois','duboisfx@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(19,'Frederic Gaillard','gaillardfrederic@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(20,'Laura Jacobs','loly_136@hotmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(21,'Laurent Rabinowitch','lrabinow@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(22,'Marc Remiche','marc.remiche@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(23,'Nicolas Goessens','ngoessens@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(24,'Olivier Hogne','olivier@hogne.com','bsse2014');
insert into evaluator(id,name,email,password) values(25,'Philippe Nemery','pnemery@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(26,'Pierre Henneaux','pierre.henneaux@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(27,'Quentin Jossen','qjossen@ulb.ac.be','bsse2014');
insert into evaluator(id,name,email,password) values(28,'Robert Salvessen','robert.salvesen@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(29,'Sebastien Massin','sebmassin@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(30,'Yue Hong Zhang','Zhang.Yue.Hong@bcg.com','bsse2014');
insert into evaluator(id,name,email,password) values(31,'Gaetan Deknop','gdeknop@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(32,'Amandine Caprasse','amandine.caprasse@ulb.ac.be','bsse2014');
insert into evaluator(id,name,email,password) values(33,'Antoine Nonclercq','anoncler@ulb.ac.be','bsse2014');
insert into evaluator(id,name,email,password) values(34,'Jean-Christophe Fann','jcfann@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(35,'Arnaud Goessens','arnaud.goessens@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(36,'Raoul Sommeillier','raoul.sommeillier@gmail.com','bsse2014');
insert into evaluator(id,name,email,password) values(37,'Nathaniel Jesuran','nathaniel.jesuran@gmail.com','bsse2014');

insert into candidate(id, name, email, year, destination, company) values(1, 'Frédéric Colomer', 'frederic.colomer@gmail.com', 'MA1', 'East Lansing, Michigan, USA', 'Michigan State University');
insert into candidate(id, name, email, year, destination, company) values(2, 'Frédéric Comté', 'comtefrederic2703@gmail.com','MA2', 'Quebec, Canada', 'Université de Laval');
insert into candidate(id, name, email, year, destination, company) values(3, 'Widade El Haddouti', 'welhaddo@ulb.ac.be', 'MA1', 'Aachen, Allemagne', 'Aachen University of Applied Sciences');
insert into candidate(id, name, email, year, destination, company) values(4, 'Joachim Galaski', 'joachimgalaski@gmail.com', 'MA1', 'Oaxaca, Mexique', 'Centro Interdisciplinario de Investigacion para el Desarrollo Integral Regional');
insert into candidate(id, name, email, year, destination, company) values(5, 'Sebastien Hachez', 'shachez@ulb.ac.be', 'MA1', 'Sydney, Australie', 'Aerospace, Mechanical and Mechatronic Engineering department');
insert into candidate(id, name, email, year, destination, company) values(6, 'Raymond Lou Ann', 'lraymond@ulb.ac.be', 'MA1', 'Chicago, Illinois, USA', 'Rehabilitation Institute of Chicago');
insert into candidate(id, name, email, year, destination, company) values(7, 'Trung Cang Do', 'trungcang.do1@gmail.com', 'MA1', 'Varel, Allemagne', 'H20 e-Mobile');

insert into candidate_docs(id, type, url, candidate) values(1,'CV','https://www.dropbox.com/s/u0vly27elgl4lj9/CV_FredericColomer_FR.pdf',1);
insert into candidate_docs(id, type, url, candidate) values(2,'MOT','https://www.dropbox.com/s/i75vr3i4q6hd4hn/Colomer%20Frederic%20-%20BSSE%20-%20Lettre%20de%20motivation.pdf',1);
insert into candidate_docs(id, type, url, candidate) values(3,'ESTIMATE','https://www.dropbox.com/s/ro6cyk3qmlfdlf5/Colomer%20Frederic%20-%20BSSE%20-%20Estimation%20de%20Budget.pdf',1);
insert into candidate_docs(id, type, url, candidate) values(4,'DESCRIPTION','https://www.dropbox.com/s/fj4ghtp2n3b3skk/Colomer%20Frederic%20-%20BSSE%20-%20Description%20d%27entreprise.pdf',1);

insert into candidate_docs(id, type, url, candidate) values(11,'CV','https://www.dropbox.com/s/sch8oewpln5oya9/cv_frederic_comte.pdf',2);
insert into candidate_docs(id, type, url, candidate) values(12,'MOT','https://www.dropbox.com/s/298k80bhpzsmwfr/motivation_frederic_comte.pdf',2);
insert into candidate_docs(id, type, url, candidate) values(13,'ESTIMATE','https://www.dropbox.com/s/ha5qfinrr93469b/estimation_frederic_comte.pdf',2);
insert into candidate_docs(id, type, url, candidate) values(14,'DESCRIPTION','https://www.dropbox.com/s/b5gl0mzmuidl4le/description_frederic_comte.pdf',2);

insert into candidate_docs(id, type, url, candidate) values(21,'CV','https://www.dropbox.com/s/0mmumygv4tgjz2y/CV-El%20Haddouti%20Widade.pdf',3);
insert into candidate_docs(id, type, url, candidate) values(22,'MOT','https://www.dropbox.com/s/7j2ewrzncxugitt/Lettre%20de%20motivation%20BSSE%20El%20Haddouti%20Widade.pdf',3);
insert into candidate_docs(id, type, url, candidate) values(23,'ESTIMATE','https://www.dropbox.com/s/507wby6fs2jwye1/BSSE%20-%20Fiche%20de%20candidature%20-%20El%20Haddouti.pdf',3);
insert into candidate_docs(id, type, url, candidate) values(24,'DESCRIPTION','https://www.dropbox.com/s/urflhmlcyrebvjv/Task%20description%20El%20Haddouti%20Internship.pdf',3);

insert into candidate_docs(id, type, url, candidate) values(31,'CV','https://www.dropbox.com/s/su5zapr1m6i2mv3/CVJoachimGalaski.pdf',4);
insert into candidate_docs(id, type, url, candidate) values(32,'MOT','https://www.dropbox.com/s/33na1v0v6dnswxu/Lettre%20de%20motivation%20BSSE.pdf',4);
insert into candidate_docs(id, type, url, candidate) values(33,'ESTIMATE','https://www.dropbox.com/s/adfrapboi6rzrv8/Estimation%20budget%20BSSE.pdf',4);
insert into candidate_docs(id, type, url, candidate) values(34,'DESCRIPTION','https://www.dropbox.com/s/d39cp2iiwtjdhi7/Description%20stage%20BSSE.pdf',4);

insert into candidate_docs(id, type, url, candidate) values(41,'CV','https://www.dropbox.com/s/5d8fhyq86phd1mx/CV%20S%C3%A9bastien%20Hachez%20Fr.pdf',5);
insert into candidate_docs(id, type, url, candidate) values(42,'MOT','https://www.dropbox.com/s/syyd7gohbaescqi/Hachez%20S%C3%A9bastien%20lettre%20de%20motivation%20BSSE.pdf',5);
insert into candidate_docs(id, type, url, candidate) values(43,'ESTIMATE','https://www.dropbox.com/s/lbh7m5tcojgzxod/Hachez%20S%C3%A9bastien%20estimation%20du%20budget%20BSSE.pdf',5);
insert into candidate_docs(id, type, url, candidate) values(44,'DESCRIPTION','https://www.dropbox.com/s/m0it9wbdl5jxp98/Hachez%20S%C3%A9bastien%20Description%20de%20l%27entreprise%20et%20du%20stage.pdf',5);

insert into candidate_docs(id, type, url, candidate) values(51,'CV','https://www.dropbox.com/s/gxy3ne61p23caee/CV.pdf',6);
insert into candidate_docs(id, type, url, candidate) values(52,'MOT','https://www.dropbox.com/s/a9982flfeiuj2mj/lettre_de_motivation.pdf',6);
insert into candidate_docs(id, type, url, candidate) values(53,'ESTIMATE','https://www.dropbox.com/s/w8w5bhkrdqco4tn/BSSE-Formulaire_budget%20%281%29.pdf',6);
insert into candidate_docs(id, type, url, candidate) values(54,'DESCRIPTION','https://www.dropbox.com/s/311pl8u4q7xwtpw/Description%20du%20RIC%20et%20du%20stage.pdf',6);

insert into candidate_docs(id, type, url, candidate) values(61,'CV','https://www.dropbox.com/s/dlob5xz6rqnmn13/cv_trungcangdo.pdf',7);
insert into candidate_docs(id, type, url, candidate) values(62,'MOT','https://www.dropbox.com/s/lh0vurofg4714nw/candi_bsse.pdf',7);
insert into candidate_docs(id, type, url, candidate) values(63,'ESTIMATE','https://www.dropbox.com/s/eu16xds2fadaq0p/BSSE_formulaire.pdf',7);
insert into candidate_docs(id, type, url, candidate) values(64,'DESCRIPTION','https://www.dropbox.com/s/vawg3gs9btd8utk/description_entreprise.pdf',7);
