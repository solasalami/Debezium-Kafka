#!/bin/sh

mkdir E:\app\solas\oradata\orcl\recovery_area

# Set archive log mode and enable GG replication
ORACLE_SID=ORCL
export ORACLE_SID
sqlplus /nolog <<- EOF
	CONNECT sys/password2$ AS SYSDBA
	alter system set db_recovery_file_dest_size = 10G;
	alter system set db_recovery_file_dest = 'E:\app\solas\oradata\orcl\recovery_area' scope=spfile;
	shutdown immediate
	startup mount
	alter database archivelog;
	alter database open;
        -- Should show "Database log mode: Archive Mode"
	archive log list
	exit;
EOF

# Enable LogMiner required database features/settings
sqlplus sys/password2$@//localhost:1521/ORCL as sysdba <<- EOF
  ALTER DATABASE ADD SUPPLEMENTAL LOG DATA;
  ALTER PROFILE DEFAULT LIMIT FAILED_LOGIN_ATTEMPTS UNLIMITED;
  ALTER DATABASE ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;
  exit;
EOF

# Create Log Miner Tablespace and User
sqlplus sys/password2$@//localhost:1521/ORCL as sysdba <<- EOF
  CREATE TABLESPACE LOGMINER_TBS DATAFILE 'E:\app\solas\oradata\orcl\logminer_tbs.dbf' SIZE 25M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
  exit;
EOF

sqlplus sys/password2$@//localhost:1521/ORCL as sysdba <<- EOF
  CREATE USER dbzuser IDENTIFIED BY dbz DEFAULT TABLESPACE LOGMINER_TBS QUOTA UNLIMITED ON LOGMINER_TBS;

  GRANT CREATE SESSION TO dbzuser;
  GRANT SELECT ON V_$DATABASE TO dbzuser;
  GRANT FLASHBACK ANY TABLE TO dbzuser;
  GRANT SELECT ANY TABLE TO dbzuser;
  GRANT SELECT_CATALOG_ROLE TO dbzuser;
  GRANT EXECUTE_CATALOG_ROLE TO dbzuser;
  GRANT SELECT ANY TRANSACTION TO dbzuser;
  GRANT SELECT ANY DICTIONARY TO dbzuser;

  GRANT CREATE TABLE TO dbzuser;
  GRANT ALTER ANY TABLE TO dbzuser;
  GRANT LOCK ANY TABLE TO dbzuser;
  GRANT CREATE SEQUENCE TO dbzuser;

  GRANT EXECUTE ON DBMS_LOGMNR TO dbzuser;
  GRANT EXECUTE ON DBMS_LOGMNR_D TO dbzuser;
  GRANT SELECT ON V_$LOGMNR_LOGS to dbzuser;
  GRANT SELECT ON V_$LOGMNR_CONTENTS TO dbzuser;
  GRANT SELECT ON V_$LOGFILE TO dbzuser;
  GRANT SELECT ON V_$ARCHIVED_LOG TO dbzuser;
  GRANT SELECT ON V_$ARCHIVE_DEST_STATUS TO dbzuser;
  GRANT  DBA  to dbzuser;

  exit;
EOF

sqlplus sys/password2$@//localhost:1521/ORCL as sysdba <<- EOF
  CREATE USER debezium IDENTIFIED BY dbz DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
  GRANT CONNECT TO debezium;
  GRANT CREATE SESSION TO debezium;
  GRANT CREATE TABLE TO debezium;
  GRANT CREATE SEQUENCE to debezium;
  GRANT DBA to DEBEZIUM;
  ALTER USER debezium QUOTA 100M on users;
  exit;
EOF
