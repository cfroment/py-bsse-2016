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

insert into evaluator(id, name, email, password) values(0,'Admin', 'admin@bsse.be','2015bsse');
insert into evaluator(id,name,email,password) values(1,'Corentin Froment','corentin.froment@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(2,'Laurent Huenaerts','laurent.huenaerts@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(3,'Adrien Lebrun','adri.lebrun@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(4,'Amaury Caprasse','amaury.caprasse@diplobel.fed.be','bsse2015');
insert into evaluator(id,name,email,password) values(5,'Benjamin Genêt','benjamin.genet@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(6,'Benoit Mattlet','bmattlet@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(7,'Bernard Campion','campionbernard@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(8,'Bruno Van Tuykom','bvtuykom@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(9,'Candice Nagel','candice.l.nagel@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(10,'Cedric Boey','cboey@ulb.ac.be','bsse2015');
insert into evaluator(id,name,email,password) values(11,'Charlotte Philippe','charlotteke.philippe@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(12,'Christophe Van Durme','cvdurme@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(13,'Constantin Delhaute','delhaute@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(14,'Damien Hemmeryckx','damien.he@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(15,'Dimitri Vanbellinghen','dimitri.vanbellinghen@gdfsuez.com','bsse2015');
insert into evaluator(id,name,email,password) values(16,'Dimitri Van Assche','dvassche@ulb.ac.be','bsse2015');
insert into evaluator(id,name,email,password) values(17,'Florence Scottini','fscottin@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(18,'François-Xavier Dubois','duboisfx@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(19,'Frederic Gaillard','gaillardfrederic@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(20,'Laura Jacobs','loly_136@hotmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(21,'Laurent Rabinowitch','lrabinow@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(22,'Marc Remiche','marc.remiche@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(23,'Nicolas Goessens','ngoessens@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(24,'Olivier Hogne','olivier@hogne.com','bsse2015');
insert into evaluator(id,name,email,password) values(25,'Philippe Nemery','pnemery@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(26,'Pierre Henneaux','pierre.henneaux@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(27,'Quentin Jossen','qjossen@ulb.ac.be','bsse2015');
insert into evaluator(id,name,email,password) values(28,'Robert Salvessen','robert.salvesen@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(29,'Sebastien Massin','sebmassin@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(30,'Yue Hong Zhang','Zhang.Yue.Hong@bcg.com','bsse2015');
insert into evaluator(id,name,email,password) values(31,'Gaetan Deknop','gdeknop@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(32,'Amandine Caprasse','amandine.caprasse@ulb.ac.be','bsse2015');
insert into evaluator(id,name,email,password) values(33,'Antoine Nonclercq','anoncler@ulb.ac.be','bsse2015');
insert into evaluator(id,name,email,password) values(34,'Jean-Christophe Fann','jcfann@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(35,'Arnaud Goessens','arnaud.goessens@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(36,'Raoul Sommeillier','raoul.sommeillier@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(37,'Nathaniel Jesuran','nathaniel.jesuran@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(38,'Nathalie Teper','nathalieteper@hotmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(39,'Raphaël Dufour','rdufour@ulb.ac.be','bsse2015');
insert into evaluator(id,name,email,password) values(40,'Maxime Vande Ghinste','mvdeghin@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(41,'Simon Goldstein','simongoldstein9@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(42,'François Remy','francois.remy@live.be','bsse2015');
insert into evaluator(id,name,email,password) values(43,'Kevin Fonck','kevinkfonck@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(44,'Ophélie Anrys','oanrys@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(45,'Sabrina Orban','sab.orban@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(46,'Lothar Petit','lothar.arkady@gmail.com','bsse2015');
insert into evaluator(id,name,email,password) values(47,'Maxime Defour','kevinkfonck@gmail.com','bsse2015');


insert into candidate(id, name, email, year, destination, company) values(1, 'Natalie Trejmak', 'natalia.trejmak@ulb.ac.be', 'MA1', 'Abu Dhabi, United Arab Emirates', 'ADNOC');
insert into candidate(id, name, email, year, destination, company) values(2, 'Antoine Mouraux', 'antoine.mouraux@ulb.ac.be ', 'MA1', 'London, UK', 'Aspire CREATe');
insert into candidate(id, name, email, year, destination, company) values(3, 'Kevin Malgarini', 'kmalgari@ulb.ac.be', 'MA1', 'Montreal, Canada', 'NRC');
insert into candidate(id, name, email, year, destination, company) values(4, 'Manoé De Neck', 'manoedeneck@hotmail.com', 'MA1', 'Madagascar', 'Honko Mangrove Conservation & Education');
insert into candidate(id, name, email, year, destination, company) values(5, 'Pierre Loic Bacq', 'pierbacq@ulb.ac.be', 'MA1', 'East Lansing, MI, USA', 'Michigan State University');
insert into candidate(id, name, email, year, destination, company) values(6, 'Marceau Lecomte', 'marceau.lecomte@ulb.ac.be', 'MA1', 'Boston, MA, USA', 'Harvard Innovation Lab');
insert into candidate(id, name, email, year, destination, company) values(7, 'Laura Hermans', 'laura.hermans@ulb.ac.be', 'MA1', 'Boston, MA, USA', 'Harvard University');
insert into candidate(id, name, email, year, destination, company) values(8, 'Antoine Huet', 'Antoine.Huet@ulb.ac.be', 'MA1', 'Berlin, Germany', 'MicroDiscovery');
insert into candidate(id, name, email, year, destination, company) values(9, 'Hoi An Do', 'hoaian.do.2304@gmail.com', 'MA1', 'London, UK', 'University College London');
insert into candidate(id, name, email, year, destination, company) values(10, 'Giuseppe Cecchini', 'giuseppe.cecchini@outlook.it', 'MA1 ', 'Montreal, Canada', 'Aerospace Manufacturing Technologies');
insert into candidate(id, name, email, year, destination, company) values(11, 'Jonathan Dan', 'jonathan.dan@ulb.ac.be', 'MA1', 'Montreal, Canada', 'Montreal Neurological Institute, McGill University');
insert into candidate(id, name, email, year, destination, company) values(12, 'Amaury Genard', 'Amaury.Genard@ulb.ac.be', 'MA1', 'Beijing, China', 'Peking University');
insert into candidate(id, name, email, year, destination, company) values(13, 'Nicolas te Kolsté', 'Nicolas_tekolste@hotmail.com', 'BA2', 'Democratic Republic of Congon', 'ONG EuropAfrique Congo asbl');
insert into candidate(id, name, email, year, destination, company) values(14, 'Sibylle Torfs', 'sibylle.torfs@ulb.ac.be', 'MA1', 'London, UK', 'Artelia UK');
insert into candidate(id, name, email, year, destination, company) values(15, 'Maxime Boninsegna', 'boninsegna@gmail.com', 'MA1', 'Modena, Italy', 'HPE COXA');
insert into candidate(id, name, email, year, destination, company) values(16, 'Samia Bouzoubaa', 'samia.bouzoubaa@ulb.ac.be', 'MA1', 'Barcelona, Spain', 'International Center for Numerical Methods');
insert into candidate(id, name, email, year, destination, company) values(17, 'Soukaina Ouahabi', 'soukaina-ouahabi@hotmail.fr', 'MA1', 'Casablanca, Morocco', 'Uni archi');
insert into candidate(id, name, email, year, destination, company) values(18, 'Christia Jabbour', 'christia_jabbour@hotmail.com', 'MA1', 'Lebanon', 'Advanced Plastic Industries');
insert into candidate(id, name, email, year, destination, company) values(19, 'Alvaro Lloret de Muller', 'alvaro_lloret@hotmail.com', 'MA1', 'Zhongshan, Guangdong, China', 'Morosof');
insert into candidate(id, name, email, year, destination, company) values(20, 'Sidney de Coninck', 'sidneydc@hotmail.com', 'MA1', 'Tokyo, Japan', 'Zero Moment Point');

insert into candidate_docs(id, type, url, candidate) values (101,'CV','https://www.dropbox.com/s/42k76oni8xsmi2v/NTR_CV.pdf', 1);
insert into candidate_docs(id, type, url, candidate) values (102,'MOT','https://www.dropbox.com/s/c4uh1hzu9vgmqmd/NTR_coverletter.pdf', 1);
insert into candidate_docs(id, type, url, candidate) values (103,'OTHER','https://www.dropbox.com/s/w4v8w3938md6sg4/NTR_Description.pdf', 1);
insert into candidate_docs(id, type, url, candidate) values (104,'OTHER','https://www.dropbox.com/s/242ec2renqhyytb/NTR_BSSE-Formulaire_budget.pdf', 1);

insert into candidate_docs(id, type, url, candidate) values (201,'CV','https://www.dropbox.com/s/eqz7f3finr8uman/CV_fran%C3%A7ais.pdf', 2);
insert into candidate_docs(id, type, url, candidate) values (202,'MOT','https://www.dropbox.com/s/yhd7j5eqek2bzdc/lettre%20de%20motivation%20BSSE.pdf', 2);
insert into candidate_docs(id, type, url, candidate) values (203,'OTHER','https://www.dropbox.com/s/8xe3pr4z5o6u7wv/BSSE_budget.pdf', 2);
insert into candidate_docs(id, type, url, candidate) values (204,'OTHER','https://www.dropbox.com/s/1giy95eta66xihn/Description%20du%20stage.pdf', 2);

insert into candidate_docs(id, type, url, candidate) values (301,'CV','https://www.dropbox.com/s/awfvc57c8aut8a9/MALGARINI-CV.pdf', 3);
insert into candidate_docs(id, type, url, candidate) values (302,'MOT','https://www.dropbox.com/s/gelxzctfqfc26gu/MALGARINI-LM.pdf', 3);
insert into candidate_docs(id, type, url, candidate) values (303,'OTHER','https://www.dropbox.com/s/vibb0bc3wth2qgx/MALGARINI-projet.pdf?dl=0', 3);
insert into candidate_docs(id, type, url, candidate) values (304,'OTHER','https://www.dropbox.com/s/pl324pwb5y2pfxl/MALGARINI-budget.pdf?dl=0', 3);

insert into candidate_docs(id, type, url, candidate) values (401,'CV','https://www.dropbox.com/s/8m5s8yfwdiltmtw/manoe_de_neck_cv.pdf?dl=0', 4);
insert into candidate_docs(id, type, url, candidate) values (402,'MOT','https://www.dropbox.com/s/qld96e10polhspz/manoe_de_neck_motivation.pdf?dl=0', 4);
insert into candidate_docs(id, type, url, candidate) values (403,'OTHER','https://www.dropbox.com/s/dcy80ds55a69sz5/manoe_de_neck_description.pdf?dl=0', 4);
insert into candidate_docs(id, type, url, candidate) values (404,'OTHER','https://www.dropbox.com/s/q6d8h34sk7o8s9a/manoe_de_neck_budget.pdf?dl=0', 4);

insert into candidate_docs(id, type, url, candidate) values (501,'CV','https://www.dropbox.com/s/m5320afnynda0mc/pierre_loic_bacq_cv.pdf?dl=0', 5);
insert into candidate_docs(id, type, url, candidate) values (502,'MOT','https://www.dropbox.com/s/ijtfyycwmcequov/pierre_loic_bacq_motivation.pdf?dl=0', 5);
insert into candidate_docs(id, type, url, candidate) values (503,'OTHER','https://www.dropbox.com/s/954383qzf2skn9v/pierre_loic_bacq_description.pdf?dl=0', 5);
insert into candidate_docs(id, type, url, candidate) values (504,'OTHER','https://www.dropbox.com/s/gstim7kdm48upjk/pierre_loic_bacq_BSSE-Formulaire_budget.doc?dl=0', 5);

insert into candidate_docs(id, type, url, candidate) values (601,'CV','https://www.dropbox.com/s/u8ng133w08kuwgv/marceau_lecomte_cv.pdf?dl=0', 6);
-- insert into candidate_docs(id, type, url, candidate) values (602,'MOT','', 6);
insert into candidate_docs(id, type, url, candidate) values (603,'OTHER','https://www.dropbox.com/s/ei7xkdgjp4ehemg/marceau_lecomte_description.pdf?dl=0', 6);
insert into candidate_docs(id, type, url, candidate) values (604,'OTHER','https://www.dropbox.com/s/sz5neg9p1mqon7j/marceau_lecomte_budget.pdf?dl=0', 6);

insert into candidate_docs(id, type, url, candidate) values (701,'CV','https://www.dropbox.com/s/tgexzrvfswp7j0q/laura_hermans_cv.pdf?dl=0', 7);
insert into candidate_docs(id, type, url, candidate) values (702,'MOT','https://www.dropbox.com/s/bn7hfqv13qgu8h5/laura_hermans_motivation.pdf?dl=0', 7);
insert into candidate_docs(id, type, url, candidate) values (703,'OTHER','https://www.dropbox.com/s/4h75xv3knozstgq/laura_hermans_budget.pdf?dl=0', 7);
insert into candidate_docs(id, type, url, candidate) values (704,'OTHER','https://www.dropbox.com/s/wj0vj5ekncnaz6f/laura_hermans_description.pdf?dl=0', 7);

insert into candidate_docs(id, type, url, candidate) values (801,'CV','https://www.dropbox.com/s/z9ro651gu7zbd1d/CV%20-%20HUET.pdf?dl=0', 8);
-- insert into candidate_docs(id, type, url, candidate) values (802,'MOT','', 8);
insert into candidate_docs(id, type, url, candidate) values (803,'OTHER','https://www.dropbox.com/s/dv93gzd2q1l366x/Description%20de%20l%E2%80%99entreprise%20et%20du%20stage%20-%20HUET.pdf?dl=0', 8);
insert into candidate_docs(id, type, url, candidate) values (804,'OTHER','https://www.dropbox.com/s/fegwh0ck1uibfr4/BSSE-Formulaire_budget%20-%20HUET.doc?dl=0', 8);

insert into candidate_docs(id, type, url, candidate) values (901,'CV','https://www.dropbox.com/s/sts8aa36d63wk2p/Hoai%20An%20DO%20-%20Polytech%20MA1%20%28FR%29.pdf?dl=0', 9);
insert into candidate_docs(id, type, url, candidate) values (902,'MOT','https://www.dropbox.com/s/oygiw7a2tylltno/bsse.pdf?dl=0', 9);
insert into candidate_docs(id, type, url, candidate) values (903,'OTHER','https://www.dropbox.com/s/3dp6ctyoigxfs6u/BSSE-Formulaire_budget.pdf?dl=0', 9);
insert into candidate_docs(id, type, url, candidate) values (904,'OTHER','https://www.dropbox.com/s/e3cabkfi52hg3jm/description.pdf?dl=0', 9);

insert into candidate_docs(id, type, url, candidate) values (1001,'CV','https://www.dropbox.com/s/2n0i40uw3mns7m8/CV_Giuseppe_Cecchini.pdf?dl=0', 10);
insert into candidate_docs(id, type, url, candidate) values (1002,'MOT','https://www.dropbox.com/s/0lunysmycl5g939/Lettre_Motivation_Giuseppe_Cecchini.pdf?dl=0', 10);
insert into candidate_docs(id, type, url, candidate) values (1003,'OTHER','https://www.dropbox.com/s/pwstn1xazukmav0/Description_Stage_Entreprise_Giuseppe_Cecchini.pdf?dl=0', 10);
insert into candidate_docs(id, type, url, candidate) values (1004,'OTHER','https://www.dropbox.com/s/ekhndkorcjd8t7q/Formulaire_budget_Giuseppe_Cecchini.pdf?dl=0', 10);

insert into candidate_docs(id, type, url, candidate) values (1101,'CV','https://www.dropbox.com/s/wx1u78qtq9dzx7t/Jonathan_Dan-cv.pdf?dl=0', 11);
insert into candidate_docs(id, type, url, candidate) values (1102,'MOT','https://www.dropbox.com/s/52sp69yz5g32o10/Jonathan_Dan-motivation.pdf?dl=0', 11);
insert into candidate_docs(id, type, url, candidate) values (1103,'OTHER','https://www.dropbox.com/s/3vay2edguqoyyps/Jonathan_Dan-budget.pdf?dl=0', 11);
insert into candidate_docs(id, type, url, candidate) values (1104,'OTHER','https://www.dropbox.com/s/47qe18qfr6hlocu/Jonathan_Dan-description_stage.pdf?dl=0', 11);

insert into candidate_docs(id, type, url, candidate) values (1201,'CV','https://www.dropbox.com/s/poxgl8g0t6ev5xn/CV_Amaury_GENARD.pdf?dl=0', 12);
insert into candidate_docs(id, type, url, candidate) values (1202,'MOT','https://www.dropbox.com/s/yvznhdq27zmcv76/Lettre_De_Motivation_Amaury_GENARD.pdf?dl=0', 12);
insert into candidate_docs(id, type, url, candidate) values (1203,'OTHER','https://www.dropbox.com/s/9qt15fbdnafsbtl/Description_Universit%C3%A9_Stage_Amaury_GENARD.pdf?dl=0', 12);
insert into candidate_docs(id, type, url, candidate) values (1204,'OTHER','https://www.dropbox.com/s/c260ixf4grytjvj/D%C3%A9tail_Budget_Amaury_GENARD.pdf?dl=0', 12);

insert into candidate_docs(id, type, url, candidate) values (1301,'CV','https://www.dropbox.com/s/sdopjg3y7laiaty/C.V.%20Nicolas%20te%20Kolste%C3%AC.pdf?dl=0', 13);
insert into candidate_docs(id, type, url, candidate) values (1302,'MOT','https://www.dropbox.com/s/b98xaxemfklgpia/Lettre%20de%20motivation.pdf?dl=0', 13);
insert into candidate_docs(id, type, url, candidate) values (1303,'OTHER','https://www.dropbox.com/s/jprg0obzdzhegz1/BSSE%20Formulaire%20budget.pdf?dl=0', 13);
insert into candidate_docs(id, type, url, candidate) values (1304,'OTHER','https://www.dropbox.com/s/fqj3swd08w3qyv7/Pre%C4%97sentation%20du%20projet%20de%20stage.pdf?dl=0', 13);

insert into candidate_docs(id, type, url, candidate) values (1401,'CV','https://www.dropbox.com/s/6pjnlo1ok12a3au/Torfs_cv.pdf?dl=0', 14);
insert into candidate_docs(id, type, url, candidate) values (1402,'MOT','https://www.dropbox.com/s/oszqhy6z0lby655/Torfs_motivation.pdf?dl=0', 14);
insert into candidate_docs(id, type, url, candidate) values (1403,'OTHER','https://www.dropbox.com/s/zk89v3ouje7mtzn/Torfs_desription.pdf?dl=0', 14);
insert into candidate_docs(id, type, url, candidate) values (1404,'OTHER','https://www.dropbox.com/s/e617mv2yzqhio65/Torfs_Formulaire_budget.pdf?dl=0', 14);

insert into candidate_docs(id, type, url, candidate) values (1501,'CV','https://www.dropbox.com/s/0awl1pkhs2kh50g/CV%20Internship.pdf?dl=0', 15);
insert into candidate_docs(id, type, url, candidate) values (1502,'MOT','https://www.dropbox.com/s/eh6zk074046bn7c/Lettre%20de%20motivation.pdf?dl=0', 15);
insert into candidate_docs(id, type, url, candidate) values (1503,'OTHER','https://www.dropbox.com/s/6h1qyiu8lyvykn4/Description%20de%20l%27entreprise%20et%20du%20stage.pdf?dl=0', 15);
insert into candidate_docs(id, type, url, candidate) values (1504,'OTHER','https://www.dropbox.com/s/qp7w7pgqp34sb2s/Estimation%20budget.pdf?dl=0', 15);

insert into candidate_docs(id, type, url, candidate) values (1601,'CV','https://www.dropbox.com/s/1mohety35bkpkt3/Resume-Samia%20BOUZOUBAA-FR.pdf?dl=0', 16);
insert into candidate_docs(id, type, url, candidate) values (1602,'MOT','https://www.dropbox.com/s/xturdnugwmyrqdl/Motivation%20stage%20BSSE.pdf?dl=0', 16);
insert into candidate_docs(id, type, url, candidate) values (1603,'OTHER','https://www.dropbox.com/s/1ecpy6cmqhodt5y/Description%20stage%20BSSE.pdf?dl=0', 16);
insert into candidate_docs(id, type, url, candidate) values (1604,'OTHER','https://www.dropbox.com/s/fdbfx15q2pxd2us/BSSE-Formulaire_budget.pdf?dl=0', 16);

insert into candidate_docs(id, type, url, candidate) values (1701,'CV','https://www.dropbox.com/s/vux6mb3cyzyde65/CV%20%20.pdf?dl=0', 17);
insert into candidate_docs(id, type, url, candidate) values (1702,'MOT','https://www.dropbox.com/s/tzjwxxd0nzei16r/Lettre%20de%20motivation.pdf?dl=0', 17);
insert into candidate_docs(id, type, url, candidate) values (1703,'OTHER','https://www.dropbox.com/s/df26wxs68n6p6hy/Description%20de%20l%27entreprise%20.pdf?dl=0', 17);
insert into candidate_docs(id, type, url, candidate) values (1704,'OTHER','https://www.dropbox.com/s/byc9qw9j2dso7pg/BSSE-Formulaire_budget.doc?dl=0', 17);

insert into candidate_docs(id, type, url, candidate) values (1801,'CV','https://www.dropbox.com/s/fx6gjb86kb5rtgx/CJ%20CV%20PDF.pdf?dl=0', 18);
insert into candidate_docs(id, type, url, candidate) values (1802,'MOT','https://www.dropbox.com/s/7tnu71faaxzq42n/CJ%20Cover%20Letter.docx?dl=0', 18);
insert into candidate_docs(id, type, url, candidate) values (1803,'OTHER','https://www.dropbox.com/s/4a1ttf3fy2k8inw/Description%20of%20the%20company%20%26%20Budget.docx?dl=0', 18);
-- insert into candidate_docs(id, type, url, candidate) values (1804,'OTHER','', 18);

insert into candidate_docs(id, type, url, candidate) values (1901,'CV','https://www.dropbox.com/s/xu4gc4vclrhpdtg/CV_Alvaro_Lloret_french.pdf?dl=0', 19);
insert into candidate_docs(id, type, url, candidate) values (1902,'MOT','https://www.dropbox.com/s/gi9d8g3ybk3oq3j/Carte%20Motivation%20Stage.pdf?dl=0', 19);
insert into candidate_docs(id, type, url, candidate) values (1903,'OTHER','https://www.dropbox.com/s/xu4gc4vclrhpdtg/CV_Alvaro_Lloret_french.pdf?dl=0', 19);
insert into candidate_docs(id, type, url, candidate) values (1904,'OTHER','https://www.dropbox.com/s/urj9jp78pjugt4l/BSSE-Formulaire_budget.pdf?dl=0', 19);

insert into candidate_docs(id, type, url, candidate) values (2001,'CV','https://www.dropbox.com/s/ygyqz7a4psp1rz6/CVSidney.pdf?dl=0', 20);
insert into candidate_docs(id, type, url, candidate) values (2002,'MOT','https://www.dropbox.com/s/9u6eovbkp3d7ws7/Lettre%20de%20motivation.pdf?dl=0', 20);
insert into candidate_docs(id, type, url, candidate) values (2003,'OTHER','https://www.dropbox.com/s/743vz24gq0lhpta/Description-de-lenterprise-V3.pdf?dl=0', 20);
insert into candidate_docs(id, type, url, candidate) values (2004,'OTHER','https://www.dropbox.com/s/p8lkapl5dz46lhh/BSSE-Formulaire_budget.pdf?dl=0', 20);