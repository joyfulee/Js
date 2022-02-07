------------------------------------
-- 7.1 Oracle의 데이터 형식  
------------------------------------
--p240
SELECT CAST(1234567.89 AS NUMBER(9,1)) FROM DUAL;
--p242
SELECT SYSDATE FROM DUAL ; -- 현재 날짜
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MM:SS') "현재 날짜" FROM DUAL; 
SELECT TO_DATE('20201231235959', 'YYYYMMDDHH24MISS') "날짜 형식" FROM DUAL; 
--p243
SELECT ROWID, userName FROM userTBL;
--p249
SELECT AVG(amount) AS "평균 구매 개수" FROM buyTBL ;

SELECT CAST(AVG(amount) AS NUMBER(3)) AS "평균 구매 개수" FROM buyTBL ;

SELECT CAST('2020$12$12' AS DATE) FROM DUAL;
SELECT CAST('2020/12/12' AS DATE) FROM DUAL;
SELECT CAST('2020%12%12' AS DATE) FROM DUAL;
SELECT CAST('2020@12@12' AS DATE) FROM DUAL;
--p250
SELECT CAST(price AS CHAR(5)) || 'X' || CAST(amount AS CHAR(4)) || '=' AS "단가X수량",	price*amount AS "구매액" 
  FROM buyTbl ;

SELECT TO_CHAR(12345, '$999,999') FROM DUAL;
SELECT TO_CHAR(12345, '$000,999') FROM DUAL;
SELECT TO_CHAR(12345, 'L999,999') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MM:SS') FROM DUAL;

SELECT TO_CHAR(10, 'X'), TO_CHAR(255, 'XX') FROM DUAL;
--p251
SELECT TO_NUMBER('A', 'X'), TO_NUMBER('FF', 'XX') FROM DUAL;

SELECT TO_NUMBER('0123'), TO_NUMBER('1234.456') FROM DUAL;

SELECT '100' + '200' FROM DUAL; -- 문자와 문자를 더함 (정수로 변환되서 연산됨)
SELECT CONCAT('100', '200') FROM DUAL; -- 문자와 문자를 연결 (문자로 처리)
SELECT 100 || '200' FROM DUAL; -- 정수와 문자를 연결 (정수가 문자로 변환되서 처리)
SELECT price  FROM buyTBL WHERE price >= '500'; -- 정수 500으로 변환

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

SELECT REGEXP_COUNT('이것이 오라클이다.', '이') FROM DUAL;
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

--------------- <실습 2> ---------------------
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

SELECT NTILE(2) OVER(ORDER BY height DESC) "반번호", userName, addr, height
   FROM userTbl;

SELECT NTILE(4) OVER(ORDER BY height DESC) "반번호", userName, addr, height
   FROM userTbl;

--------------- </실습 2> ---------------------
--------------- <실습 3> ---------------------
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

--------------- </실습 3> ---------------------

--------------- <실습 4> ---------------------
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

SELECT * FROM pivotTest
   PIVOT ( SUM(amount) 
           FOR season 
           IN ('봄','여름','가을','겨울') )   ;

--------------- </실습 4> ---------------------

