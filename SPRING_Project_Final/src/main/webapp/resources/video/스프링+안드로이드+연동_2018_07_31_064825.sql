-- ������ �ȵ���̵� ����
-- 1. SYSTEM �������� �۾��Ѵ�. 
-- 2. ����� ���� �����ϱ� 
--CREATE USER <�����̸�> IDENTIFIED BY <��й�ȣ> DEFAULT TABLESPACE USERS;
CREATE USER android IDENTIFIED BY tiger DEFAULT TABLESPACE USERS;

--3. ����� ���� �ο� 
--GRANT CONNECT, RESOURCE TO <�����̸�>;
GRANT CONNECT, RESOURCE TO android;

--4 ���� ����
--ALTER USER <�����̸�> ACCOUNT UNLOCK;
ALTER USER android ACCOUNT UNLOCK;

--5. ���� �����ϱ�.. ���� �߸� ���� ��쿡��
--drop user <�����̸�> cascade;
DROP USER android cascade;

-- 6. ���̺� ����
CREATE TABLE android_member_tbl
(
    member_id          VARCHAR2(30)     NOT NULL,
    member_pwd         VARCHAR2(30)     NOT NULL,
    member_name        VARCHAR2(20)     NOT NULL,
    member_tel         VARCHAR2(13)     NULL,
    member_email       VARCHAR2(50)     NOT NULL,
    member_birth       VARCHAR2(30)     NOT NULL,
    member_sex         VARCHAR2(10)     NOT NULL,
    member_address     VARCHAR2(100)    NULL,
    member_point       NUMBER           NULL,
    member_step        NUMBER           NOT NULL,
    member_cumPoint    NUMBER           NULL,
    member_reg_date    TIMESTAMP        NOT NULL,
    member_img         VARCHAR(100)     NULL,
    CONSTRAINT ANDROID_MEMBER_TBL_PK PRIMARY KEY (member_id)
);

-- 7. ������ ����
Insert into android_member_tbl (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('gockd','123','������','010-1010-1010','gjrjrem123@naver.com','19940101','��','���� ��õ�� ���������2�� 123(���굿,����޸����2��) 410',0,9,0,to_timestamp('18/01/24 16:16:29.617000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into android_member_tbl (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('kis','123','���ϼ�','010-0625-0625','kis@korea.love','19450625','��','��� ���ֽ� ź���� �ʽ·� 369(������,���λ�����������)',0,9,0,to_timestamp('18/01/24 16:19:50.644000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into android_member_tbl (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('kji','123','������','010-0625-0625','kji@korea.love','19560625','��','���� ���� ������ ����������� 26(������)',0,9,0,to_timestamp('18/01/24 16:21:03.710000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into android_member_tbl (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('kje','123','������','010-0625-0625','kje@korea.love','19810625','��','���� ���� ������ ����������� 223-1(������)',0,9,0,to_timestamp('18/01/24 16:21:51.873000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into android_member_tbl (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('obama','123','�������ٸ�','010-0512-0512','obama@yahoo.net','19640512','��','���� ���ϱ� �ﰢ��� 43(������,���� ����� ����ķ��)',0,9,0,to_timestamp('18/01/24 16:23:04.521000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into android_member_tbl (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('trump','123','Ʈ����','010-1212-1212','trump@yahoo.net','19601212','��','���� ������ �ʷϸ�����22�� 24(ȭ�,���������)',0,9,0,to_timestamp('18/01/24 16:24:14.827000000','RR/MM/DD HH24:MI:SSXFF'),null);
Commit;

select * from android_member_tbl;