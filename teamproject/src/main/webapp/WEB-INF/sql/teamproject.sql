drop table tbl_like;
drop table tbl_reply;
drop table tbl_attach;
drop table tbl_user;
drop table tbl_board;
drop table tbl_board_type;


create table tbl_board_type(
BoardTypeNo number(10) primary key,
BoardType varchar2(40)
);

-- 유저 테이블
create table tbl_user(
UserId varchar2(50) primary key,
UserPw varchar2(50) not null,
NickName varchar2(50) not null,
Email varchar2(50),
RegDate date default sysdate,
Profile varchar2(1000),
UserLevel number default 1,
Point number default 0
);

-- 일반적인 게시판 테이블
create table tbl_board(
BoardNo number(10) primary key,
Title VARCHAR2(300) NOT NULL,
Content clob NOT NULL,
UserId varchar2(50),
NickName varchar2(50) NOT NULL,
BoardType NUMBER(10) NOT NULL, -- 게시글 타입(공지/자유/질문/지식/...)
RegDate DATE DEFAULT SYSDATE,
UpdateDate DATE DEFAULT SYSDATE,
Views NUMBER(10) DEFAULT 0, -- 조회수
Likes number(10) DEFAULT 0, -- 좋아요
ReplyCount number(10) DEFAULT 0, -- 댓글 수

CONSTRAINT FK__board_Type FOREIGN KEY (BoardType) REFERENCES tbl_board_type (BoardTypeNo),
CONSTRAINT FK_board_UserId FOREIGN KEY (UserId) REFERENCES tbl_user (UserId)
);

-- 첨부파일 테이블
create table tbl_attach(
FileNo number(10) primary key,
BoardNo number(10),
UploadPath varchar2(1000) not null,
UploadDate date default sysdate,

constraint FK_attach_BoardNo FOREIGN KEY (BoardNo) REFERENCES tbl_board(BoardNo)
);

-- 댓글 테이블
create table tbl_reply(
ReplyNo number(10) primary key,
BoardNo number(10),
Comments varchar2(1000) not null,
ParentReplyNo number(10),
Replyer varchar2(50),
likes number(10) default 0,
updateDate date default sysdate,

constraint FK_reply_BoardNo FOREIGN KEY (BoardNo) REFERENCES tbl_board(BoardNo),
constraint FK_reply_ParentReplyNo FOREIGN KEY (ParentReplyNo) REFERENCES tbl_reply(ReplyNo),
constraint FK_reply_Replyer FOREIGN KEY (Replyer) REFERENCES tbl_user(UserId)
);

-- 좋아요/찜 테이블
create table tbl_like(
LikeNo number(10) primary key,
BoardNo number(10),
UserId varchar2(50),

constraint FK_like_BoardNo FOREIGN KEY (BoardNo) REFERENCES tbl_board(BoardNo),
constraint FK_like_UserId FOREIGN KEY (UserId) REFERENCES tbl_user(UserId)
);

drop table tbl_like;
drop table tbl_reply;
drop table tbl_attach;
drop table tbl_user;
drop table tbl_board;
drop table tbl_board_type;


create sequence seq_board;
create sequence seq_board_type;
create sequence seq_attach;
create sequence seq_reply;
create sequence seq_like;

insert into tbl_user(userId, userPw, nickname, email)
values('system', '1234', 'nickname', 'system@email,com');

insert into tbl_board_type
values(0, '공지사항');
-- 본인 게시판 데이터 넣으시길 --

commit;


