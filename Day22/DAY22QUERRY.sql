-- ����18

/* SUBAUERY (�Ϻ�����)  SELECT ������ �� (SELECT ������)
   1) ������������ ���� ���� 
   2) �������� �� ORDER BY ����� �� ����
   
  �� ���� �� �������� (Single Row SubQuery)
     :���� �� �����ڸ� ��� ���������� �ϳ��� ����� ���
  �� 
  ��
  �� ��ø���� : �񱳿�����
*/

-- LOCALMADANG 
-- ���� ��� ���� ã�� 
SELECT  MAX(PRICE)FROM BOOK; 

SELECT BOOKNAME FROM BOOK 
WHERE PRICE = (SELECT MAX (PRICE) FROM BOOK);

-- ���� ������ ID ã�� -> �ߺ�����
SELECT DISTINCT CUSTID FROM ORDERS; 

SELECT NAME 
FROM CUSTOMER
WHERE CUSTID IN(SELECT DISTINCT CUSTID FROM ORDERS)
ORDER BY NAME;

SELECT NAME 
FROM CUSTOMER
WHERE CUSTID =ANY(SELECT DISTINCT CUSTID FROM ORDERS)
ORDER BY NAME;

--�������ǻ� ������ ���� IDã�� 
SELECT BOOKID FROM ORDERS WHERE BOOKID
IN(SELECT BOOKID FROM BOOK WHERE PUBLISHER='�������ǻ�');

SELECT BOOKID FROM ORDERS WHERE BOOKID
=ANY(SELECT BOOKID FROM BOOK WHERE PUBLISHER='�������ǻ�');

--�ش� ����ID �̸�ã�� 
SELECT NAME FROM CUSTOMER WHERE CUSTID 
    IN(SELECT CUSTID FROM ORDERS WHERE BOOKID
        IN(SELECT BOOKID FROM BOOK WHERE PUBLISHER='�������ǻ�'));
        
SELECT NAME FROM CUSTOMER WHERE CUSTID 
    =ANY(SELECT CUSTID FROM ORDERS WHERE BOOKID
        =ANY(SELECT BOOKID FROM BOOK WHERE PUBLISHER='�������ǻ�'));     


-- �̻�̵�� ������ ���� ���Ű��� �̸�, ����ó, ����(��,��) ���
SELECT NAME,PHONE,DECODE(SEX,'F','��','��')SEX FROM CUSTOMER WHERE CUSTID
    =ANY(SELECT CUSTID FROM ORDERS WHERE BOOKID
        =ANY(SELECT BOOKID FROM BOOK WHERE PUBLISHER='�̻�̵��'));
        

-- ���ǻ纰 ��� �������ݺ��� ��� ���� 
-- BOOKTBL �ι����
-- ���ǻ� ������ ��հ��� ���ϱ�, 


SELECT BOOKNAME, PUBLISHER
FROM BOOK B1
WHERE B1.PRICE > 
    (SELECT AVGPRICE 
     FROM (SELECT PUBLISHER, AVG(PRICE) AVGPRICE FROM BOOK GROUP BY PUBLISHER)B2
     WHERE B1.PUBLISHER=B2.PUBLISHER);


-- ����19
SELECT AVG(SALEPRICE)SALEPRICE FROM ORDERS;

SELECT ORDERID, SALEPRICE FROM ORDERS
WHERE SALEPRICE <=(SELECT AVG(SALEPRICE)SALEPRICE FROM ORDERS);

SELECT CUSTID, AVG(SALEPRICE)SALEPRICE FROM ORDERS GROUP BY CUSTID;

SELECT ORDERID, CUSTID, SALEPRICE FROM ORDERS O1
WHERE SALEPRICE > (SELECT SALEPRICE FROM
    (SELECT CUSTID, AVG(SALEPRICE)SALEPRICE FROM ORDERS GROUP BY CUSTID)O2
    WHERE O1.CUSTID=O2.CUSTID);
    
SELECT CUSTID FROM CUSTOMER WHERE ADDRESS LIKE '���ѹα�%';

