CREATE TABLE STDTBL(
stdNAME NVARCHAR2(10) PRIMARY KEY,
addr NVARCHAR2(10) NOT NULL
);
CREATE TABLE CLUBTBL(
CLUBNAME NVARCHAR2(10) PRIMARY KEY,
ROMmNO NVARCHAR2(10) NOT NULL
);
CREATE TABLE STDCLUBTBL(
idnum NUMBER PRIMARY KEY,
stdNAME NVARCHAR2(10) NOT NULL,
CLUBNAME NVARCHAR2(10) NOT NULL,
FOREIGN KEY(stdNAME) REFERENCES STDTBL(stdNAME),
FOREIGN KEY(CLUBNAME) REFERENCES CLUBTBL(CLUBNAME)
);

CREATE SEQUENCE STDCLUBSEQ;

insert into stdtbl values('김범수','경남');
insert into stdtbl values('성시경','서울');
insert into stdtbl values('조용필','경기');
insert into stdtbl values('은지원','경북');
insert into stdtbl values('바비킴','서울');

insert into clubTbl values('수영','101호');
insert into clubTbl values('바둑','102호');
insert into clubTbl values('축구','103호');
insert into clubTbl values('봉사','104호');

insert into STDCLUBTBL values(STDCLUBSEQ.nextval,'김범수','바둑');
insert into STDCLUBTBL values(STDCLUBSEQ.nextval,'김범수','축구');
insert into STDCLUBTBL values(STDCLUBSEQ.nextval,'조용필','축구');
insert into STDCLUBTBL values(STDCLUBSEQ.nextval,'은지원','축구');
insert into STDCLUBTBL values(STDCLUBSEQ.nextval,'은지원','봉사');
insert into STDCLUBTBL values(STDCLUBSEQ.nextval,'바비킴','봉사');

commit;