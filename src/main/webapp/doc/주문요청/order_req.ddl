DROP TABLE order_req CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE EBOOK CASCADE CONSTRAINTS;

-- 컬럼 추가
ALTER TABLE order_req ADD payid VARCHAR2(30);

/**********************************/
/* Table Name: 이북 */
/**********************************/
CREATE TABLE EBOOK(
		EB_NO                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CATENO                        		NUMBER(10)		 NULL ,
		EB_TITLE                      		VARCHAR2(200)		 NOT NULL,
		EB_AUTHOR                     		VARCHAR2(100)		 NOT NULL,
		EB_PUBLISHER                  		VARCHAR2(50)		 NOT NULL,
		EB_PDATE                      		VARCHAR2(20)		 NULL ,
		EB_USEINFO                    		VARCHAR2(500)		 NULL ,
		EB_DEVICE                     		VARCHAR2(500)		 NOT NULL,
		EB_INFOR                      		CLOB(4000)		 NULL ,
		EB_PRICE                      		NUMBER(10)		 NOT NULL,
		EB_SALETOT                    		NUMBER(10)		 NULL ,
		EB_PAGE                       		NUMBER(10)		 NULL ,
		EB_FILE1                      		VARCHAR2(100)		 NULL ,
		EB_SIZE1                      		NUMBER(10)		 NULL ,
		EB_FILE2                      		VARCHAR2(100)		 NULL ,
		EB_SIZE2                      		NUMBER(10)		 NULL ,
		EB_THUMB                      		VARCHAR2(100)		 NULL ,
		WORD                          		VARCHAR2(300)		 NULL ,
		RDATE                         		DATE		 NOT NULL
);

COMMENT ON TABLE EBOOK is '이북';
COMMENT ON COLUMN EBOOK.EB_NO is '이북 번호';
COMMENT ON COLUMN EBOOK.CATENO is '카테고리 번호';
COMMENT ON COLUMN EBOOK.EB_TITLE is '제목';
COMMENT ON COLUMN EBOOK.EB_AUTHOR is '저자';
COMMENT ON COLUMN EBOOK.EB_PUBLISHER is '출판사';
COMMENT ON COLUMN EBOOK.EB_PDATE is '출간일';
COMMENT ON COLUMN EBOOK.EB_USEINFO is '이용안내';
COMMENT ON COLUMN EBOOK.EB_DEVICE is '지원기기';
COMMENT ON COLUMN EBOOK.EB_INFOR is '도서 정보';
COMMENT ON COLUMN EBOOK.EB_PRICE is '판매가';
COMMENT ON COLUMN EBOOK.EB_SALETOT is '판매량';
COMMENT ON COLUMN EBOOK.EB_PAGE is '페이지 수';
COMMENT ON COLUMN EBOOK.EB_FILE1 is '이북 파일';
COMMENT ON COLUMN EBOOK.EB_SIZE1 is '이북 파일 크기';
COMMENT ON COLUMN EBOOK.EB_FILE2 is '메인 이미지';
COMMENT ON COLUMN EBOOK.EB_SIZE2 is '메인 이미지 파일 크기';
COMMENT ON COLUMN EBOOK.EB_THUMB is '썸네일';
COMMENT ON COLUMN EBOOK.WORD is '검색어';
COMMENT ON COLUMN EBOOK.RDATE is '담긴 날짜';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		M_NO                          		NUMBER(6)		 NOT NULL		 PRIMARY KEY,
		ID                            		VARCHAR2(20)		 NOT NULL,
		PASSWD                        		VARCHAR2(60)		 NOT NULL,
		MNAME                         		VARCHAR2(20)		 NOT NULL,
		EMAIL                         		VARCHAR2(60)		 NOT NULL,
		TEL                           		VARCHAR2(14)		 NOT NULL,
		ZIPCODE                       		VARCHAR2(5)		 NULL ,
		ADDRESS1                      		VARCHAR2(80)		 NULL ,
		ADDRESS2                      		VARCHAR2(50)		 NULL ,
		MDATE                         		DATE		 NOT NULL,
  CONSTRAINT SYS_C008370 UNIQUE (ID)
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.M_NO is '회원 번호';
COMMENT ON COLUMN MEMBER.ID is '아이디';
COMMENT ON COLUMN MEMBER.PASSWD is '패스워드';
COMMENT ON COLUMN MEMBER.MNAME is '성명';
COMMENT ON COLUMN MEMBER.EMAIL is '이메일';
COMMENT ON COLUMN MEMBER.TEL is '전화번호';
COMMENT ON COLUMN MEMBER.ZIPCODE is '우편번호';
COMMENT ON COLUMN MEMBER.ADDRESS1 is '주소1';
COMMENT ON COLUMN MEMBER.ADDRESS2 is '주소2';
COMMENT ON COLUMN MEMBER.MDATE is '가입일';


