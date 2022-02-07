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
 
  INSERT INTO STDTBL VALUES ('김범수','경남');
  INSERT INTO STDTBL VALUES ('성시경','서울');
  INSERT INTO STDTBL VALUES ('조용필','경기');
  INSERT INTO STDTBL VALUES ('은지원','경북');
  INSERT INTO STDTBL VALUES ('바비킴','서울');
  INSERT INTO CLUBTBL VALUES ('수영','101호');
  INSERT INTO CLUBTBL VALUES ('바둑','102호');
  INSERT INTO CLUBTBL VALUES ('축구','103호');
  INSERT INTO CLUBTBL VALUES ('봉사','104호');
  
  INSERT INTO STDCLUBTBL VALUES(STDCLUBSEQ.NEXTVAL,'김범수','바둑');
  INSERT INTO STDCLUBTBL VALUES(STDCLUBSEQ.NEXTVAL,'김범수','축구');
  INSERT INTO STDCLUBTBL VALUES(STDCLUBSEQ.NEXTVAL,'조용필','축구');
  INSERT INTO STDCLUBTBL VALUES(STDCLUBSEQ.NEXTVAL,'은지원','축구');
  INSERT INTO STDCLUBTBL VALUES(STDCLUBSEQ.NEXTVAL,'은지원','봉사');
  INSERT INTO STDCLUBTBL VALUES(STDCLUBSEQ.NEXTVAL,'바비킴','봉사');
  
  INSERT INTO USERTBL VALUES('LSG','이승기',1987,'서울','011','11111111',182,'2008-8-8');
  INSERT INTO USERTBL VALUES('KBS','김범수',1979,'전남','011','22222222',173,'2012-4-4');
  INSERT INTO USERTBL VALUES('KKH','김경호',1971,'경기','019','33333333',177,'2007-7-7');
  INSERT INTO USERTBL VALUES('JYP','조용필',1950,'서울','011','44444444',166,'2009-9-9');
  INSERT INTO USERTBL VALUES('SSK','성시경',1979,'서울',NULL,NULL,186,'2013-12-12');
  -- NULL 값이 많은경우, 삽입할 필드명을 작성 , 그 값만 입력!!
  INSERT INTO USERTBL VALUES('LJB','임재범',1963,'서울','016','66666666',182,'2009-9-9');
  INSERT INTO USERTBL VALUES('YJS','윤종신',1969,'경남',NULL,NULL,170,'2005-5-5');
  INSERT INTO USERTBL VALUES('EJW','은지원',1972,'경북','011','88888888',174,'2014-3-3');
  INSERT INTO USERTBL VALUES('JKW','조관우',1965,'경기','018','99999999',172,'2010-10-10');
  INSERT INTO USERTBL VALUES('BBK','바비킴',1973,'서울','010','00000000',176,'2013-5-5');
  
  CREATE SEQUENCE idSEQ; -- 순차번호 입력을 위해서 시퀀스 생성
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buyTBL VALUES(idSEQ.NEXTVAL, 'BBK', '운동화', NULL   , 30,   2);
  
COMMIT;
SELECT * FROM userTBL;
SELECT * FROM buyTBL;
SELECT * FROM CLUBTBL;
SELECT * FROM STDCLUBTBL;


--p250
SELECT CAST(price AS CHAR(5)) || 'X ' || CAST(amount AS CHAR(4)) || '=' AS "단가X수량",
            price*amount AS "구매액" 
FROM buyTbl ;

SELECT CONCAT (CONCAT (CONCAT (CAST(price AS CHAR(5)), 'X '), CAST(amount AS CHAR(4))), '=') AS "단가X수량",
            price*amount AS "구매액"
FROM buyTbl ;

SELECT TO_CHAR(12345, '$999,999') FROM DUAL;
SELECT TO_CHAR(12345, '$000,999') FROM DUAL;
SELECT TO_CHAR(12345, 'L999,999') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MM:SS') FROM DUAL;

SELECT TO_CHAR(10, 'X'), TO_CHAR(255, 'XX') FROM DUAL;

--p252
SELECT ASCII('A'), CHR(65), ASCIISTR('한'), UNISTR('\D55C') FROM DUAL;

SELECT LENGTH('한글'), LENGTH('AB'), LENGTHB('한글'), LENGTHB('AB') FROM DUAL;
--p253
SELECT CONCAT('이것이',' Oracle이다'), '이것이' || ' ' || 'Oracle이다'  FROM DUAL;

SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다', '이것') FROM DUAL;
SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다', '이것', 2) FROM DUAL;
SELECT INSTRB('이것이 Oracle이다. 이것도 오라클이다', '이것', 2) FROM DUAL;

SELECT LOWER('abcdEFGH'), UPPER('abcdEFGH'), INITCAP('this is oracle') FROM DUAL;

SELECT REPLACE ('이것이 Oracle이다', '이것이' , 'This is') FROM DUAL;
--p254
SELECT TRANSLATE('이것이 Oracle이다', '이것' , 'AB') FROM DUAL;

