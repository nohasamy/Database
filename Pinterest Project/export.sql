--------------------------------------------------------
--  File created - Wednesday-April-15-2020   
--------------------------------------------------------
  DROP TABLE "HR"."ADDPHOTO" cascade constraints;
  DROP TABLE "HR"."COMMENTS" cascade constraints;
  DROP TABLE "HR"."FOLLOWPINBOARDS" cascade constraints;
  DROP TABLE "HR"."FOLLOWUSER" cascade constraints;
  DROP TABLE "HR"."LIKES" cascade constraints;
  DROP TABLE "HR"."PHOTOGRAPHS" cascade constraints;
  DROP TABLE "HR"."PINBOARDS" cascade constraints;
  DROP TABLE "HR"."USERS" cascade constraints;
  DROP SEQUENCE "HR"."DEPARTMENTS_SEQ";
  DROP SEQUENCE "HR"."EMPLOYEES_SEQ";
  DROP SEQUENCE "HR"."LOCATIONS_SEQ";
  DROP VIEW "HR"."EMP_DETAILS_VIEW";
  DROP PROCEDURE "HR"."GETMAXID";
  DROP PROCEDURE "HR"."GETPASSWORD";
  DROP PROCEDURE "HR"."INSERTUSER";
  DROP PROCEDURE "HR"."SECURE_DML";
