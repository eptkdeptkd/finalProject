DROP TABLE DMENU
CASCADE CONSTRAINTS

CREATE TABLE DMENU(
	SEQ NUMBER(8) PRIMARY KEY,
	NAME VARCHAR2(300) NOT NULL,
	ORDERNUM NUMBER(8) NOT NULL
)

CREATE SEQUENCE SEQ_DMENU
START WITH 1
INCREMENT BY 1

ALTER TABLE DMENU
modify ID VARCHAR2(50)

ALTER TABLE DMENU
ADD CONSTRAINT FK_Dmenu_ID FOREIGN KEY(ID)
REFERENCES DMEMBER(ID)

INSERT INTO DMENU values(seq_dmenu.nextval, '게시판', '1','client1')

select max(ordernum)
from dmenu
where id = 'client1'
group by id

SELECT NAME,ORDERNUM  FROM DMENU WHERE ID = 'client1' ORDER BY ORDERNUM

delete from dmenu


SELECT name,ordernum
from dmenu
WHERE ID = 'client1' and ORDERNUM <= 4 AND ORDERNUM > 2

update dmenu set ordernum = 4 where name='333333'

UPDATE DMENU 
SET ORDERNUM = ORDERNUM + 1
WHERE ORDERNUM >= 2 AND ORDERNUM < 4 AND ID = 'client1' 

select *
from dmenu