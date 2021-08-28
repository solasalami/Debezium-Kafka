#!/bin/sh

# Set archive log mode and enable GG replication
ORACLE_SID=ORCLCDB
export ORACLE_SID
sqlplus /nolog <<- EOF
	CONNECT sys/top_secret AS SYSDBA
	alter system set db_recovery_file_dest_size = 10G;
	alter system set db_recovery_file_dest = '/opt/oracle/oradata/recovery_area' scope=spfile;
	shutdown immediate
	startup mount
	alter database archivelog;
	alter database open;
        -- Should show "Database log mode: Archive Mode"
	archive log list
	exit;
EOF

# Enable LogMiner required database features/settings
sqlplus sys/top_secret@//localhost:1521/ORCLCDB as sysdba <<- EOF
  ALTER DATABASE ADD SUPPLEMENTAL LOG DATA;
  ALTER PROFILE DEFAULT LIMIT FAILED_LOGIN_ATTEMPTS UNLIMITED;
  exit;
EOF

# Create Log Miner Tablespace and User
sqlplus sys/top_secret@//localhost:1521/ORCLCDB as sysdba <<- EOF
  CREATE TABLESPACE LOGMINER_TBS DATAFILE '/opt/oracle/oradata/ORCLCDB/logminer_tbs.dbf' SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
  exit;
EOF

sqlplus sys/top_secret@//localhost:1521/ORCLPDB1 as sysdba <<- EOF
  CREATE TABLESPACE LOGMINER_TBS DATAFILE '/opt/oracle/oradata/ORCLCDB/ORCLPDB1/logminer_tbs.dbf' SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
  exit;
EOF

sqlplus sys/top_secret@//localhost:1521/ORCLCDB as sysdba <<- EOF
  CREATE USER c##tajuser IDENTIFIED BY password2$ DEFAULT TABLESPACE LOGMINER_TBS QUOTA UNLIMITED ON LOGMINER_TBS CONTAINER=ALL;

  GRANT CREATE SESSION TO c##tajuser CONTAINER=ALL;
  GRANT SET CONTAINER TO c##tajuser CONTAINER=ALL;
  GRANT SELECT ON V_\$DATABASE TO c##tajuser CONTAINER=ALL;
  GRANT FLASHBACK ANY TABLE TO c##tajuser CONTAINER=ALL;
  GRANT SELECT ANY TABLE TO c##tajuser CONTAINER=ALL;
  GRANT SELECT_CATALOG_ROLE TO c##tajuser CONTAINER=ALL;
  GRANT EXECUTE_CATALOG_ROLE TO c##tajuser CONTAINER=ALL;
  GRANT SELECT ANY TRANSACTION TO c##tajuser CONTAINER=ALL;
  GRANT SELECT ANY DICTIONARY TO c##tajuser CONTAINER=ALL;
  GRANT LOGMINING TO c##tajuser CONTAINER=ALL;

  GRANT CREATE TABLE TO c##tajuser CONTAINER=ALL;
  GRANT ALTER ANY TABLE TO c##tajuser CONTAINER=ALL;
  GRANT LOCK ANY TABLE TO c##tajuser CONTAINER=ALL;
  GRANT CREATE SEQUENCE TO c##tajuser CONTAINER=ALL;

  GRANT EXECUTE ON DBMS_LOGMNR TO c##tajuser CONTAINER=ALL;
  GRANT EXECUTE ON DBMS_LOGMNR_D TO c##tajuser CONTAINER=ALL;
  GRANT SELECT ON V$LOGMNR_LOGS TO c##tajuser CONTAINER=ALL;
  GRANT SELECT ON V$LOGMNR_CONTENTS TO c##tajuser CONTAINER=ALL;
  GRANT SELECT ON V$LOGFILE TO c##tajuser CONTAINER=ALL;
  GRANT SELECT ON V$ARCHIVED_LOG TO c##tajuser CONTAINER=ALL;
  GRANT SELECT ON V$ARCHIVE_DEST_STATUS TO c##tajuser CONTAINER=ALL;

  exit;
EOF

sqlplus sys/top_secret@//localhost:1521/ORCLPDB1 as sysdba <<- EOF
  CREATE USER tajstream IDENTIFIED BY password2$;
  GRANT CONNECT TO tajstream;
  GRANT CREATE SESSION TO tajstream;
  GRANT CREATE TABLE TO tajstream;
  GRANT CREATE SEQUENCE to tajstream;
  ALTER USER tajstream QUOTA 100M on users;
  exit;
EOF