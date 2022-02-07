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

insert into stdtbl values('�����','�泲');
insert into stdtbl values('���ð�','����');
insert into stdtbl values('������','���');
insert into stdtbl values('������','���');
insert into stdtbl values('�ٺ�Ŵ','����');

insert into clubTbl values('����','101ȣ');
insert into clubTbl values('�ٵ�','102ȣ');
insert into clubTbl values('�౸','103ȣ');
insert into clubTbl values('����','104ȣ');

insert into STDCLUBTBL values(STDCLUBSEQ.nextval,'�����','�ٵ�');
insert into STDCLUBTBL values(STDCLUBSEQ.nextval,'�����','�౸');
insert into STDCLUBTBL values(STDCLUBSEQ.nextval,'������','�౸');
insert into STDCLUBTBL values(STDCLUBSEQ.nextval,'������','�౸');
insert into STDCLUBTBL values(STDCLUBSEQ.nextval,'������','����');
insert into STDCLUBTBL values(STDCLUBSEQ.nextval,'�ٺ�Ŵ','����');

commit;