--------------------------------------------------------
--  DDL for Sequence DEPARTMENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."DEPARTMENTS_SEQ"  MINVALUE 1 MAXVALUE 9990 INCREMENT BY 10 START WITH 280 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EMPLOYEES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."EMPLOYEES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 207 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOCATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."LOCATIONS_SEQ"  MINVALUE 1 MAXVALUE 9900 INCREMENT BY 100 START WITH 3300 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table PHOTOGRAPHS
--------------------------------------------------------

  CREATE TABLE "HR"."PHOTOGRAPHS" 
   (	"PHOTO_ID" NUMBER, 
	"PHOTO_NAME" VARCHAR2(20 BYTE), 
	"PHOTO_TYPE" VARCHAR2(10 BYTE), 
	"DESCRIPTION" VARCHAR2(100 BYTE), 
	"UPLOAD_TIME" DATE, 
	"PHOTO_SIZE" NUMBER, 
	"TAGS" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PINBOARDS
--------------------------------------------------------

  CREATE TABLE "HR"."PINBOARDS" 
   (	"BOARD_ID" NUMBER, 
	"BOARD_NAME" VARCHAR2(15 BYTE), 
	"DESCRIPTION" VARCHAR2(100 BYTE), 
	"CREATE_TIME" DATE, 
	"BOARD_ACCESS" CHAR(1 BYTE), 
	"USER_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ADDPHOTO
--------------------------------------------------------

  CREATE TABLE "HR"."ADDPHOTO" 
   (	"PICTURE_ID" NUMBER, 
	"PINBOARD_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "HR"."USERS" 
   (	"USER_ID" NUMBER, 
	"FIRST_NAME" VARCHAR2(10 BYTE), 
	"LAST_NAME" VARCHAR2(10 BYTE), 
	"USER_NAME" VARCHAR2(10 BYTE), 
	"USER_PASSWORD" VARCHAR2(10 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"COUNTRY" VARCHAR2(10 BYTE), 
	"GENDER" CHAR(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COMMENTS
--------------------------------------------------------

  CREATE TABLE "HR"."COMMENTS" 
   (	"COMMENT_ID" NUMBER, 
	"PICTURE_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"COMMENT_TXT" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FOLLOWPINBOARDS
--------------------------------------------------------

  CREATE TABLE "HR"."FOLLOWPINBOARDS" 
   (	"PINBOARD_ID" NUMBER, 
	"USER_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FOLLOWUSER
--------------------------------------------------------

  CREATE TABLE "HR"."FOLLOWUSER" 
   (	"USER1_ID" NUMBER, 
	"USER2_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table LIKES
--------------------------------------------------------

  CREATE TABLE "HR"."LIKES" 
   (	"PICTURE_ID" NUMBER, 
	"USER_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

---------------------------------------------------
--   DATA FOR TABLE PHOTOGRAPHS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.PHOTOGRAPHS
Insert into HR.PHOTOGRAPHS (PHOTO_ID,PHOTO_NAME,PHOTO_TYPE,DESCRIPTION,UPLOAD_TIME,PHOTO_SIZE,TAGS) values (1,'sakura flower','nature','japanese sakura flower',to_timestamp('21-MAR-20 08.20.52.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),720,'#flowers');
Insert into HR.PHOTOGRAPHS (PHOTO_ID,PHOTO_NAME,PHOTO_TYPE,DESCRIPTION,UPLOAD_TIME,PHOTO_SIZE,TAGS) values (2,'hijabi dress','clothes','hijabi dress for events',to_timestamp('21-MAR-20 08.43.00.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),720,'#hijabi');
Insert into HR.PHOTOGRAPHS (PHOTO_ID,PHOTO_NAME,PHOTO_TYPE,DESCRIPTION,UPLOAD_TIME,PHOTO_SIZE,TAGS) values (3,'naruto and kuopy','animations','naruto character with kuoby power',to_timestamp('21-MAR-20 08.43.00.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),720,'#anime');
Insert into HR.PHOTOGRAPHS (PHOTO_ID,PHOTO_NAME,PHOTO_TYPE,DESCRIPTION,UPLOAD_TIME,PHOTO_SIZE,TAGS) values (4,'BMW car','cars','BMW car model 2020',to_timestamp('21-MAR-20 08.43.00.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),720,'#cars');
Insert into HR.PHOTOGRAPHS (PHOTO_ID,PHOTO_NAME,PHOTO_TYPE,DESCRIPTION,UPLOAD_TIME,PHOTO_SIZE,TAGS) values (6,'lovely','quotes','lovely pickup line',to_timestamp('21-MAR-20 08.43.01.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),720,'#quotes');
Insert into HR.PHOTOGRAPHS (PHOTO_ID,PHOTO_NAME,PHOTO_TYPE,DESCRIPTION,UPLOAD_TIME,PHOTO_SIZE,TAGS) values (7,'universe theory','theory',' ',to_timestamp('21-MAR-20 08.43.01.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),720,'#science');
Insert into HR.PHOTOGRAPHS (PHOTO_ID,PHOTO_NAME,PHOTO_TYPE,DESCRIPTION,UPLOAD_TIME,PHOTO_SIZE,TAGS) values (9,'wedding dress','clothes','dream dress',to_timestamp('21-MAR-20 08.43.01.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),720,'#wedding');
Insert into HR.PHOTOGRAPHS (PHOTO_ID,PHOTO_NAME,PHOTO_TYPE,DESCRIPTION,UPLOAD_TIME,PHOTO_SIZE,TAGS) values (10,'deku','animations','BNHA anime',to_timestamp('21-MAR-20 08.43.01.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),720,'#anime');
Insert into HR.PHOTOGRAPHS (PHOTO_ID,PHOTO_NAME,PHOTO_TYPE,DESCRIPTION,UPLOAD_TIME,PHOTO_SIZE,TAGS) values (5,'wires','electronic','reqired',to_timestamp('21-MAR-20 08.47.54.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),720,'#electronics');
Insert into HR.PHOTOGRAPHS (PHOTO_ID,PHOTO_NAME,PHOTO_TYPE,DESCRIPTION,UPLOAD_TIME,PHOTO_SIZE,TAGS) values (8,'componant','electronic','required componant',to_timestamp('21-MAR-20 08.47.54.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),720,'#electronics');

---------------------------------------------------
--   END DATA FOR TABLE PHOTOGRAPHS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE PINBOARDS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.PINBOARDS
Insert into HR.PINBOARDS (BOARD_ID,BOARD_NAME,DESCRIPTION,CREATE_TIME,BOARD_ACCESS,USER_ID) values (1,'flowers','beautiful flowers board',to_timestamp('21-MAR-20 08.06.42.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'y',1);
Insert into HR.PINBOARDS (BOARD_ID,BOARD_NAME,DESCRIPTION,CREATE_TIME,BOARD_ACCESS,USER_ID) values (2,'dresses','elegent dresses',to_timestamp('21-MAR-20 08.15.43.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'y',3);
Insert into HR.PINBOARDS (BOARD_ID,BOARD_NAME,DESCRIPTION,CREATE_TIME,BOARD_ACCESS,USER_ID) values (3,'electronics','unique componants',to_timestamp('21-MAR-20 08.15.43.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'y',4);
Insert into HR.PINBOARDS (BOARD_ID,BOARD_NAME,DESCRIPTION,CREATE_TIME,BOARD_ACCESS,USER_ID) values (4,'cars','dream cars',to_timestamp('21-MAR-20 08.15.43.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'n',6);
Insert into HR.PINBOARDS (BOARD_ID,BOARD_NAME,DESCRIPTION,CREATE_TIME,BOARD_ACCESS,USER_ID) values (5,'theories','theories of everything',to_timestamp('21-MAR-20 08.15.43.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'n',2);
Insert into HR.PINBOARDS (BOARD_ID,BOARD_NAME,DESCRIPTION,CREATE_TIME,BOARD_ACCESS,USER_ID) values (6,'anime','anime world',to_timestamp('21-MAR-20 08.15.43.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'y',2);
Insert into HR.PINBOARDS (BOARD_ID,BOARD_NAME,DESCRIPTION,CREATE_TIME,BOARD_ACCESS,USER_ID) values (7,'pickup lines','my pickup lines',to_timestamp('21-MAR-20 08.15.43.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'n',4);
Insert into HR.PINBOARDS (BOARD_ID,BOARD_NAME,DESCRIPTION,CREATE_TIME,BOARD_ACCESS,USER_ID) values (8,'work','work related',to_timestamp('21-MAR-20 08.15.43.000000000 PM','DD-MON-RR HH.MI.SS.FF AM'),'n',5);

---------------------------------------------------
--   END DATA FOR TABLE PINBOARDS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE FOLLOWUSER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.FOLLOWUSER

---------------------------------------------------
--   END DATA FOR TABLE FOLLOWUSER
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE ADDPHOTO
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.ADDPHOTO
Insert into HR.ADDPHOTO (PICTURE_ID,PINBOARD_ID) values (1,1);
Insert into HR.ADDPHOTO (PICTURE_ID,PINBOARD_ID) values (2,2);
Insert into HR.ADDPHOTO (PICTURE_ID,PINBOARD_ID) values (3,6);
Insert into HR.ADDPHOTO (PICTURE_ID,PINBOARD_ID) values (4,4);
Insert into HR.ADDPHOTO (PICTURE_ID,PINBOARD_ID) values (5,3);
Insert into HR.ADDPHOTO (PICTURE_ID,PINBOARD_ID) values (6,7);
Insert into HR.ADDPHOTO (PICTURE_ID,PINBOARD_ID) values (7,5);
Insert into HR.ADDPHOTO (PICTURE_ID,PINBOARD_ID) values (8,8);
Insert into HR.ADDPHOTO (PICTURE_ID,PINBOARD_ID) values (9,2);
Insert into HR.ADDPHOTO (PICTURE_ID,PINBOARD_ID) values (10,6);

---------------------------------------------------
--   END DATA FOR TABLE ADDPHOTO
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE FOLLOWPINBOARDS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.FOLLOWPINBOARDS

---------------------------------------------------
--   END DATA FOR TABLE FOLLOWPINBOARDS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LIKES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.LIKES
Insert into HR.LIKES (PICTURE_ID,USER_ID) values (1,2);
Insert into HR.LIKES (PICTURE_ID,USER_ID) values (2,1);
Insert into HR.LIKES (PICTURE_ID,USER_ID) values (3,6);
Insert into HR.LIKES (PICTURE_ID,USER_ID) values (5,5);
Insert into HR.LIKES (PICTURE_ID,USER_ID) values (5,6);
Insert into HR.LIKES (PICTURE_ID,USER_ID) values (9,1);
Insert into HR.LIKES (PICTURE_ID,USER_ID) values (9,4);
Insert into HR.LIKES (PICTURE_ID,USER_ID) values (10,1);

---------------------------------------------------
--   END DATA FOR TABLE LIKES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE USERS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.USERS
Insert into HR.USERS (USER_ID,FIRST_NAME,LAST_NAME,USER_NAME,USER_PASSWORD,EMAIL,ADDRESS,COUNTRY,GENDER) values (7,'sam','zack','sams','sam00','sam00@gmail.com','october','egypt','m');
Insert into HR.USERS (USER_ID,FIRST_NAME,LAST_NAME,USER_NAME,USER_PASSWORD,EMAIL,ADDRESS,COUNTRY,GENDER) values (1,'noha','sami','rano','lawliet707','nohasamy13@gmail.com','78 ismail-elfangry street','egypt','f');
Insert into HR.USERS (USER_ID,FIRST_NAME,LAST_NAME,USER_NAME,USER_PASSWORD,EMAIL,ADDRESS,COUNTRY,GENDER) values (2,'momen','mostafa','mkk','momenmkk','momenmkk@gmail.com','12 awl-gamal street','egypt','m');
Insert into HR.USERS (USER_ID,FIRST_NAME,LAST_NAME,USER_NAME,USER_PASSWORD,EMAIL,ADDRESS,COUNTRY,GENDER) values (3,'warda','abdelfatah','ward','wardaward','wardaward@gmail.com','34 el-haram street','egypt','f');
Insert into HR.USERS (USER_ID,FIRST_NAME,LAST_NAME,USER_NAME,USER_PASSWORD,EMAIL,ADDRESS,COUNTRY,GENDER) values (4,'mohamed','abdulallah','elbediwy','bediwy458','elbediwy458@gmail.com','32 bab el-loaa street','egypt','m');
Insert into HR.USERS (USER_ID,FIRST_NAME,LAST_NAME,USER_NAME,USER_PASSWORD,EMAIL,ADDRESS,COUNTRY,GENDER) values (5,'makriuos','mamdoh','meko','mekomamdoh','mekomamdoh@gmail.com','10 shobra el-khema street','egypt','m');
Insert into HR.USERS (USER_ID,FIRST_NAME,LAST_NAME,USER_NAME,USER_PASSWORD,EMAIL,ADDRESS,COUNTRY,GENDER) values (6,'ahmed','salama','salama','salama1470','salama1470@gmail.com','3 mohamed saeed street','egypt','m');

---------------------------------------------------
--   END DATA FOR TABLE USERS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE COMMENTS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HR.COMMENTS

---------------------------------------------------
--   END DATA FOR TABLE COMMENTS
---------------------------------------------------
--------------------------------------------------------
--  Constraints for Table ADDPHOTO
--------------------------------------------------------

  ALTER TABLE "HR"."ADDPHOTO" ADD CONSTRAINT "ADDPHOTO_PK" PRIMARY KEY ("PICTURE_ID", "PINBOARD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "HR"."COMMENTS" ADD PRIMARY KEY ("COMMENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FOLLOWPINBOARDS
--------------------------------------------------------

  ALTER TABLE "HR"."FOLLOWPINBOARDS" ADD CONSTRAINT "FLW_BORD_PK" PRIMARY KEY ("PINBOARD_ID", "USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FOLLOWUSER
--------------------------------------------------------

  ALTER TABLE "HR"."FOLLOWUSER" ADD CONSTRAINT "FLWUSER_PK" PRIMARY KEY ("USER1_ID", "USER2_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LIKES
--------------------------------------------------------

  ALTER TABLE "HR"."LIKES" ADD CONSTRAINT "LIKE_PK" PRIMARY KEY ("PICTURE_ID", "USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PHOTOGRAPHS
--------------------------------------------------------

  ALTER TABLE "HR"."PHOTOGRAPHS" ADD PRIMARY KEY ("PHOTO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PINBOARDS
--------------------------------------------------------

  ALTER TABLE "HR"."PINBOARDS" ADD PRIMARY KEY ("BOARD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "HR"."USERS" ADD PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  DDL for Index ADDPHOTO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."ADDPHOTO_PK" ON "HR"."ADDPHOTO" ("PICTURE_ID", "PINBOARD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FLWUSER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."FLWUSER_PK" ON "HR"."FOLLOWUSER" ("USER1_ID", "USER2_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FLW_BORD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."FLW_BORD_PK" ON "HR"."FOLLOWPINBOARDS" ("PINBOARD_ID", "USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LIKE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."LIKE_PK" ON "HR"."LIKES" ("PICTURE_ID", "USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Ref Constraints for Table ADDPHOTO
--------------------------------------------------------

  ALTER TABLE "HR"."ADDPHOTO" ADD FOREIGN KEY ("PICTURE_ID")
	  REFERENCES "HR"."PHOTOGRAPHS" ("PHOTO_ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "HR"."ADDPHOTO" ADD FOREIGN KEY ("PINBOARD_ID")
	  REFERENCES "HR"."PINBOARDS" ("BOARD_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "HR"."COMMENTS" ADD FOREIGN KEY ("PICTURE_ID")
	  REFERENCES "HR"."PHOTOGRAPHS" ("PHOTO_ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "HR"."COMMENTS" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "HR"."USERS" ("USER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FOLLOWPINBOARDS
--------------------------------------------------------

  ALTER TABLE "HR"."FOLLOWPINBOARDS" ADD FOREIGN KEY ("PINBOARD_ID")
	  REFERENCES "HR"."PINBOARDS" ("BOARD_ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "HR"."FOLLOWPINBOARDS" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "HR"."USERS" ("USER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FOLLOWUSER
--------------------------------------------------------

  ALTER TABLE "HR"."FOLLOWUSER" ADD FOREIGN KEY ("USER1_ID")
	  REFERENCES "HR"."USERS" ("USER_ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "HR"."FOLLOWUSER" ADD FOREIGN KEY ("USER2_ID")
	  REFERENCES "HR"."USERS" ("USER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LIKES
--------------------------------------------------------

  ALTER TABLE "HR"."LIKES" ADD FOREIGN KEY ("PICTURE_ID")
	  REFERENCES "HR"."PHOTOGRAPHS" ("PHOTO_ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "HR"."LIKES" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "HR"."USERS" ("USER_ID") ON DELETE CASCADE ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table PINBOARDS
--------------------------------------------------------

  ALTER TABLE "HR"."PINBOARDS" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "HR"."USERS" ("USER_ID") ON DELETE CASCADE ENABLE;







--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HR"."EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY;
--------------------------------------------------------
--  DDL for Procedure GETMAXID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."GETMAXID" 
(new_id out VARCHAR2)
as
begin
select max(user_id)
into new_ID
from users;
end;

/

--------------------------------------------------------
--  DDL for Procedure GETPASSWORD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."GETPASSWORD" 
(uname in VARCHAR2  , pass out VARCHAR2)
as
begin
select user_password
into pass
from users
where user_name = uname;
end;

/

--------------------------------------------------------
--  DDL for Procedure INSERTUSER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."INSERTUSER" 
(newid in number ,FN in VARCHAR2  ,LN in VARCHAR2 , UN in VARCHAR2 , pw in VARCHAR2 , mail in VARCHAR2   , addr in VARCHAR2 , cou in VARCHAR2 , gend in CHAR )
as
begin
insert into USERS 
values(newid ,fn ,ln,un , pw,mail,addr ,cou , gend);

end;

/

--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

/

