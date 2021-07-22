--------------------------------------------------------
--  DDL for Table BKEVE_Q
--------------------------------------------------------

  CREATE TABLE "BKEVE_Q" 
   (	"ID" VARCHAR2(2000 BYTE), 
	"EVE" VARCHAR2(200 BYTE), 
	"AGE" VARCHAR2(200 BYTE), 
	"DSAI" DATE, 
	"HSAI" VARCHAR2(200 BYTE), 
	"NCP1" VARCHAR2(200 BYTE), 
	"NCP2" VARCHAR2(200 BYTE), 
	"CLI1" VARCHAR2(100 BYTE), 
	"CLI2" VARCHAR2(100 BYTE), 
	"DEV1" VARCHAR2(20 BYTE), 
	"DEV2" VARCHAR2(20 BYTE), 
	"NOMP" VARCHAR2(2000 BYTE), 
	"ETA" VARCHAR2(20 BYTE), 
	"NAT" VARCHAR2(50 BYTE), 
	"AGSA" VARCHAR2(50 BYTE), 
	"COLUMN1" VARCHAR2(50 BYTE), 
	"SEN1" VARCHAR2(10 BYTE), 
	"SEN2" VARCHAR2(10 BYTE), 
	"COLUMN2" DATE, 
	"DVA2" DATE, 
	"LIB1" VARCHAR2(200 BYTE), 
	"LIB2" VARCHAR2(200 BYTE), 
	"LIB3" VARCHAR2(200 BYTE), 
	"MNT1" NUMBER(19,4), 
	"MNT2" NUMBER(19,4), 
	"OPE" VARCHAR2(100 BYTE), 
	"AGE1" VARCHAR2(200 BYTE), 
	"NOM1" VARCHAR2(2000 BYTE), 
	"NOM2" VARCHAR2(2000 BYTE), 
	"MHT" NUMBER(19,4), 
	"MH1" NUMBER(19,4), 
	"MHT2" NUMBER(19,4), 
	"SOL1" NUMBER(19,4), 
	"SOL2" NUMBER(19,4), 
	"PSTDDATE" DATE, 
	"RCREDATE" DATE DEFAULT sysdate, 
	"OPCODE" VARCHAR2(20 BYTE), 
	"EXTRACTTIME" DATE, 
	"ACTIVE" VARCHAR2(20 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BKEVE_Q_PK" ON "BKEVE_Q" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_OPCODE
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_OPCODE" ON "BKEVE_Q" ("OPCODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_CLI1
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_CLI1" ON "BKEVE_Q" ("CLI1") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_CLI2
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_CLI2" ON "BKEVE_Q" ("CLI2") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_DEV1
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_DEV1" ON "BKEVE_Q" ("DEV1") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_DEV2
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_DEV2" ON "BKEVE_Q" ("DEV2") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_EVE
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_EVE" ON "BKEVE_Q" ("EVE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_NCP1
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_NCP1" ON "BKEVE_Q" ("NCP1") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_NCP2
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_NCP2" ON "BKEVE_Q" ("NCP2") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_PSTDDATE
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_PSTDDATE" ON "BKEVE_Q" ("PSTDDATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX2_AGE
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX2_AGE" ON "BKEVE_Q" ("AGE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_EXTRACTIME
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_EXTRACTIME" ON "BKEVE_Q" ("EXTRACTTIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_DSAI
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_DSAI" ON "BKEVE_Q" ("DSAI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_ETA
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_ETA" ON "BKEVE_Q" ("ETA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_NAT
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_NAT" ON "BKEVE_Q" ("NAT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BKEVE_Q_INDEX1_ACTIVE
--------------------------------------------------------

  CREATE INDEX "BKEVE_Q_INDEX1_ACTIVE" ON "BKEVE_Q" ("ACTIVE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BKEVE_Q
--------------------------------------------------------

  ALTER TABLE "BKEVE_Q" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BKEVE_Q" MODIFY ("EVE" NOT NULL ENABLE);
  ALTER TABLE "BKEVE_Q" MODIFY ("PSTDDATE" NOT NULL ENABLE);
  ALTER TABLE "BKEVE_Q" ADD CONSTRAINT "BKEVE_Q_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
