<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/Lee/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmf" %>
			
<script>
$(function(){
	
	//페이지 링크 클릭
	$(".page-link").click(function(e){
		console.log("링크 클릭");
		e.preventDefault();
		let pageNum = $(this).attr("href");
		console.log("pageNum : " + pageNum);
		$("#inputPageNum").val(pageNum);
		$("#actionForm").submit();
	});
	
	//제목클릭
	$(".a_b_f_no").click(function(e){
		e.preventDefault();
		console.log("제목클릭");
		let b_f_no = $(this).attr("href");
		console.log("게시번호 : " + b_f_no);
		let arr = `<input type='hidden' name='boardno' value='\${boardno}'>`;
		$("#actionForm > input[name='b_f_no']").remove();
		$("#actionForm").append(arr)
						.attr("action", "/Lee/board/community/detail")
						.submit();
	});
	
	let pageType = "${criteria.type}";
	console.log("pageType : " + pageType);
	switch(pageType){
		case "T":
			$("#typeT").prop("selected", true);
			break;
		case "C":
			$("#typeC").prop("selected", true);
			break;
		case "W":
			$("#typeW").prop("selected", true);
			break;
		case "TC":
			$("#typeTC").prop("selected", true);
			break;
		case "CW":
			$("#typeCW").prop("selected", true);
			break;
		case "TW":
			$("#typeTW").prop("selected", true);
			break;
	}
});
	
</script>
 	<!-- 게시판 테이블 start -->
	<div class="table-Container">
     	<h3 class="board-title">자유게시판</h3> 
     	<h4>pust 테스트</h4>
<%--      	${list} --%>
           <table class="table mt-10" border="1">
               <tr>
                   <th class="table-head">번호</th>
                   <th class="table-head">제목</th>
                   <th class="table-head">글쓴이</th>
                   <th class="table-head">등록일</th>
                   <th class="table-head">추천</th>
                   <th class="table-head">조회</th>
               </tr>
               <c:forEach var="dto" items="${list}">
                   <tr class="table-tr">
	                   <td>${dto.boardno}</td>
	                   <td class="table-text-left">
	                   	<a class="a_b_f_no" href="${dto.boardno}">${dto.title}</a>
	                   	<span class="reply-count ml-10" id="replyCount">${dto.replycount}</span> </td>
	                   <td class="table-text-right">${dto.nickname}</td>
	                   <td><fmf:formatDate value="${dto.regdate}" pattern="yyyy/MM/dd"/></td>
	                   <td>${dto.likes}</td>
	                   <td>${dto.views}</td>
	               </tr>
               </c:forEach>
           </table>
           <!-- 게시판 테이블 end -->
           
           <!-- 페이징 start -->
           <div class="page-Container">
                <nav>
                    <ul class="page-ul">
                    	<c:if test="${pageMaker.prev == true}">
                    		<li class="page-item"><a href="${pageMaker.startPage - 10}" class="page-link">이전</a></li>
                    	</c:if>
                        
                        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="v">
                        	<li class="page-item">
                        		<a href="${v}" class="page-link ${v == pageMaker.cri.pageNum ? 'active-link' : ''}">${v}</a>
                        	</li>
                        </c:forEach>
                        
                        <c:if test="${pageMaker.next == true}">
	                        <li class="page-item"><a href="${pageMaker.endPage + 1}" class="page-link">다음</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <!-- 페이징 end -->
            <div class="flex justify-end div-write">
		        <a class="btn btn-yellow" href="/Lee/board/write">글쓰기</a>        
            </div>

<!--             <div class="search-Container"> -->
            	<form action="/Lee/board/list" class="search-Container">
	                <select name="type" id="selectSearch">
	                    <option value="T" id="typeT">제목</option>
	                    <option value="C" id="typeC">내용</option>
	                    <option value="W" id="typeW">작성자</option>
	                    <option value="TC" id="typeTC">제목+내용</option>
	                    <option value="CW" id="typeCW">내용+작성자</option>
	                    <option value="TW" id="typeTW">제목+삭성자</option>
	                </select>
	                <input type="text" name="keyword" value="${criteria.keyword}">
	                <input type= "text" name="boardtype" value="${criteria.boardtype}">
	                <button class="btn btn-yellow" type="submit">검색</button>
            	</form>
<!--             </div> -->
        </div>


<%@ include file="/WEB-INF/views/Lee/include/actionForm.jsp" %>
<%@ include file="/WEB-INF/views/Lee/include/footer.jsp"%>