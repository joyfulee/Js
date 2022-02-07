CREATE TABLE USERTBL
( USERID VARCHAR(8) PRIMARY KEY,
  USERNAME NVARCHAR2(10) NOT NULL,
  BIRTHYEAR NUMBER(4) NOT NULL,
  ADDR NCHAR(2) NOT NULL,
  MOBILE1 CHAR(3),
  MOBILE2 CHAR(8),
  HEIGHT NUMBER(3),
  MDATE DATE);
  
CREATE TABLE BUYTBL
(IDNUM NUMBER(8) PRIMARY KEY,
 USERID VARCHAR(8) NOT NULL,
 PRDNAME NVARCHAR2(10) NOT NULL,
 GROUPNAME NVARCHAR2(10), 
 PRICE NUMBER(8) NOT NULL,
 AMOUNT NUMBER(3) NOT NULL,
 FOREIGN KEY (USERID) REFERENCES USERTBL (USERID));
 
 CREATE TABLE STDTBL
 (STDNAME NCHAR(5) NOT NULL PRIMARY KEY,
  ADDR NCHAR(2) NOT NULL);
  
  CREATE TABLE CLUBTBL
  (CLUBNAME NCHAR(5) NOT NULL PRIMARY KEY,
  ROOMNO NCHAR(4) NOT NULL
  );
  
  CREATE SEQUENCE STDCLUBSEQ;
  
  CREATE TABLE STDCLUBTBL
  (IDNUM NUMBER(5) NOT NULL PRIMARY KEY,
  STDNAME NCHAR(5) NOT NULL,
  CLUBNAME NCHAR(5) NOT NULL,
  FOREIGN KEY (STDNAME) REFERENCES STDTBL(STDNAME),
  FOREIGN KEY (CLUBNAME)REFERENCES CLUBTBL(CLUBNAME));
 
  INSERT INTO STDTBL VALUES ('�����','�泲');
  INSERT INTO STDTBL VALUES ('���ð�','����');
  INSERT INTO STDTBL VALUES ('������','���');
  INSERT INTO STDTBL VALUES ('������','���');
  INSERT INTO STDTBL VALUES ('�ٺ�Ŵ','����');
  INSERT INTO CLUBTBL VALUES ('����','101ȣ');
  INSERT INTO CLUBTBL VALUES ('�ٵ�','102ȣ');
  INSERT INTO CLUBTBL VALUES ('�౸','103ȣ');
  INSERT INTO CLUBTBL VALUES ('����','104ȣ');
  
  INSERT INTO STDCLUBTBL VALUES(STDCLUBSEQ.NEXTVAL,'�����','�ٵ�');
  INSERT INTO STDCLUBTBL VALUES(STDCLUBSEQ.NEXTVAL,'�����','�౸');
  INSERT INTO STDCLUBTBL VALUES(STDCLUBSEQ.NEXTVAL,'������','�౸');
  INSERT INTO STDCLUBTBL VALUES(STDCLUBSEQ.NEXTVAL,'������','�౸');
  INSERT INTO STDCLUBTBL VALUES(STDCLUBSEQ.NEXTVAL,'������','����');
  INSERT INTO STDCLUBTBL VALUES(STDCLUBSEQ.NEXTVAL,'�ٺ�Ŵ','����');
  
  INSERT INTO USERTBL VALUES('LSG','�̽±�',1987,'����','011','11111111',182,'2008-8-8');
  INSERT INTO USERTBL VALUES('KBS','�����',1979,'����','011','22222222',173,'2012-4-4');
  INSERT INTO USERTBL VALUES('KKH','���ȣ',1971,'���','019','33333333',177,'2007-7-7');
  INSERT INTO USERTBL VALUES('JYP','������',1950,'����','011','44444444',166,'2009-9-9');
  INSERT INTO USERTBL VALUES('SSK','���ð�',1979,'����',NULL,NULL,186,'2013-12-12');
  -- NULL ���� �������, ������ �ʵ���� �ۼ� , �� ���� �Է�!!
  INSERT INTO USERTBL VALUES('LJB','�����',1963,'����','016','66666666',182,'2009-9-9');
  INSERT INTO USERTBL VALUES('YJS','������',1969,'�泲',NULL,NULL,170,'2005-5-5');
  INSERT INTO USERTBL VALUES('EJW','������',1972,'���','011','88888888',174,'2014-3-3');
  INSERT INTO USERTBL VALUES('JKW','������',1965,'���','018','99999999',172,'2010-10-10');
  INSERT INTO USERTBL VALUES('BBK','�ٺ�Ŵ',1973,'����','010','00000000',176,'2013-5-5');
  
  CREATE SEQUENCE idSEQ; -- ������ȣ �Է��� ���ؼ� ������ ����
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'KBS', '�ȭ', NULL   , 30,   2);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'KBS', '��Ʈ��', '����', 1000, 1);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'JYP', '�����', '����', 200,  1);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'BBK', '�����', '����', 200,  5);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'KBS', 'û����', '�Ƿ�', 50,   3);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'BBK', '�޸�', '����', 80,  10);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'SSK', 'å'    , '����', 15,   5);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'EJW', 'å'    , '����', 15,   2);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'EJW', 'û����', '�Ƿ�', 50,   1);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'BBK', '�ȭ', NULL   , 30,   2);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'EJW', 'å'    , '����', 15,   1);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'BBK', '�ȭ', NULL   , 30,   2);
  
