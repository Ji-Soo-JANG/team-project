<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매콤한녀석들</title>
    <link rel="stylesheet" href="/www/resources/css/index.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>												
    <script src="/www/resources/js/index.js" defer></script>
</head>
<body>
    <!-- 광고 -->
    <div class="ad-Container ad-left">
        <img class="ad-img-left" src="/www/resources/image/ad1.png" alt="">
    </div>
    <div class="ad-Container ad-rigth">
        <img class="ad-img-right" src="/www/resources/image/ad2.png" alt="">
    </div>

    <!-- Modal-start -->
    <div id="loginModal" class="modal">
        <div class="modal-content">
            <!-- <span class="close-modal" id="close-modal">&times;</span> -->
            <h2>로그인</h2>
            <form class="form-modal">
                <label for="username">아이디:</label>
                <input type="text" id="username" name="username" placeholder=" 아이디">
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" placeholder=" 비밀번호">
                <div class="idCheckContainer">
                    <input type="checkbox"> <span>자동 로그인</span>
                </div>
                <button type="submit" class="btn">Login</button>
            </form>
            <div class="modal-links-container">
                <a href="/www/join">회원가입</a>
                <a href="#">아이디 찾기</a>
                <a href="#">비밀번호 찾기</a>
            </div>
        </div>
    </div>
    <!-- Modal-end -->

    <!-- header -->
    <header class="header-Container">
        <div class="navbar-Logo">
            <a href="/"><span>CHABAK 차박</span></a>
        </div>
        <div class="login-Container">
            <input type="text" class="search">
            <button class="btn" id="btnLogin">Login</button>
        </div>
    </header>

    <!-- nav -->
    <nav class="navbar">
        <ul class="nav-list">
            <li class="nav-item">
                <a href="#" class="nav-link">공지사항</a>
                <ul class="sub-nav-list">
                    <li class="sub-nav-item"><a href="/board/announcement" class="sub-nav-link">공지사항</a></li>
                    <li class="sub-nav-item"><a href="/board/joingreeting" class="sub-nav-link">가입인사</a></li>
                    <li class="sub-nav-item"><a href="/board/attendancecheck" class="sub-nav-link">출석체크</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">커뮤니티</a>
                <ul class="sub-nav-list">
                    <li class="sub-nav-item"><a href="/board/free" class="sub-nav-link">자유게시판</a></li>
                    <li class="sub-nav-item"><a href="/www/board/information" class="sub-nav-link">정보공유</a></li>
                    <li class="sub-nav-item"><a href="/board/recommendedarea" class="sub-nav-link">우리지역 명소 추천</a></li>
                    <li class="sub-nav-item"><a href="/www/board/reviews" class="sub-nav-link">리뷰</a></li>
                    <li class="sub-nav-item"><a href="/www/board/question" class="sub-nav-link">질문게시판</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">모임</a>
                <ul class="sub-nav-list">
                    <li class="sub-nav-item"><a href="/board/regularmeeting" class="sub-nav-link">정모 공지</a></li>
                    <li class="sub-nav-item"><a href="/board/thundermeeting" class="sub-nav-link">벙캠/동행</a></li>
                    <li class="sub-nav-item"><a href="/board/smallmeeting" class="sub-nav-link">소모임(벙개)</a></li>
                    <li class="sub-nav-item"><a href="/board/meetingreviews" class="sub-nav-link">모임후기</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">지식</a>
                <ul class="sub-nav-list">
                    <li class="sub-nav-item"><a href="/board/equip" class="sub-nav-link">장비&용어</a></li>
                    <li class="sub-nav-item"><a href="/board/qna" class="sub-nav-link">QnA</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">중고장터</a>
                <ul class="sub-nav-list">
                    <li class="sub-nav-item"><a href="/board/buy" class="sub-nav-link">삽니다</a></li>
                    <li class="sub-nav-item"><a href="/board/sell" class="sub-nav-link">팝니다</a></li>
                </ul>
            </li>
            <li class="nav-item"><a href="/board/metaverse" class="nav-link">메타버스</a></li>
            <li class="nav-item"><a href="/board/report" class="nav-link">신고하기</a></li>
        </ul>
    </nav>
    <section class="section-Container">