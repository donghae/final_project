-- 스프링 안드로이드 연동
-- 1. SYSTEM 계정에서 작업한다. 
-- 2. 사용자 계정 생성하기 
--CREATE USER <계정이름> IDENTIFIED BY <비밀번호> DEFAULT TABLESPACE USERS;
CREATE USER android IDENTIFIED BY tiger DEFAULT TABLESPACE USERS;

--3. 사용자 권한 부여 
--GRANT CONNECT, RESOURCE TO <계정이름>;
GRANT CONNECT, RESOURCE TO android;

--4 계정 해제
--ALTER USER <계정이름> ACCOUNT UNLOCK;
ALTER USER android ACCOUNT UNLOCK;

--5. 계정 삭제하기.. 계정 잘못 만든 경우에만
--drop user <계정이름> cascade;
DROP USER android cascade;

-- 6. 테이블 생성
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

-- 7. 데이터 생성
Insert into android_member_tbl (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('gockd','123','문재인','010-1010-1010','gjrjrem123@naver.com','19940101','남','서울 금천구 가산디지털2로 123(가산동,월드메르디앙2차) 410',0,9,0,to_timestamp('18/01/24 16:16:29.617000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into android_member_tbl (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('kis','123','김일성','010-0625-0625','kis@korea.love','19450625','남','경기 파주시 탄현면 필승로 369(성동리,오두산통일전망대)',0,9,0,to_timestamp('18/01/24 16:19:50.644000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into android_member_tbl (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('kji','123','김정일','010-0625-0625','kji@korea.love','19560625','남','강원 고성군 현내면 통일전망대로 26(제진리)',0,9,0,to_timestamp('18/01/24 16:21:03.710000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into android_member_tbl (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('kje','123','김정은','010-0625-0625','kje@korea.love','19810625','남','강원 고성군 현내면 통일전망대로 223-1(송현리)',0,9,0,to_timestamp('18/01/24 16:21:51.873000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into android_member_tbl (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('obama','123','버락오바마','010-0512-0512','obama@yahoo.net','19640512','남','서울 강북구 삼각산로 43(수유동,서울 영어마을 수유캠프)',0,9,0,to_timestamp('18/01/24 16:23:04.521000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into android_member_tbl (MEMBER_ID,MEMBER_PWD,MEMBER_NAME,MEMBER_TEL,MEMBER_EMAIL,MEMBER_BIRTH,MEMBER_SEX,MEMBER_ADDRESS,MEMBER_POINT,MEMBER_STEP,MEMBER_CUMPOINT,MEMBER_REG_DATE,MEMBER_IMG) values ('trump','123','트럼프','010-1212-1212','trump@yahoo.net','19601212','남','서울 강서구 초록마을로22길 24(화곡동,영어나라어린이집)',0,9,0,to_timestamp('18/01/24 16:24:14.827000000','RR/MM/DD HH24:MI:SSXFF'),null);
Commit;

select * from android_member_tbl;