COMMIT;
SELECT * FROM userTBL;
SELECT * FROM buyTBL;
SELECT * FROM CLUBTBL;
SELECT * FROM STDCLUBTBL;


--p250
SELECT CAST(price AS CHAR(5)) || 'X ' || CAST(amount AS CHAR(4)) || '=' AS "�ܰ�X����",
            price*amount AS "���ž�" 
FROM buyTbl ;

SELECT CONCAT (CONCAT (CONCAT (CAST(price AS CHAR(5)), 'X '), CAST(amount AS CHAR(4))), '=') AS "�ܰ�X����",
            price*amount AS "���ž�"
FROM buyTbl ;

SELECT TO_CHAR(12345, '$999,999') FROM DUAL;
SELECT TO_CHAR(12345, '$000,999') FROM DUAL;
SELECT TO_CHAR(12345, 'L999,999') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MM:SS') FROM DUAL;

SELECT TO_CHAR(10, 'X'), TO_CHAR(255, 'XX') FROM DUAL;

--p252
SELECT ASCII('A'), CHR(65), ASCIISTR('��'), UNISTR('\D55C') FROM DUAL;

SELECT LENGTH('�ѱ�'), LENGTH('AB'), LENGTHB('�ѱ�'), LENGTHB('AB') FROM DUAL;
--p253
SELECT CONCAT('�̰���',' Oracle�̴�'), '�̰���' || ' ' || 'Oracle�̴�'  FROM DUAL;

SELECT INSTR('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�') FROM DUAL;
SELECT INSTR('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�', 2) FROM DUAL;
SELECT INSTRB('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�', 2) FROM DUAL;

SELECT LOWER('abcdEFGH'), UPPER('abcdEFGH'), INITCAP('this is oracle') FROM DUAL;

SELECT REPLACE ('�̰��� Oracle�̴�', '�̰���' , 'This is') FROM DUAL;
--p254
SELECT TRANSLATE('�̰��� Oracle�̴�', '�̰�' , 'AB') FROM DUAL;

SELECT SUBSTR('���ѹα�����', 3, 2) FROM DUAL;

SELECT REVERSE('Oracle') FROM DUAL;

SELECT LPAD('�̰���', 10, '##'), RPAD('�̰���', 10, '##') FROM DUAL;
--p255
SELECT LTRIM('   �̰���'), RTRIM('�̰���$$$', '$') FROM DUAL;

SELECT TRIM('   �̰���   '), TRIM(BOTH '��' FROM '��������վ��.������') FROM DUAL;
SELECT TRIM('   �̰���   '), TRIM(LEADING '��' FROM '��������վ��.������') FROM DUAL;
SELECT TRIM('   �̰���   '), TRIM(TRAILING '��' FROM '��������վ��.������') FROM DUAL;

SELECT REGEXP_COUNT('�̰��� ����Ŭ�̴�.', '��') FROM DUAL;
SELECT REGEXP_COUNT ('�̰���. ����Ŭ�̴�.', '\.') FROM DUAL;



--p256
SELECT ABS(-100) FROM DUAL;

SELECT CEIL(4.7), FLOOR(4.7), ROUND(4.7) FROM DUAL;

SELECT MOD(157, 10) FROM DUAL;

SELECT POWER(2,3), SQRT(9) FROM DUAL;
--p257
SELECT SIGN(100), SIGN(0), SIGN(-100.123) FROM DUAL;

SELECT TRUNC(12345.12345, 2), TRUNC(12345.12345, -2) FROM DUAL;