SELECT SUBSTR('대한민국만세', 3, 2) FROM DUAL;

SELECT REVERSE('Oracle') FROM DUAL;

SELECT LPAD('이것이', 10, '##'), RPAD('이것이', 10, '##') FROM DUAL;
--p255
SELECT LTRIM('   이것이'), RTRIM('이것이$$$', '$') FROM DUAL;

SELECT TRIM('   이것이   '), TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ') FROM DUAL;
SELECT TRIM('   이것이   '), TRIM(LEADING 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ') FROM DUAL;
SELECT TRIM('   이것이   '), TRIM(TRAILING 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ') FROM DUAL;

SELECT REGEXP_COUNT('이것이 오라클이다.', '이') FROM DUAL;
SELECT REGEXP_COUNT ('이것이. 오라클이다.', '\.') FROM DUAL;



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

SELECT NEXT_DAY('2020-02-01', '월요일'), NEXT_DAY(SYSDATE, '일요일')  FROM DUAL;

SELECT MONTHS_BETWEEN (SYSDATE, '1988-09-17') FROM DUAL;
--p259
SELECT BIN_TO_NUM(1,0), BIN_TO_NUM(1,1,1,1)  FROM DUAL;

SELECT NUMTODSINTERVAL(48, 'HOUR'), NUMTODSINTERVAL(360000, 'SECOND') FROM DUAL;

SELECT NUMTOYMINTERVAL(37, 'MONTH'), NUMTOYMINTERVAL(1.5, 'YEAR') FROM DUAL;

--------------- <실습 2> P260 ---------------------

-- ROW_NUMBER: 번호부여
SELECT ROW_NUMBER( ) OVER(ORDER BY height DESC) "키큰순위", userName, addr, height
   FROM userTBL ;

SELECT ROW_NUMBER( ) OVER(ORDER BY height DESC, userName ASC) "키큰순위", userName, addr, height
   FROM userTbl ;

SELECT addr, ROW_NUMBER( ) OVER(PARTITION BY addr ORDER BY height DESC, userName ASC) "지역별키큰순위", userName, height
   FROM userTbl ;

SELECT DENSE_RANK( ) OVER(ORDER BY height DESC)"키큰순위", userName, addr, height
   FROM userTbl ;

SELECT RANK( ) OVER(ORDER BY height DESC)"키큰순위", userName, addr, height
   FROM userTbl ;

--NTILE(2) : (괄호)로 분류 - 잘 사용하지 않음
SELECT NTILE(2) OVER(ORDER BY height DESC) "반번호", userName, addr, height
   FROM userTbl;

SELECT NTILE(4) OVER(ORDER BY height DESC) "반번호", userName, addr, height
   FROM userTbl;

--------------- </실습 2> ---------------------
--------------- <실습 3> P264 ---------------------
SELECT  userName, addr, height AS "키",
       height - (LEAD(height, 1, 0) OVER (ORDER BY height DESC)) AS "다음 사람과 키 차이"
   FROM userTbl ;

SELECT addr, userName, height AS "키",
       height - ( FIRST_VALUE(height) OVER (PARTITION BY addr ORDER BY height DESC) ) 
             AS "지역별 최대키와 차이"
   FROM userTbl ;

SELECT  addr, userName, height AS "키",
      (CUME_DIST() OVER (PARTITION BY addr ORDER BY height DESC)) * 100 AS "누적인원 백분율%"
   FROM userTbl ;

SELECT  DISTINCT addr,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY height) OVER (PARTITION BY addr) 
               AS "지역별 키의 중앙값"
   FROM userTbl ;
   
   SELECT * FROM USERTBL
   ORDER BY ADDR;
   
   
-------------- <실습 4> ---------------------
CREATE TABLE pivotTest
   (  uName NCHAR(3),
      season NCHAR(2),
      amount NUMBER(3));

INSERT  INTO  pivotTest VALUES ('김범수' , '겨울',  10) ;
INSERT  INTO  pivotTest VALUES ('윤종신' , '여름',  15) ;
INSERT  INTO  pivotTest VALUES ('김범수' , '가을',  25) ;
INSERT  INTO  pivotTest VALUES ('김범수' , '봄',    3) ;
INSERT  INTO  pivotTest VALUES ('김범수' , '봄',    37) ;
INSERT  INTO  pivotTest VALUES ('윤종신' , '겨울',  40) ;
INSERT  INTO  pivotTest VALUES ('김범수' , '여름',  14) ;
INSERT  INTO  pivotTest VALUES ('김범수' , '겨울',  22) ;
INSERT  INTO  pivotTest VALUES ('윤종신' , '여름',  64) ;
SELECT * FROM pivotTest;

COMMIT;

SELECT * FROM pivotTest
   PIVOT ( SUM(amount) -- 1개의 연산 가능
           FOR season 
           IN ('봄','여름','가을','겨울') )   ;

--------------- </실습 4> ---------------------





   