/**********************************/
/* Table Name: 주문요청 */
/**********************************/
CREATE TABLE order_req(
		order_no                    		NUMBER(10)		     NOT NULL		 PRIMARY KEY,
        payid                               VARCHAR2(30)         NOT NULL,
		payway                        		VARCHAR2(30)		 NOT NULL,
        price                                NUMBER(10)		     NOT NULL ,
		EB_NO                         		NUMBER(10)		     NULL ,
		user_id                             VARCHAR2(20)         NULL,
        rdate                         		DATE		         default sysdate,
        FOREIGN KEY (EB_NO) REFERENCES EBOOK (EB_NO),
        FOREIGN KEY (user_id) REFERENCES member (id)
);

COMMENT ON TABLE order_req is '주문요청';
COMMENT ON COLUMN order_req.order_no is '주문번호';
COMMENT ON COLUMN order_req.payid is '결제번호';
COMMENT ON COLUMN .payway is '결제방법';
COMMENT ON COLUMN order_req.price is '결제금액';
COMMENT ON COLUMN order_req.rdate is '결제일시';
COMMENT ON COLUMN order_req.EB_NO is '이북 번호';
COMMENT ON COLUMN order_req.user_id is '회원 아이디';


DROP SEQUENCE orderreq_seq;
-- 카트 번호를 생성할 시퀀스
CREATE SEQUENCE orderreq_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지    



-- 등록
INSERT INTO order_req(order_no, payid, user_id, eb_no, payway, price)
VALUES (orderreq_seq.nextval,'200210219_121212','crm',11, '신용카드',12000);

INSERT INTO order_req(order_no, payid, user_id, eb_no, payway, price)
VALUES (orderreq_seq.nextval,'200210219_121213','crm',10, '신용카드',13300);

INSERT INTO order_req(order_no, payid, user_id, eb_no, payway, price)
VALUES (orderreq_seq.nextval,'200210219_121214','crm',9, '신용카드',14000);


-- 목록
SELECT order_no, payid, user_id, eb_no, payway, price, rdate 
FROM order_req
ORDER BY rdate ASC
into outfile './ebook_sales.csv' fields terminated by ',' enclosed by "'"; 


-- 회원페이지: 목록
select
 o.order_no, o.user_id, o.payid, o.eb_no, o.price, o.rdate,
 e.eb_no, e.eb_title, e.eb_thumb, e.eb_price, e.eb_file1
from order_req o
     inner join ebook e
         on o.eb_no = e.eb_no
where o.user_id = 'user2';
     
     
-- 조회
SELECT order_no, user_id, eb_no, payway, price, rdate 
FROM order_req
WHERE order_no=1;


-- 수정
UPDATE order_req 
SET payway='무통장'
WHERE order_no = 1;

-- 삭제
DELETE order_req
WHERE order_no=4;

DELETE FROM order_req;


-- 검색
SELECT
 o.order_no, o.user_id, o.payid, o.eb_no, o.price, o.rdate,
 e.eb_no, e.eb_title, e.eb_thumb, e.eb_price, e.eb_file1
FROM order_req o
     inner join ebook e
         on o.eb_no = e.eb_no
WHERE o.user_id = 'crm' AND e.eb_title LIKE '%기출%'
ORDER BY o.rdate DESC;

-- 검색된 레코드 수
SELECT COUNT(*) as cnt
FROM order_req o
   INNER JOIN ebook e
        ON o.eb_no = e.eb_no
WHERE o.user_id = 'crm' AND e.eb_title LIKE '%기출%';




COMMIT;

































































