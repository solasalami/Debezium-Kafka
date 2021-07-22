--------------------------------------------------------
--  DDL for Table BKSLD_Q
--------------------------------------------------------

  CREATE TABLE "BKSLD_Q" 
   (	"ID" VARCHAR2(2000 BYTE), 
	"AGE" VARCHAR2(20 BYTE), 
	"DEV" VARCHAR2(20 BYTE), 
	"NCP" VARCHAR2(100 BYTE), 
	"SUF" VARCHAR2(100 BYTE), 
	"DCO" DATE, 
	"CLI" VARCHAR2(100 BYTE), 
	"SDE" NUMBER(19,4), 
	"RCRE_DATE" DATE DEFAULT sysdate, 
	"OPCODE" VARCHAR2(20 BYTE), 
	"EXTRACTTIME" DATE, 
	"ACTIVE" VARCHAR2(20 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKSLD_Q_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BKSLD_Q_PK" ON "BKSLD_Q" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKSLD_Q_INDEX1_RCRE_DATE
--------------------------------------------------------

  CREATE INDEX "BKSLD_Q_INDEX1_RCRE_DATE" ON "BKSLD_Q" ("RCRE_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKSLD_Q_INDEX1_AGE
--------------------------------------------------------

  CREATE INDEX "BKSLD_Q_INDEX1_AGE" ON "BKSLD_Q" ("AGE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKSLD_Q_INDEX1_DCO
--------------------------------------------------------

  CREATE INDEX "BKSLD_Q_INDEX1_DCO" ON "BKSLD_Q" ("DCO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKSLD_Q_INDEX1_DEV
--------------------------------------------------------

  CREATE INDEX "BKSLD_Q_INDEX1_DEV" ON "BKSLD_Q" ("DEV") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKSLD_Q_INDEX_NCP
--------------------------------------------------------

  CREATE UNIQUE INDEX "BKSLD_Q_INDEX_NCP" ON "BKSLD_Q" ("NCP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKSLD_Q_INDEX1_EXTRACTTIME
--------------------------------------------------------

  CREATE INDEX "BKSLD_Q_INDEX1_EXTRACTTIME" ON "BKSLD_Q" ("EXTRACTTIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKSLD_Q_INDEX1_OPCODE
--------------------------------------------------------

  CREATE INDEX "BKSLD_Q_INDEX1_OPCODE" ON "BKSLD_Q" ("OPCODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKSLD_Q_INDEX1_ACTIVE
--------------------------------------------------------

  CREATE INDEX "BKSLD_Q_INDEX1_ACTIVE" ON "BKSLD_Q" ("ACTIVE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BKSLD_Q
--------------------------------------------------------

  ALTER TABLE "BKSLD_Q" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BKSLD_Q" ADD CONSTRAINT "BKSLD_Q_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "BKSLD_Q" MODIFY ("SDE" NOT NULL ENABLE);
