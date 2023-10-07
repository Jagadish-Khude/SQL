--BLOCK
CREATE TABLE BLOCK
(BLOCKFLOOR INT NOT NULL ,
BLOCKCODE INT NOT NULL,
PRIMARY KEY (BLOCKFLOOR,BLOCKCODE));

INSERT ALL
INTO BLOCK VALUES(1,1)
INTO BLOCK VALUES(1,2)
INTO BLOCK VALUES(1,3)
INTO BLOCK VALUES(2,1)
INTO BLOCK VALUES(2,2)
INTO BLOCK VALUES(2,3)
INTO BLOCK VALUES(3,1)
INTO BLOCK VALUES(3,2)
INTO BLOCK VALUES(3,3)
INTO BLOCK VALUES(4,1)
INTO BLOCK VALUES(4,2)
INTO BLOCK VALUES(4,3)
SELECT *FROM DUAL;

--APPOINTMENT
CREATE TABLE appointment(
   appointmentid   INTEGER  PRIMARY KEY 
  ,patient         INTEGER  NOT NULL
  ,prepnurse       INTEGER 
  ,Physician       INTEGER  NOT NULL
  ,start_dt_time        VARCHAR(9) NOT NULL
  ,end_dt_time	        VARCHAR(9) NOT NULL
  ,examinationroom VARCHAR(1) NOT NULL
);

INSERT ALL 
INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt_time,end_dt_time,examinationroom) VALUES (13216584,100000001,101,1,'24/4/2008','24/4/2008','A')
INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt_time,end_dt_time,examinationroom) VALUES (26548913,100000002,101,2,'24/4/2008','24/4/2008','B')
INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt_time,end_dt_time,examinationroom) VALUES (36549879,100000001,102,1,'25/4/2008','25/4/2008','A')
INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt_time,end_dt_time,examinationroom) VALUES (46846589,100000004,103,4,'25/4/2008','25/4/2008','B')
INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt_time,end_dt_time,examinationroom) VALUES (59871321,100000004,NULL,4,'26/4/2008','26/4/2008','C')
INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt_time,end_dt_time,examinationroom) VALUES (69879231,100000003,103,2,'26/4/2008','26/4/2008','C')
INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt_time,end_dt_time,examinationroom) VALUES (76983231,100000001,NULL,3,'26/4/2008','26/4/2008','C')
INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt_time,end_dt_time,examinationroom) VALUES (86213939,100000004,102,9,'27/4/2008','21/4/2008','A')
INTO appointment(appointmentid,patient,prepnurse,Physician,start_dt_time,end_dt_time,examinationroom) VALUES (93216548,100000002,101,2,'27/4/2008','27/4/2008','B')
SELECT *FROM DUAL ;



--AFFILIATED WITH

CREATE TABLE affiliated_with(
   physician          INTEGER NOT NULL  REFERENCES PHYSICIAN(EMPLOYEEID)
  ,department         INTEGER  NOT NULL
  ,primaryaffiliation VARCHAR(1) NOT NULL
);
 DROP TABLE affiliated_with;


INSERT ALL 
 INTO affiliated_with VALUES (1,1,'t')
INTO affiliated_with VALUES(2,1,'t')
INTO affiliated_with VALUES(3,1,'f')
INTO affiliated_with VALUES(3,2,'t')
INTO affiliated_with VALUES(4,1,'t')
INTO affiliated_with VALUES(5,1,'t')
INTO affiliated_with VALUES(6,2,'t')
INTO affiliated_with VALUES(7,1,'f')
INTO affiliated_with VALUES(7,2,'t')
INTO affiliated_with VALUES(8,1,'t')
INTO affiliated_with VALUES(9,3,'t')
SELECT *FROM DUAL;



--PROCEDURE
CREATE TABLE procedure(
   code INTEGER NOT NULL PRIMARY KEY 
  ,name VARCHAR(30) NOT NULL
  ,cost INTEGER  NOT NULL
);


INSERT ALL
INTO procedure VALUES (1,'Reverse Rhinopodoplasty',1500)
INTO procedure VALUES (2,'Obtuse Pyloric Recombobulation',3750)
INTO procedure VALUES(3,'Folded Demiophtalmectomy',4500)
INTO procedure VALUES(4,'Complete Walletectomy',10000)
INTO procedure VALUES (5,'Obfuscated Dermogastrotomy',4899)
INTO procedure VALUES (6,'Reversible Pancreomyoplasty',5600)
INTO procedure VALUES (7,'Follicular Demiectomy',25)
SELECT *FROM DUAL;


--TRAINED_IN

CREATE TABLE trained_in(
   physician            INTEGER NOT NULL REFERENCES PHYSICIAN(EMPLOYEEID) 
  ,treatment            INTEGER  NOT NULL
  ,certificationdate    varchar(10)  NOT NULL
  ,certificationexpires varchar(10)  NOT NULL
);

