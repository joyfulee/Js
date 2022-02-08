------------------------------------
-- 7.1 Oracle�� ������ ����  
------------------------------------
--p240
SELECT CAST(1234567.89 AS NUMBER(9,1)) FROM DUAL;
--p242
SELECT SYSDATE FROM DUAL ; -- ���� ��¥
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MM:SS') "���� ��¥" FROM DUAL; 
SELECT TO_DATE('20201231235959', 'YYYYMMDDHH24MISS') "��¥ ����" FROM DUAL; 
--p243
SELECT ROWID, userName FROM userTBL;
--p249
SELECT AVG(amount) AS "��� ���� ����" FROM buyTBL ;

SELECT CAST(AVG(amount) AS NUMBER(3)) AS "��� ���� ����" FROM buyTBL ;

SELECT CAST('2020$12$12' AS DATE) FROM DUAL;
SELECT CAST('2020/12/12' AS DATE) FROM DUAL;
SELECT CAST('2020%12%12' AS DATE) FROM DUAL;
SELECT CAST('2020@12@12' AS DATE) FROM DUAL;
--p250
SELECT CAST(price AS CHAR(5)) || 'X' || CAST(amount AS CHAR(4)) || '=' AS "�ܰ�X����",	price*amount AS "���ž�" 
  FROM buyTbl ;

SELECT TO_CHAR(12345, '$999,999') FROM DUAL;
SELECT TO_CHAR(12345, '$000,999') FROM DUAL;
SELECT TO_CHAR(12345, 'L999,999') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MM:SS') FROM DUAL;

SELECT TO_CHAR(10, 'X'), TO_CHAR(255, 'XX') FROM DUAL;
--p251
SELECT TO_NUMBER('A', 'X'), TO_NUMBER('FF', 'XX') FROM DUAL;

SELECT TO_NUMBER('0123'), TO_NUMBER('1234.456') FROM DUAL;

SELECT '100' + '200' FROM DUAL; -- ���ڿ� ���ڸ� ���� (������ ��ȯ�Ǽ� �����)
SELECT CONCAT('100', '200') FROM DUAL; -- ���ڿ� ���ڸ� ���� (���ڷ� ó��)
SELECT 100 || '200' FROM DUAL; -- ������ ���ڸ� ���� (������ ���ڷ� ��ȯ�Ǽ� ó��)
SELECT price  FROM buyTBL WHERE price >= '500'; -- ���� 500���� ��ȯ

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

SELECT REGEXP_COUNT('�̰��� ����Ŭ�̴�.', '��') FROM DUAL;
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

--------------- <�ǽ� 2> ---------------------
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

SELECT NTILE(2) OVER(ORDER BY height DESC) "�ݹ�ȣ", userName, addr, height
   FROM userTbl;

SELECT NTILE(4) OVER(ORDER BY height DESC) "�ݹ�ȣ", userName, addr, height
   FROM userTbl;

--------------- </�ǽ� 2> ---------------------
--------------- <�ǽ� 3> ---------------------
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

--------------- </�ǽ� 3> ---------------------

--------------- <�ǽ� 4> ---------------------
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

SELECT * FROM pivotTest
   PIVOT ( SUM(amount) 
           FOR season 
           IN ('��','����','����','�ܿ�') )   ;

--------------- </�ǽ� 4> ---------------------

