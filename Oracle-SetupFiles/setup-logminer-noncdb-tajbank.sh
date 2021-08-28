#!/bin/sh

# Set archive log mode and enable GG replication
ORACLE_SID=XE
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

sqlplus sys/top_secret@//localhost:1521/ORCLCDB as sysdba <<- EOF
  CREATE USER tajuser IDENTIFIED BY password2$ DEFAULT TABLESPACE LOGMINER_TBS QUOTA UNLIMITED ON LOGMINER_TBS;

  GRANT CREATE SESSION TO tajuser;
  GRANT SELECT ON V_\$DATABASE TO tajuser;
  GRANT FLASHBACK ANY TABLE TO tajuser;
  GRANT SELECT ANY TABLE TO tajuser;
  GRANT SELECT_CATALOG_ROLE TO tajuser;
  GRANT EXECUTE_CATALOG_ROLE TO tajuser;
  GRANT SELECT ANY TRANSACTION TO tajuser;
  GRANT SELECT ANY DICTIONARY TO tajuser;
  GRANT LOGMINING TO tajuser;

  GRANT CREATE TABLE TO tajuser;
  GRANT ALTER ANY TABLE TO tajuser;
  GRANT LOCK ANY TABLE TO tajuser;
  GRANT CREATE SEQUENCE TO tajuser;

  GRANT EXECUTE ON DBMS_LOGMNR TO tajuser;
  GRANT EXECUTE ON DBMS_LOGMNR_D TO tajuser;
  GRANT SELECT ON V_$LOGMNR_LOGS to tajuser;
  GRANT SELECT ON V_$LOGMNR_CONTENTS TO tajuser;
  GRANT SELECT ON V_\$LOGFILE TO tajuser;
  GRANT SELECT ON V_$ARCHIVED_LOG TO tajuser;
  GRANT SELECT ON V_$ARCHIVE_DEST_STATUS TO tajuser;

  exit;
EOF

sqlplus sys/top_secret@//localhost:1521/ORCLCDB as sysdba <<- EOF
  CREATE USER tajstream IDENTIFIED BY password2$;
  GRANT CONNECT TO tajstream;
  GRANT CREATE SESSION TO tajstream;
  GRANT CREATE TABLE TO tajstream;
  GRANT CREATE SEQUENCE to tajstream;
  ALTER USER tajstream QUOTA 100M on users;
  exit;
EOF