INSERT ALL
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (3,1,'1/1/2008','31/12/2008')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (3,2,'1/1/2008','31/12/2008')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (3,5,'1/1/2008','31/12/2008')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (3,6,'1/1/2008','31/12/2008')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (3,7,'1/1/2008','31/12/2008')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (6,2,'1/1/2008','31/12/2008')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (6,5,'1/1/2007','31/12/2007')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (6,6,'1/1/2008','31/12/2008')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (7,1,'1/1/2008','31/12/2008')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (7,2,'1/1/2008','31/12/2008')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (7,3,'1/1/2008','31/12/2008')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (7,4,'1/1/2008','31/12/2008')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (7,5,'1/1/2008','31/12/2008')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (7,6,'1/1/2008','31/12/2008')
INTO trained_in(physician,treatment,certificationdate,certificationexpires)
 VALUES (7,7,'1/1/2008','31/12/2008')
 SELECT *FROM DUAL;

--PATIENT
CREATE TABLE Patient(
   ssn         INTEGER NOT NULL PRIMARY KEY 
  ,name        VARCHAR(17) NOT NULL
  ,address     VARCHAR(18) NOT NULL
  ,phone       VARCHAR(9) NOT NULL
  ,insuranceid INTEGER  NOT NULL
  ,pcp         INTEGER  NOT NULL REFERENCES PHYSICIAN(EMPLOYEEID)
);

INSERT ALL 
INTO Patient VALUES (100000001,'John Smith','42 Foobar Lane','555-0256',68476213,1)
INTO Patient VALUES(100000002,'Grace Ritchie','37 Snafu Drive','555-0512',36546321,2)
INTO Patient VALUES(100000003,'Random J. Patient','101 Omgbbq Street','555-1204',65465421,2)
INTO Patient VALUES(100000004,'Dennis Doe','1100 Foobaz Avenue','555-2048',68421879,3)
SELECT *FROM DUAL;

--NURSE
CREATE TABLE Nurse(
   employeeid INTEGER NOT NULL PRIMARY KEY 
  ,name       VARCHAR(15) NOT NULL
  ,position   VARCHAR(10) NOT NULL
  ,registered VARCHAR(1) NOT NULL
  ,ssn        INTEGER  NOT NULL
);

INSERT ALL
INTO Nurse VALUES(101,'Carla Espinosa','Head Nurse','t',111111110)
INTO Nurse VALUES(102,'Laverne Roberts','Nurse','t',222222220)
INTO Nurse VALUES(103,'Paul Flowers','Nurse','f',333333330)
SELECT*FROM DUAL;

--MEDICATION
CREATE TABLE MEDICATION(
   code        INTEGER  NOT NULL PRIMARY KEY 
  ,name        VARCHAR(13) NOT NULL
  ,brand       VARCHAR(23)
  ,description VARCHAR(3) NOT NULL
);

INSERT ALL
INTO MEDICATION VALUES (1,'Procrastin-X',NULL,'N/A')
INTO MEDICATION VALUES (2,'Thesisin','Foo Labs','N/A')
INTO MEDICATION VALUES (3,'Awakin','Bar Laboratories','N/A')
INTO MEDICATION VALUES (4,'Crescavitin','Baz Industries','N/A')
INTO MEDICATION VALUES (5,'Melioraurin','Snafu Pharmaceuticals','N/A')
SELECT *FROM DUAL;

--PRESCRIBES

CREATE TABLE  PRESCRIBES(
   physician   INTEGER NOT NULL REFERENCES PHYSICIAN(EMPLOYEEID)
  ,patient     INTEGER  NOT NULL REFERENCES PATIENT(SSN)
  ,medication  INTEGER  NOT NULL REFERENCES MEDICATION(CODE)
  ,DATE_PRE        VARCHAR(15) NOT NULL
  ,appointment INTEGER REFERENCES APPOINTMENT(APPOINTMENTID)
  ,dose        INTEGER  NOT NULL);
  
 
 
INSERT ALL
INTO prescribes VALUES (1,100000001,1,'24/4/2008',13216584,5)
INTO prescribes VALUES (9,100000004,2,'27/4/2008',86213939,10)
INTO prescribes (physician,patient,medication,DATE_PRE,dose) VALUES (9,100000004,2,'30/4/2008',5)  
 SELECT *FROM DUAL;
  
SELECT *FROM PRESCRIBES;

--ROOM 
SELECT *FROM ROOM;

CREATE TABLE room(
   roomnumber  INTEGER PRIMARY KEY 
  ,roomtype    VARCHAR(6) NOT NULL
  ,blockfloor  INTEGER  NOT NULL 
  ,blockcode   INTEGER  NOT NULL 
  ,unavailable VARCHAR(1) NOT NULL,
  FOREIGN KEY (blockfloor, blockcode) REFERENCES block (blockfloor, blockcode)
);