SELECT SUM(SALEPRICE) "���ѹα� ���Ǹž�"
FROM ORDERS 
    WHERE CUSTID IN (SELECT CUSTID FROM CUSTOMER WHERE ADDRESS LIKE '���ѹα�%');
    
SELECT SUM(SALEPRICE) "���ѹα� ���Ǹž�"
FROM ORDERS 
    WHERE CUSTID =ANY(SELECT CUSTID FROM CUSTOMER WHERE ADDRESS LIKE '���ѹα�%');    


------------ �ٽ� Ǯ��� (����) --------------------------------------     
SELECT SUM(SALEPRICE)
FROM ORDERS O
WHERE EXISTS (SELECT CUSTID FROM CUSTOMER C
WHERE (SELECT C.CUSTID=O.CUSTID AND C.ADDRESS LIKE '���ѹα�%');
---------------------------------------------------------------------------


-- ����20
SELECT SALEPRICE FROM ORDERS WHERE CUSTID=3;

--EXISTS ������ ���
SELECT ORDERID, SALEPRICE 
FROM ORDERS O1
WHERE EXISTS (SELECT SALEPRICE FROM ORDERS O2 WHERE O1.SALEPRICE>
            (SELECT MAX (SALEPRICE) FROM ORDERS WHERE (CUSTID=3)));

SELECT ORDERID, SALEPRICE 
FROM ORDERS 
    WHERE SALEPRICE > ALL(SELECT SALEPRICE FROM ORDERS WHERE CUSTID=3);
    
    
 -- ����21
 SELECT SUM (SALEPRICE) "���ѹα� ���Ǹž�"
 FROM ORDERS O
 WHERE EXISTS (SELECT C.CUSTID FROM CUSTOMER C
 WHERE O.CUSTID=C.CUSTID AND C.ADDRESS LIKE '���ѹα�%');
 
 
 -- ����22
 SELECT (SELECT NAME , FROM CUSTOMER C WHERE C.CUSTID=O.CUSTID) NAME, 
 SUM(SALEPRICE)SUMSALFRICE FROM ORSERS GROUP BY CUSTID;


-- ����23
CREATE TABLE NEWORDERS AS 
SELECT * FROM ORDERS;

ALTER TABLE NEWORDERS
ADD BOOKNAME VARCHAR2(40);

UPDATE NEWORDERS O
SET BOOKNAME = (SELECT BOOKNAME FROM BOOK B WHERE O.BOOKID = B.BOOKID);


-- ����24
SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID <=2;

--�ζ��� �� (JOIN)

SELECT O.CUSTID ,C.NAME , SUM(SALEPRICE)
FROM ORDERS O ,(SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID <=2) C  -- ���̺�2��
WHERE O.CUSTID=C.CUSTID
GROUP BY O.CUSTID,NAME; -- �����Լ� ����ϱ� ���� GROUP BY

--��Į�� �μ����� 
SELECT CUSTID,(SELECT NAME FROM CUSTOMER C WHERE O.CUSTID = C.CUSTID) NAME,
SUM(SALEPRICE)
FROM ORDERS O
WHERE CUSTID <=2
GROUP BY CUSTID;

SELECT BOOKID, BOOKNAME FROM BOOK WHERE PRICE >=10000;

-- �ζ��κ�
SELECT O.BOOKID, BOOKNAME , SUM(SALEPRICE) -- ���
FROM ORDERS O ,--BOOKID = BOOKID : ������̺�
(SELECT BOOKID, BOOKNAME FROM BOOK WHERE PRICE >=10000) B -- : �������̺�
WHERE O.BOOKID = B.BOOKID -- ���� �ʵ�
GROUP BY O.BOOKID, BOOKNAME; -- �����ռ� (�������̺� SELECT)
-- ��Į�� �μ�����
SELECT BOOKID,    -- �����ʵ� 
(SELECT BOOKNAME FROM BOOK B WHERE PRICE>=10000 AND O.BOOKID=B.BOOKID) AS BNAME 
, SUM(SALEPRICE)SALEPRICE 
FROM ORDERS O
GROUP BY O.BOOKID;

HAVIING (SELECT BOOKNAME FROM BOOK B WHERE PRICE >=10000 AND O.BOOKID=B.BOOKID)
IS NOT MULL;


