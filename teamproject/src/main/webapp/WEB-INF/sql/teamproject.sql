create table tbl_board_type(
    btno number(10) primary key,
    btname varchar2(20)
    );

create table tbl_user(
    uno number(10) primary key,
    u_id varchar2(20) not null,
    upw varchar2(20) not null,
    uname varchar2(20) not null,
    nickname varchar2(20) not null,
    email varchar2(30),
    regDate date default sysdate
    );
    
create table tbl_attach(
    fno number(20) primary key,
    fileName varchar2(100) not null,
    uploadPath varchar2(100) not null,
    uuid varchar2(100) not null,
    image char(1) default 'F'
    );
    
create table tbl_board(
    bno number(10) primary key,
    title varchar2(30) not null,
    content varchar2(1000) not null,
    writer number(10) not null,
    btype number(10) not null,
    views number(10) default 0,
    uploadFile number(10),
    regDate date default sysdate,
    updatedate date default sysdate,
    constraint fk_btype foreign key(btype) references tbl_board_type(btno),
    constraint fk_writer foreign key(writer) references tbl_user(uno),
    constraint fk_uploadFile foreign key(uploadFile) references tbl_attach(fno)
    );
    
create sequence seq_attach;
create sequence seq_board;
create sequence seq_board_type;
create sequence seq_user;

insert into tbl_board_type
values(seq_board_type.nextval, '공지사항');

insert into tbl_user
values(0, 'system', '1234', 'sysname', 'sysnick', 'sys@hot.com', sysdate);


INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate) VALUES (seq_board.nextval, '공지사항1', '<h2>2024년 차박 캠핑 안내</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 차박 캠핑을 안내드립니다. 이번 캠핑에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>차박 체험</li><li>캠핑 요리</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/car-camping">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate) VALUES (seq_board.nextval, '공지사항2', '<h2>2024년 글램핑 행사 안내</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 글램핑 행사를 안내드립니다. 이번 행사에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>럭셔리 글램핑</li><li>별 관측</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/glamping">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate) VALUES (seq_board.nextval, '공지사항3', '<h2>2024년 캠핑 축제 안내</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 캠핑 축제를 안내드립니다. 이번 축제에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>캠핑 장비 전시</li><li>야외 게임</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/camping-festival">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate) VALUES (seq_board.nextval, '공지사항4', '<h2>2024년 여름 차박 캠핑</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 여름 차박 캠핑을 안내드립니다. 이번 캠핑에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>차박 요리 교실</li><li>야외 영화 상영</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/summer-car-camping">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate) VALUES (seq_board.nextval, '공지사항5', '<h2>2024년 가을 글램핑</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 가을 글램핑을 안내드립니다. 이번 글램핑에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>단풍 구경</li><li>럭셔리 캠핑</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/fall-glamping">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate) VALUES (seq_board.nextval, '공지사항6', '<h2>2024년 겨울 캠핑</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 겨울 캠핑을 안내드립니다. 이번 캠핑에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>겨울 캠프파이어</li><li>눈놀이</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/winter-camping">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate) VALUES (seq_board.nextval, '공지사항7', '<h2>2024년 봄 차박 캠핑</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 봄 차박 캠핑을 안내드립니다. 이번 캠핑에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>봄꽃 구경</li><li>캠핑 장비 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/spring-car-camping">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate) VALUES (seq_board.nextval, '공지사항8', '<h2>2024년 차박 이벤트</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 차박 이벤트를 안내드립니다. 이번 이벤트에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>차박 요리 대회</li><li>자연 탐험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/car-event">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate) VALUES (seq_board.nextval, '공지사항9', '<h2>2024년 글램핑 파티</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 글램핑 파티를 안내드립니다. 이번 파티에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>럭셔리 파티</li><li>바비큐 파티</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/glamping-party">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate) VALUES (seq_board.nextval, '공지사항10', '<h2>2024년 여름 캠핑</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 여름 캠핑을 안내드립니다. 이번 캠핑에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>여름 수영장</li><li>야외 바베큐</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/summer-camping">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항11', '<h2>2024년 차박 여행</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 차박 여행을 안내드립니다. 이번 여행에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>차박 장소 탐방</li><li>캠핑 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/car-travel">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항12', '<h2>2024년 봄 글램핑</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 봄 글램핑을 안내드립니다. 이번 글램핑에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>봄꽃 구경</li><li>럭셔리 캠핑</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/spring-glamping">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항13', '<h2>2024년 여름 차박</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 여름 차박을 안내드립니다. 이번 차박에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>차박 요리 대회</li><li>여름 캠핑</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/summer-car-camping">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항14', '<h2>2024년 가을 캠핑</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 가을 캠핑을 안내드립니다. 이번 캠핑에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>단풍 구경</li><li>캠핑 요리</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/fall-camping">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항15', '<h2>2024년 겨울 차박</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 겨울 차박을 안내드립니다. 이번 차박에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>눈놀이</li><li>겨울 캠핑</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/winter-car-camping">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항16', '<h2>2024년 글램핑 체험</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 글램핑 체험을 안내드립니다. 이번 체험에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>럭셔리 체험</li><li>캠핑 요리</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/glamping-experience">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항17', '<h2>2024년 가을 차박 캠핑</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 가을 차박 캠핑을 안내드립니다. 이번 캠핑에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>단풍 구경</li><li>캠핑 장비 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/fall-car-camping">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항18', '<h2>2024년 봄 글램핑 행사</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 봄 글램핑 행사를 안내드립니다. 이번 행사에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>봄꽃 구경</li><li>럭셔리 캠핑</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/spring-glamping-event">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항19', '<h2>2024년 여름 글램핑 체험</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 여름 글램핑 체험을 안내드립니다. 이번 체험에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>럭셔리 캠핑</li><li>캠핑 요리</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/summer-glamping-experience">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항20', '<h2>2024년 겨울 글램핑</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 겨울 글램핑을 안내드립니다. 이번 글램핑에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>눈놀이</li><li>럭셔리 캠핑</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/winter-glamping">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항21', '<h2>2024년 차박 축제</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 차박 축제를 안내드립니다. 이번 축제에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>차박 요리 대회</li><li>캠핑 장비 전시</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/car-camping-festival">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항22', '<h2>2024년 봄 차박 이벤트</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 봄 차박 이벤트를 안내드립니다. 이번 이벤트에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>봄꽃 구경</li><li>캠핑 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/spring-car-event">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항23', '<h2>2024년 여름 차박 체험</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 여름 차박 체험을 안내드립니다. 이번 체험에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>여름 차박</li><li>캠핑 요리</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/summer-car-experience">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항24', '<h2>2024년 가을 글램핑 체험</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 가을 글램핑 체험을 안내드립니다. 이번 체험에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>단풍 구경</li><li>럭셔리 캠핑</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/fall-glamping-experience">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항25', '<h2>2024년 겨울 차박 체험</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 겨울 차박 체험을 안내드립니다. 이번 체험에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>눈놀이</li><li>겨울 차박</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/winter-car-experience">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항26', '<h2>2024년 봄 글램핑 여행</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 봄 글램핑 여행을 안내드립니다. 이번 여행에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>봄꽃 구경</li><li>럭셔리 여행</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/spring-glamping-trip">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항27', '<h2>2024년 여름 글램핑 여행</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 여름 글램핑 여행을 안내드립니다. 이번 여행에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>여름 럭셔리 여행</li><li>캠핑 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/summer-glamping-trip">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항28', '<h2>2024년 가을 글램핑 여행</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 가을 글램핑 여행을 안내드립니다. 이번 여행에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>단풍 구경</li><li>럭셔리 여행</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/fall-glamping-trip">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항29', '<h2>2024년 겨울 글램핑 여행</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 겨울 글램핑 여행을 안내드립니다. 이번 여행에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>눈놀이</li><li>럭셔리 여행</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/winter-glamping-trip">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항30', '<h2>2024년 봄 차박 여행</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 봄 차박 여행을 안내드립니다. 이번 여행에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>봄꽃 구경</li><li>차박 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/spring-car-trip">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항31', '<h2>2024년 여름 차박 여행</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 여름 차박 여행을 안내드립니다. 이번 여행에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>여름 차박</li><li>차박 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/summer-car-trip">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항32', '<h2>2024년 가을 차박 여행</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 가을 차박 여행을 안내드립니다. 이번 여행에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>단풍 구경</li><li>차박 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/fall-car-trip">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항33', '<h2>2024년 겨울 차박 여행</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 겨울 차박 여행을 안내드립니다. 이번 여행에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>눈놀이</li><li>차박 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/winter-car-trip">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항34', '<h2>2024년 봄 글램핑 체험</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 봄 글램핑 체험을 안내드립니다. 이번 체험에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>봄꽃 구경</li><li>럭셔리 캠핑</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/spring-glamping-experience">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항35', '<h2>2024년 여름 글램핑 체험</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 여름 글램핑 체험을 안내드립니다. 이번 체험에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>럭셔리 캠핑</li><li>캠핑 요리</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/summer-glamping-experience">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항36', '<h2>2024년 가을 글램핑 체험</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 가을 글램핑 체험을 안내드립니다. 이번 체험에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>단풍 구경</li><li>럭셔리 캠핑</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/fall-glamping-experience">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항37', '<h2>2024년 겨울 글램핑 체험</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 겨울 글램핑 체험을 안내드립니다. 이번 체험에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>눈놀이</li><li>럭셔리 캠핑</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/winter-glamping-experience">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항38', '<h2>2024년 봄 차박 체험</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 봄 차박 체험을 안내드립니다. 이번 체험에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>봄꽃 구경</li><li>차박 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/spring-car-experience">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항39', '<h2>2024년 여름 차박 체험</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 여름 차박 체험을 안내드립니다. 이번 체험에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>여름 차박</li><li>차박 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/summer-car-experience">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항40', '<h2>2024년 가을 차박 체험</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 가을 차박 체험을 안내드립니다. 이번 체험에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>단풍 구경</li><li>차박 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/fall-car-experience">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항41', '<h2>2024년 겨울 차박 체험</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 겨울 차박 체험을 안내드립니다. 이번 체험에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>눈놀이</li><li>겨울 차박</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/winter-car-experience">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항42', '<h2>2024년 봄 글램핑 축제</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 봄 글램핑 축제를 안내드립니다. 이번 축제에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>봄꽃 구경</li><li>럭셔리 캠핑</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/spring-glamping-festival">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항43', '<h2>2024년 여름 글램핑 축제</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 여름 글램핑 축제를 안내드립니다. 이번 축제에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>여름 럭셔리 캠핑</li><li>캠핑 요리</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/summer-glamping-festival">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항44', '<h2>2024년 가을 글램핑 축제</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 가을 글램핑 축제를 안내드립니다. 이번 축제에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>단풍 구경</li><li>럭셔리 캠핑</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/fall-glamping-festival">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항45', '<h2>2024년 겨울 글램핑 축제</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 겨울 글램핑 축제를 안내드립니다. 이번 축제에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>눈놀이</li><li>럭셔리 캠핑</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/winter-glamping-festival">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항46', '<h2>2024년 봄 차박 축제</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 봄 차박 축제를 안내드립니다. 이번 축제에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>봄꽃 구경</li><li>차박 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/spring-car-festival">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항47', '<h2>2024년 여름 차박 축제</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 여름 차박 축제를 안내드립니다. 이번 축제에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>여름 차박</li><li>차박 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/summer-car-festival">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항48', '<h2>2024년 가을 차박 축제</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 가을 차박 축제를 안내드립니다. 이번 축제에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>단풍 구경</li><li>차박 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/fall-car-festival">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항49', '<h2>2024년 겨울 차박 축제</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 겨울 차박 축제를 안내드립니다. 이번 축제에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>눈놀이</li><li>겨울 차박 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/winter-car-festival">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);
INSERT INTO tbl_board (bno, title, content, writer, btype,  regdate, updatedate)
VALUES (seq_board.nextval, '공지사항50', '<h2>2024년 봄 차박 축제</h2><p>안녕하세요, 사용자 여러분!</p><p>2024년 봄 차박 축제를 안내드립니다. 이번 축제에는 다음과 같은 프로그램이 준비되어 있습니다:</p><ul><li>봄꽃 구경</li><li>차박 요리 체험</li><li>경품 추첨</li></ul><p>참여 신청은 <a href="http://example.com/spring-car-festival">여기</a>에서 해주시기 바랍니다.</p><p>감사합니다.</p><p>작성자: 운영팀</p>', 0, 1, sysdate, sysdate);

commit;