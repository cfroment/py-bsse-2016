DROP TABLE IF EXISTS EVALUATION;
DROP TABLE IF EXISTS CANDIDATE_DOCS;
DROP TABLE IF EXISTS RANKING;
DROP TABLE IF EXISTS CANDIDATE;
DROP TABLE IF EXISTS EVALUATOR;
DROP TABLE IF EXISTS CRITERION;

CREATE TABLE CANDIDATE (COMPANY TEXT, ID INTEGER PRIMARY KEY, NAME TEXT, EMAIL TEXT, YEAR TEXT, DESTINATION TEXT);
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

insert into evaluator(id, name, email, password) values(0,'Admin', 'admin@bsse.be','2016bsse');
insert into evaluator(id,name,email,password) values(1,'Corentin Froment','corentin.froment@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(2,'Laurent Huenaerts','laurent.huenaerts@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(3,'Adrien Lebrun','adri.lebrun@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(4,'Amaury Caprasse','amaury.caprasse@diplobel.fed.be','bsse2016');
insert into evaluator(id,name,email,password) values(5,'Benjamin Genêt','benjamin.genet@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(6,'Benoit Mattlet','bmattlet@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(7,'Bernard Campion','campionbernard@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(8,'Bruno Van Tuykom','bvtuykom@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(9,'Candice Nagel','candice.l.nagel@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(10,'Cedric Boey','cboey@ulb.ac.be','bsse2016');
insert into evaluator(id,name,email,password) values(11,'Charlotte Philippe','charlotteke.philippe@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(12,'Christophe Van Durme','cvdurme@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(13,'Constantin Delhaute','delhaute@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(14,'Damien Hemmeryckx','damien.he@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(15,'Dimitri Vanbellinghen','dimitri.vanbellinghen@gdfsuez.com','bsse2016');
insert into evaluator(id,name,email,password) values(16,'Dimitri Van Assche','dvassche@ulb.ac.be','bsse2016');
insert into evaluator(id,name,email,password) values(17,'Florence Scottini','fscottin@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(18,'François-Xavier Dubois','duboisfx@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(19,'Frederic Gaillard','gaillardfrederic@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(20,'Laura Jacobs','loly_136@hotmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(21,'Laurent Rabinowitch','lrabinow@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(22,'Marc Remiche','marc.remiche@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(23,'Nicolas Goessens','ngoessens@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(24,'Olivier Hogne','olivier@hogne.com','bsse2016');
insert into evaluator(id,name,email,password) values(25,'Philippe Nemery','pnemery@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(26,'Pierre Henneaux','pierre.henneaux@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(27,'Quentin Jossen','qjossen@ulb.ac.be','bsse2016');
insert into evaluator(id,name,email,password) values(28,'Robert Salvessen','robert.salvesen@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(29,'Sebastien Massin','sebmassin@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(30,'Yue Hong Zhang','Zhang.Yue.Hong@bcg.com','bsse2016');
insert into evaluator(id,name,email,password) values(31,'Gaetan Deknop','gdeknop@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(32,'Amandine Caprasse','amandine.caprasse@ulb.ac.be','bsse2016');
insert into evaluator(id,name,email,password) values(33,'Antoine Nonclercq','anoncler@ulb.ac.be','bsse2016');
insert into evaluator(id,name,email,password) values(34,'Jean-Christophe Fann','jcfann@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(35,'Arnaud Goessens','arnaud.goessens@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(36,'Raoul Sommeillier','raoul.sommeillier@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(37,'Nathaniel Jesuran','nathaniel.jesuran@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(38,'Nathalie Teper','nathalieteper@hotmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(39,'Raphaël Dufour','rdufour@ulb.ac.be','bsse2016');
insert into evaluator(id,name,email,password) values(40,'Maxime Vande Ghinste','mvdeghin@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(41,'Simon Goldstein','simongoldstein9@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(42,'François Remy','francois.remy@live.be','bsse2016');
insert into evaluator(id,name,email,password) values(43,'Kevin Fonck','kevinkfonck@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(44,'Ophélie Anrys','oanrys@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(45,'Sabrina Orban','sab.orban@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(46,'Lothar Petit','lothar.arkady@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(47,'Maxime Defour','kevinkfonck@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(48,'Bruno Przetakiewicz','bruno@brunop.be','bsse2016');
insert into evaluator(id,name,email,password) values(49,'Gatien Gillon','ggillon@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(50,'Alexia Verbrugge','alexia.verbrugge@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(51,'Charlotte de Formanoir','charlottedeformanoir@hotmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(52,'Jonathan Bodart','jon.bodart@gmail.com','bsse2016');
insert into evaluator(id,name,email,password) values(53,'Rolande Mignolet','rolande.mignolet@gmail.com','bsse2016');


insert into candidate(id, name, email, year, destination, company) values(1, 'Elisabeth de Halleux', 'eldehall@ulb.ac.be', 'MA1', 'London, United Kingdom', 'University College of London, CREATe');
insert into candidate(id, name, email, year, destination, company) values(2, 'Alan Lintermans', 'alan.lintermans@gmail.com', 'MA1', 'London, United Kingdom', 'University College of London, CREATe');
insert into candidate(id, name, email, year, destination, company) values(3, 'Marine Lewuillon', 'mlewuill@ulb.ac.be', 'MA2', 'Guadeloupe', 'APECA ASBL');
insert into candidate(id, name, email, year, destination, company) values(4, 'Zacharie De Guchteneere', 'zdegucht@gmail.com', 'MA1', 'Hô-Chi-Minh, Vietnam', 'La petite épicerie de Saigon');
insert into candidate(id, name, email, year, destination, company) values(5, 'Lucie Nader', 'nader.lucie@gmail.com', 'MA2', 'Brussels, Belgium/Benin', 'CO2Logic/Eco-Benin');
insert into candidate(id, name, email, year, destination, company) values(6, 'Daniel Al Sayegh', 'daniel.sayegh@outlook.com', 'MA1', 'Paris, France', 'Victory Buyck Steel Construction');
insert into candidate(id, name, email, year, destination, company) values(7, 'Jens De Koster', 'jensdekoster@telenet.be', 'MA1', 'Leiden, the Netherlands', 'BESIX');
insert into candidate(id, name, email, year, destination, company) values(8, 'Louise Legein', 'llegein@ulb.ac.be', 'MA1', 'Nepal', 'FORWARD Nepal');
insert into candidate(id, name, email, year, destination, company) values(9, 'Lesly Zerna', 'lesly.zerna.bo7@gmail.com', 'MA1', 'Milan, Italy', 'Department of Electronics, Information and Bioengineering of Politecnico di Milano');
insert into candidate(id, name, email, year, destination, company) values(10, 'Pierre-Alexandre Petitjean', 'ppetitje@ulb.ac.be', 'MA1', 'Aachen, Germany', 'University of Aachen');
insert into candidate(id, name, email, year, destination, company) values(11, 'Mathieu Cavenaile', 'mthcavenaile@gmail.com', 'MA1', 'London, United-Kingdom', 'University College of London, Department of Medical Pysics and Biomedical Engineering');
insert into candidate(id, name, email, year, destination, company) values(12, 'Marta Millet', 'martadsv@gmail.com', 'MA1', 'Duderstadt, Germany(?)', 'OttoBock(?)');


insert into candidate_docs(id, type, url, candidate) values (101,'OTHER','https://www.dropbox.com/s/6ab4mjurrpxt9ws/budget.pdf?dl=0', 1);
insert into candidate_docs(id, type, url, candidate) values (102,'CV','https://www.dropbox.com/s/y8sdeqqbbpgb8pc/cv.pdf?dl=0', 1);
insert into candidate_docs(id, type, url, candidate) values (103,'OTHER','https://www.dropbox.com/s/edbab2gy67ejjr9/description.pdf?dl=0', 1);
insert into candidate_docs(id, type, url, candidate) values (104,'MOT','https://www.dropbox.com/s/kghyse3ycqw95vg/motivation.pdf?dl=0', 1);

insert into candidate_docs(id, type, url, candidate) values (201,'OTHER','https://www.dropbox.com/s/5xxb6bruo0n1tgf/budget.pdf?dl=0', 2);
insert into candidate_docs(id, type, url, candidate) values (202,'CV','https://www.dropbox.com/s/9hvw15vf4iq8uxs/cv.pdf?dl=0', 2);
insert into candidate_docs(id, type, url, candidate) values (203,'OTHER','https://www.dropbox.com/s/tyt1ozbx105fy6w/description.pdf?dl=0', 2);
insert into candidate_docs(id, type, url, candidate) values (204,'MOT','https://www.dropbox.com/s/fuoihfqhii0efos/motivation.pdf?dl=0', 2);

insert into candidate_docs(id, type, url, candidate) values (301,'OTHER','https://www.dropbox.com/s/6temdrwzuieiunb/budget.docx?dl=0', 3);
insert into candidate_docs(id, type, url, candidate) values (302,'CV','https://www.dropbox.com/s/imfc5p7g61te46b/cv.docx?dl=0', 3);
insert into candidate_docs(id, type, url, candidate) values (303,'OTHER','https://www.dropbox.com/s/wc37s3psrsnci3v/description.docx?dl=0', 3);
insert into candidate_docs(id, type, url, candidate) values (304,'MOT','https://www.dropbox.com/s/lb3y3rzfo8cjbtc/motivation.docx?dl=0', 3);

insert into candidate_docs(id, type, url, candidate) values (401,'OTHER','https://www.dropbox.com/s/cyz7msio5pus063/budget.pdf?dl=0', 4);
insert into candidate_docs(id, type, url, candidate) values (402,'CV','https://www.dropbox.com/s/5sp8jxpwpvd7bgf/cv.pdf?dl=0', 4);
insert into candidate_docs(id, type, url, candidate) values (403,'OTHER','https://www.dropbox.com/s/z7bt5suwy0oev3u/description.pdf?dl=0', 4);
insert into candidate_docs(id, type, url, candidate) values (404,'MOT','https://www.dropbox.com/s/savct2y5ftr5h83/motivation.pdf?dl=0', 4);

insert into candidate_docs(id, type, url, candidate) values (501,'OTHER','https://www.dropbox.com/s/20sagl3azbryg03/budget.pdf?dl=0', 5);
insert into candidate_docs(id, type, url, candidate) values (502,'CV','https://www.dropbox.com/s/zd71hqzhehdkdh7/cv.pdf?dl=0', 5);
insert into candidate_docs(id, type, url, candidate) values (503,'OTHER','https://www.dropbox.com/s/zyq4zilk8361opa/description.pdf?dl=0', 5);
insert into candidate_docs(id, type, url, candidate) values (504,'MOT','https://www.dropbox.com/s/wn09od0u8hy66bi/motivation.pdf?dl=0', 5);

insert into candidate_docs(id, type, url, candidate) values (601,'OTHER','https://www.dropbox.com/s/soatuuqgcvahtk8/budget.pdf?dl=0', 6);
insert into candidate_docs(id, type, url, candidate) values (602,'CV','https://www.dropbox.com/s/ivmzy5w57ggy45h/cv.pdf?dl=0', 6);
insert into candidate_docs(id, type, url, candidate) values (603,'OTHER','https://www.dropbox.com/s/ur6s7y8d70d2mcw/description.pdf?dl=0', 6);
insert into candidate_docs(id, type, url, candidate) values (604,'MOT','https://www.dropbox.com/s/1ihn5rcu5kbcg91/motivation.pdf?dl=0', 6);

insert into candidate_docs(id, type, url, candidate) values (701,'OTHER','https://www.dropbox.com/s/w6a77kzxty9bted/budget.pdf?dl=0', 7);
insert into candidate_docs(id, type, url, candidate) values (702,'CV','https://www.dropbox.com/s/de1exjhiw96rbr1/cv.pdf?dl=0', 7);
insert into candidate_docs(id, type, url, candidate) values (703,'OTHER','https://www.dropbox.com/s/z4itjd2xpnsmapo/description.pdf?dl=0', 7);
insert into candidate_docs(id, type, url, candidate) values (704,'MOT','https://www.dropbox.com/s/nehr9zpfdwla5im/motivation.pdf?dl=0', 7);

insert into candidate_docs(id, type, url, candidate) values (801,'OTHER','https://www.dropbox.com/s/aaww9ru8hrbczbx/budget.pdf?dl=0', 8);
insert into candidate_docs(id, type, url, candidate) values (802,'CV','https://www.dropbox.com/s/n9dl86js2zio9je/cv.pdf?dl=0', 8);
insert into candidate_docs(id, type, url, candidate) values (803,'OTHER','https://www.dropbox.com/s/ks5r8z0lkcu424p/description.pdf?dl=0', 8);
insert into candidate_docs(id, type, url, candidate) values (804,'MOT','https://www.dropbox.com/s/adqsl0ogortyrsy/motivation.pdf?dl=0', 8);

insert into candidate_docs(id, type, url, candidate) values (901,'OTHER','https://www.dropbox.com/s/6l7ojjx5dwaljpj/budget.pdf?dl=0', 9);
insert into candidate_docs(id, type, url, candidate) values (902,'CV','https://www.dropbox.com/s/q89r3v8qlja1ar9/cv.pdf?dl=0', 9);
insert into candidate_docs(id, type, url, candidate) values (903,'OTHER','https://www.dropbox.com/s/tglroqwheqbv1ct/description.pdf?dl=0', 9);
insert into candidate_docs(id, type, url, candidate) values (904,'MOT','https://www.dropbox.com/s/qi4hibvjns4jd9c/motivation.pdf?dl=0', 9);

insert into candidate_docs(id, type, url, candidate) values (1001,'OTHER','https://www.dropbox.com/s/dj8r493ervlcgqy/description.pdf?dl=0', 10);
insert into candidate_docs(id, type, url, candidate) values (1002,'CV','https://www.dropbox.com/s/7lazecctoyjt9ne/cv.pdf?dl=0', 10);
insert into candidate_docs(id, type, url, candidate) values (1003,'OTHER','https://www.dropbox.com/s/dj8r493ervlcgqy/description.pdf?dl=0', 10);
insert into candidate_docs(id, type, url, candidate) values (1004,'MOT','https://www.dropbox.com/s/jai6qm63pe5e0fu/motivation.pdf?dl=0', 10);

insert into candidate_docs(id, type, url, candidate) values (1101,'OTHER','https://www.dropbox.com/s/08mxpmdweqg77dj/budget.pdf?dl=0', 11);
insert into candidate_docs(id, type, url, candidate) values (1102,'CV','https://www.dropbox.com/s/6zv12noft6043nb/cv.pdf?dl=0', 11);
insert into candidate_docs(id, type, url, candidate) values (1103,'OTHER','https://www.dropbox.com/s/vifm8h8yg5xmsfn/description.pdf?dl=0', 11);
insert into candidate_docs(id, type, url, candidate) values (1104,'MOT','https://www.dropbox.com/s/gs63wh1y5on2grw/motivation.pdf?dl=0', 11);

insert into candidate_docs(id, type, url, candidate) values (1201,'OTHER','https://www.dropbox.com/s/0duojejj6m6o926/budget.doc?dl=0', 12);
insert into candidate_docs(id, type, url, candidate) values (1202,'CV','https://www.dropbox.com/s/qn4w7vlzn8k4p2t/cv.pdf?dl=0', 12);
insert into candidate_docs(id, type, url, candidate) values (1203,'OTHER','https://www.dropbox.com/s/08dq3lcxw6io6kw/description.pdf?dl=0', 12);
insert into candidate_docs(id, type, url, candidate) values (1204,'MOT','https://www.dropbox.com/s/fhp4bo9sedxqfhu/motivation.pdf?dl=0', 12);