INSERT ALL 
INTO room VALUES (101,'Single',1,1,'f')
INTO room VALUES (102,'Single',1,1,'f')
INTO room VALUES (103,'Single',1,1,'f')
INTO room VALUES (111,'Single',1,2,'f')
INTO room VALUES (112,'Single',1,2,'t')
INTO room VALUES (113,'Single',1,2,'f')
INTO room VALUES (121,'Single',1,3,'f')
INTO room VALUES (122,'Single',1,3,'f')
INTO room VALUES (123,'Single',1,3,'f')
INTO room VALUES (201,'Single',2,1,'t')
INTO room VALUES (202,'Single',2,1,'f')
INTO room VALUES (203,'Single',2,1,'f')
INTO room VALUES (211,'Single',2,2,'f')
INTO room VALUES (212,'Single',2,2,'f')
INTO room VALUES (213,'Single',2,2,'t')
INTO room VALUES (221,'Single',2,3,'f')
INTO room VALUES (222,'Single',2,3,'f')
INTO room VALUES (223,'Single',2,3,'f')
INTO room VALUES (301,'Single',3,1,'f')
INTO room VALUES (302,'Single',3,1,'t')
INTO room VALUES (303,'Single',3,1,'f')
INTO room VALUES (311,'Single',3,2,'f')
INTO room VALUES (312,'Single',3,2,'f')
INTO room VALUES (313,'Single',3,2,'f')
INTO room VALUES (321,'Single',3,3,'t')
INTO room VALUES (322,'Single',3,3,'f')
INTO room VALUES (323,'Single',3,3,'f')
INTO room VALUES (401,'Single',4,1,'f')
INTO room VALUES (402,'Single',4,1,'t')
INTO room VALUES (403,'Single',4,1,'f')
INTO room VALUES (411,'Single',4,2,'f')
INTO room VALUES (412,'Single',4,2,'f')
INTO room VALUES (413,'Single',4,2,'f')
INTO room VALUES (421,'Single',4,3,'t')
INTO room VALUES (422,'Single',4,3,'f')
INTO room VALUES (423,'Single',4,3,'f')
SELECT *FROM DUAL;

--ONCALL
CREATE TABLE on_call(
nurse INTEGER  NOT NULL REFERENCES NURSE(EMPLOYEEID)
,blockfloor INTEGER  NOT NULL
,blockcode   INTEGER  NOT NULL
,oncallstart      DATE  NOT NULL
,oncallend      DATE  NOT NULL
,PRIMARY KEY (NURSE,BLOCKFLOOR,BLOCKCODE,ONCALLSTART,ONCALLEND)
,FOREIGN KEY (blockfloor, blockcode) REFERENCES block (blockfloor, blockcode)
);

INSERT ALL
INTO on_call VALUES (101,1,1,'4/11/2008','4/11/2008')
INTO on_call VALUES (101,1,2,'4/11/2008','4/11/2008')
INTO on_call VALUES(102,1,3,'4/11/2008','4/11/2008')
INTO on_call VALUES(103,1,1,'4/11/2008','4/11/2008')
INTO on_call VALUES (103,1,2,'4/11/2008','4/11/2008')
INTO on_call VALUES (103,1,3,'4/11/2008','4/11/2008')
SELECT *FROM DUAL;

--STAY
CREATE TABLE STAY(
   stayid       INTEGER  NOT NULL PRIMARY KEY
  ,patient  INTEGER REFERENCES PATIENT(SSN)
  ,patient_room INTEGER NOT NULL REFERENCES ROOM(ROOMNUMBER)
  ,start_time   VARCHAR(10)  NOT NULL
  ,end_time     VARCHAR(10)  NOT NULL
);

INSERT ALL
INTO STAY VALUES (3215,'100000001','111','1/5/2008','4/5/2008')
INTO STAY VALUES(3216,'100000003','123','3/5/2008','14/5/2008')
INTO STAY VALUES(3217,'100000004','112','2/5/2008','3/5/2008')
SELECT *FROM DUAL;

--UNDERGOES

CREATE TABLE Undergoes(
   patient        INTEGER  REFERENCES PATIENT(SSN)
  ,procedure      INTEGER  NOT NULL REFERENCES PROCEDURE(CODE)
  ,stay           INTEGER  NOT NULL REFERENCES STAY(STAYID)
  ,date_PRO           VARCHAR(9) NOT NULL 
  ,physician INTEGER  NOT NULL REFERENCES PHYSICIAN(EMPLOYEEID)
  ,assisting_nurse       INTEGER REFERENCES NURSE(EMPLOYEEID)
);

INSERT ALL 
INTO Undergoes VALUES (100000001,6,3215,'2/5/2008',3,101)
INTO Undergoes VALUES(100000001,2,3215,'3/5/2008',7,101)
INTO Undergoes VALUES(100000004,1,3217,'7/5/2008',3,102)
INTO Undergoes VALUES(100000004,5,3217,'9/5/2008',6,NULL)
INTO Undergoes VALUES(100000001,7,3217,'10/5/2008',7,101)
INTO Undergoes VALUES(100000004,4,3217,'13/5/2008',3,103)
SELECT *FROM DUAL;









