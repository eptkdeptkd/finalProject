DROP TABLE DMEMBER
CASCADE CONSTRAINTS;

CREATE TABLE DMEMBER(
	ID VARCHAR2(50) PRIMARY KEY,
	NICKNAME VARCHAR2(100) NOT NULL,
	PASSWORD VARCHAR2(50) NOT NULL,
	BIRTHDAY VARCHAR2(50) NOT NULL,
	ADDRESS VARCHAR2(100),
	PNUMBER VARCHAR2(50) UNIQUE,
	EMAIL VARCHAR2(100) UNIQUE,
	CEMAIL NUMBER(1),
	CPNUMBER NUMBER(1),
	AUTH NUMBER(1)
);

ALTER TABLE DMEMBER
MODIFY
ADDRESS VARCHAR2(500)

select 1 from DMEMBER where id ='client1' and password='abcABC123!@#'