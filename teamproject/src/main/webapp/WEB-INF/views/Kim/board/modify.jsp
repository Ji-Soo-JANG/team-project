<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/Kim/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
<link rel="stylesheet" href="/www/resources/css/indexksy.css">
<body class="bg-white text-black min-h-screen p-4">
    <main class="grid grid-cols-3 gap-4 mt-4">
        <section class="col-span-2 space-y-4">
            <form action="/www/board/modify" method="post" enctype="multipart/form-data">
                <input type="hidden" name="b_i_no" value="${boardVo.b_i_no}">
                <div class="bg-gray-100 p-4">
                    <select name="b_i_category" id="b_i_category" class="bg-gray-300 p-2 rounded">
                        <option value="카테고리-1" ${boardVo.b_i_category == '카테고리-1' ? 'selected' : ''}>카테고리-1</option>
                        <option value="카테고리-2" ${boardVo.b_i_category == '카테고리-2' ? 'selected' : ''}>카테고리-2</option>
                        <option value="카테고리-3" ${boardVo.b_i_category == '카테고리-3' ? 'selected' : ''}>카테고리-3</option>
                        <option value="카테고리-4" ${boardVo.b_i_category == '카테고리-4' ? 'selected' : ''}>카테고리-4</option>
                        <option value="카테고리-5" ${boardVo.b_i_category == '카테고리-5' ? 'selected' : ''}>카테고리-5</option>
                        <option value="카테고리-6" ${boardVo.b_i_category == '카테고리-6' ? 'selected' : ''}>카테고리-6</option>
                    </select>
                </div>
                <div class="bg-gray-100 p-4">
                    <input type="text" id="b_i_title" name="b_i_title" placeholder="제목을 입력하세요"
                        class="w-full p-2 rounded" value="${boardVo.b_i_title}" required>
                </div>
                <div class="bg-gray-100 p-4">
                    <textarea name="b_i_content" rows="10"
                        class="w-full p-2 rounded" id="b_i_content" required>${boardVo.b_i_content}</textarea>
                </div>
                <div class="bg-gray-100 p-4">
                    <input type="file" name="file" class="bg-gray-200 w-full p-2 rounded">
                </div>
                <div class="bg-gray-100 p-4 flex justify-end space-x-4">
                    <button type="submit" class="bg-yellow-500 text-black px-4 py-2 rounded">작성완료</button>
                    <a href="/www/board/information" class="bg-gray-500 text-black px-4 py-2 rounded">취소</a>
                </div>
            </form>
        </section>
        <aside class="space-y-4">
            <div class="bg-gray-100 p-4">
                <div class="flex items-center justify-between p-2 bg-gray-300 rounded">
                    <div class="ml-6 flex items-center">
                        <img src="/www/resources/image/1111.png" alt="Profile Image" class="w-16 h-16 rounded-full">
                        <div class="ml-8">
                            <h3 class="text-xl font-bold">고양이의생일</h3>
                            <p class="text-sm text-gray-500">정회원</p>
                            <p class="text-sm text-gray-500">등급 : 우주시민 (4,291xp)</p>
                        </div>
                    </div>
                </div>
                <div class="mt-4 grid grid-cols-3 gap-2 text-center">
                    <!-- <a href="#" class="bg-gray-300 p-2 rounded">기능1</a>  -->
                    <!-- <a href="#" class="bg-gray-300 p-2 rounded">기능2</a>  -->
                    <!-- <a href="#" class="bg-gray-300 p-2 rounded">기능3 </a> -->
                    <!-- <a href="#" class="bg-gray-300 p-2 rounded">스크랩</a>  -->
                    <!-- <a href="#" class="bg-gray-300 p-2 rounded">공지</a> -->
                </div>
            </div>

            <div class="bg-gray-100 p-4">
                <h2 class="text-lg font-bold"> 주간 정보게시판 BEST</h2>
                <ul class="mt-2 space-y-2">
                    <c:forEach items="${weeklyBestList}" var="boardVo" varStatus="num">
                        <div class="flex items-center justify-between p-2 bg-gray-300 rounded">
                            <span>${num.index + 1}</span> 
                            <a class="a_bno" href="/www/board/read?b_i_no=${boardVo.b_i_no}">
                                <span class="flex-1 ml-2">${boardVo.b_i_title}</span>
                            </a>
                            <span class="text-gray-500">${boardVo.b_i_views}</span>
                        </div>
                    </c:forEach>
                </ul>
            </div>
        </aside>
    </main>
</body>
</html>
<%@ include file="/WEB-INF/views/Kim/include/footer.jsp"%>