SELECT ADD_MONTHS('2020-01-01', 5), ADD_MONTHS(SYSDATE, -5)  FROM DUAL;
SELECT TO_DATE('2020-01-01') + 5,  SYSDATE - 5  FROM DUAL;
--p258
SELECT CURRENT_DATE, SYSDATE, CURRENT_TIMESTAMP FROM DUAL;

SELECT EXTRACT(YEAR FROM DATE '2020-12-25'), EXTRACT(DAY FROM SYSDATE) FROM DUAL;

SELECT LAST_DAY('2020-02-01') FROM DUAL;

SELECT NEXT_DAY('2020-02-01', '������'), NEXT_DAY(SYSDATE, '�Ͽ���')  FROM DUAL;

SELECT MONTHS_BETWEEN (SYSDATE, '1988-09-17') FROM DUAL;
--p259
SELECT BIN_TO_NUM(1,0), BIN_TO_NUM(1,1,1,1)  FROM DUAL;

SELECT NUMTODSINTERVAL(48, 'HOUR'), NUMTODSINTERVAL(360000, 'SECOND') FROM DUAL;

SELECT NUMTOYMINTERVAL(37, 'MONTH'), NUMTOYMINTERVAL(1.5, 'YEAR') FROM DUAL;

--------------- <�ǽ� 2> P260 ---------------------

-- ROW_NUMBER: ��ȣ�ο�
SELECT ROW_NUMBER( ) OVER(ORDER BY height DESC) "Űū����", userName, addr, height
   FROM userTBL ;

SELECT ROW_NUMBER( ) OVER(ORDER BY height DESC, userName ASC) "Űū����", userName, addr, height
   FROM userTbl ;

SELECT addr, ROW_NUMBER( ) OVER(PARTITION BY addr ORDER BY height DESC, userName ASC) "������Űū����", userName, height
   FROM userTbl ;

SELECT DENSE_RANK( ) OVER(ORDER BY height DESC)"Űū����", userName, addr, height
   FROM userTbl ;

SELECT RANK( ) OVER(ORDER BY height DESC)"Űū����", userName, addr, height
   FROM userTbl ;

--NTILE(2) : (��ȣ)�� �з� - �� ������� ����
SELECT NTILE(2) OVER(ORDER BY height DESC) "�ݹ�ȣ", userName, addr, height
   FROM userTbl;

SELECT NTILE(4) OVER(ORDER BY height DESC) "�ݹ�ȣ", userName, addr, height
   FROM userTbl;

--------------- </�ǽ� 2> ---------------------
--------------- <�ǽ� 3> P264 ---------------------
SELECT  userName, addr, height AS "Ű",
       height - (LEAD(height, 1, 0) OVER (ORDER BY height DESC)) AS "���� ����� Ű ����"
   FROM userTbl ;

SELECT addr, userName, height AS "Ű",
       height - ( FIRST_VALUE(height) OVER (PARTITION BY addr ORDER BY height DESC) ) 
             AS "������ �ִ�Ű�� ����"
   FROM userTbl ;

SELECT  addr, userName, height AS "Ű",
      (CUME_DIST() OVER (PARTITION BY addr ORDER BY height DESC)) * 100 AS "�����ο� �����%"
   FROM userTbl ;

SELECT  DISTINCT addr,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY height) OVER (PARTITION BY addr) 
               AS "������ Ű�� �߾Ӱ�"
   FROM userTbl ;
   
   SELECT * FROM USERTBL
   ORDER BY ADDR;
   
   
-------------- <�ǽ� 4> ---------------------
CREATE TABLE pivotTest
   (  uName NCHAR(3),
      season NCHAR(2),
      amount NUMBER(3));

INSERT  INTO  pivotTest VALUES ('�����' , '�ܿ�',  10) ;
INSERT  INTO  pivotTest VALUES ('������' , '����',  15) ;
INSERT  INTO  pivotTest VALUES ('�����' , '����',  25) ;
INSERT  INTO  pivotTest VALUES ('�����' , '��',    3) ;
INSERT  INTO  pivotTest VALUES ('�����' , '��',    37) ;
INSERT  INTO  pivotTest VALUES ('������' , '�ܿ�',  40) ;
INSERT  INTO  pivotTest VALUES ('�����' , '����',  14) ;
INSERT  INTO  pivotTest VALUES ('�����' , '�ܿ�',  22) ;
INSERT  INTO  pivotTest VALUES ('������' , '����',  64) ;
SELECT * FROM pivotTest;

COMMIT;

SELECT * FROM pivotTest
   PIVOT ( SUM(amount) -- 1���� ���� ����
           FOR season 
           IN ('��','����','����','�ܿ�') )   ;

--------------- </�ǽ� 4> ---------------------





   