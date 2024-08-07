
-- 게시판 타입 테이블    
create table tbl_board_type(
    BoardTypeNo number(10) primary key,
    BoardType varchar2(40)
    );

-- 유저 테이블
create table tbl_user(
    UserNo number(10) primary key,
    UserId varchar2(20) not null,
    UserPw varchar2(20) not null,
    NickName varchar2(20) not null,
    Email varchar2(30),
    RegDate date default sysdate,
    ThumbNail varchar2(100),
    Lv number default 1,
    Point number default 0
 );
    
-- 일반적인 게시판 테이블
create table tbl_board(
    BoardNo number(10) primary key,
    Title VARCHAR2(300) NOT NULL,
    Content VARCHAR2(2000) NOT NULL,
    Writer NUMBER(10) NOT NULL,
    BaordType NUMBER(10) NOT NULL, -- 게시글 타입(공지/자유/질문/지식/...)
    RegDate DATE DEFAULT SYSDATE,
    UpdateDate DATE DEFAULT SYSDATE,
    Views NUMBER(10) DEFAULT 0, -- 조회수
    Likes number(10) DEFAULT 0, -- 좋아요 
    ReplyCount number(10) DEFAULT 0, -- 댓글 수
    
    CONSTRAINT FK__board_Type FOREIGN KEY (BaordType) REFERENCES tbl_board_type (BoardTypeNo),
    CONSTRAINT FK_board_Writer FOREIGN KEY (Writer) REFERENCES tbl_user (UserNo)
);
  
-- 첨부파일 테이블
create table tbl_attach(
    FileNo number(10) primary key,
    BoardNo number(10),
    UploadPath varchar2(1000) not null,
    RegDate date default sysdate,
    
    constraint FK_attach_BoardNo FOREIGN KEY (BoardNo) REFERENCES tbl_board(BoardNo)
);

-- 댓글 테이블
create table tbl_reply(
    ReplyNo number(10) primary key,
    BoardNo number(10),
    Comments varchar2(1000) not null,
    Replyer varchar2(20),
    likes number(10) default 0,
    updateDate date default sysdate,
    
    constraint FK_reply_BoardNo FOREIGN KEY (BoardNo) REFERENCES tbl_board(BoardNo)
);

-- 좋아요/찜 테이블
create table tbl_like(
    LikeNo number(10) primary key,
    BoardNo number(10),
    UserNo number(10),
    
    constraint FK_like_BoardNo FOREIGN KEY (BoardNo) REFERENCES tbl_board(BoardNo),
    constraint FK_like_UserNo FOREIGN KEY (UserNo) REFERENCES tbl_user(UserNo)
);

create sequence seq_board;
create sequence seq_board_type;
create sequence seq_user;
create sequence seq_attach;
create sequence seq_reply;
create sequence seq_like;"