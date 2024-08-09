<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/Lee/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/resources/Lee/js/detail.js" defer></script>
<!-- CKEditor CDN 추가 -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/35.3.0/classic/ckeditor.js"></script> -->
<link rel="stylesheet" href="/resources/Lee/css/edite.css">
<link rel="stylesheet" href="/resources/Lee/css/edite-detail.css">
<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/42.0.2/ckeditor5.css">

<script>
$(function(){
	// 댓글 TextArea 스크롤 크기 자동 조절
	function autoResizeTextarea(textarea) {
        textarea.css('height', 'auto');
        textarea.css('height', (textarea.prop('scrollHeight')) + 'px');
    }
    $('.ta-auto-resize').on('input', function() {
    	console.log("댓글 입력중..");
        autoResizeTextarea($(this));
    });
    // 초기 높이 설정
    $(".ta-auto-resize").each(function(){
        autoResizeTextarea($(this));
    })
	
    //editor css
	$(".ck.ck-editor__editable_inline").css("border", "none");

	// ***************************** 추천하기 ******************************
	$("#btnRecommend").click(function(){
		let boardno = ${dto.boardno};
		let wirter = `${dto.userid}`;
		let userid = `${loginSessionDto.userid}`;
		//let url = "/board/community/commend";
		let data = {"boardno" : ${dto.boardno}};
		let sData = {
				"boardno" : boardno,
				"userid" : userid
		};
		
		if(${loginSessionDto == null}){
			alert("로그인 해야 추천할수 있다능!");
			return;
		}
		
		// 로그인 한사람만
		console.log("글쓴이 id : " +  wirter);
		console.log("boardno : " + boardno);
		console.log("userid : " + userid);
		if(wirter == userid){
			alert("내글은 추천 안된다능!?");
			return;
		}else{
			console.log("추천된다능");
			
			$.ajax({
				type : "post",
				url : "/Lee/board/checkLike",
				data : JSON.stringify(sData),
				contentType: "application/json; charset=utf-8",
				success : function(rData){
					console.log("추천체크 성공");
					console.log(rData);
					if(rData==false){
						//추천 가능
						console.log("추천 된다능")
						$.ajax({
							type : "post",
							url : "/Lee/board/boardLike",
							data : JSON.stringify(sData),
							contentType: "application/json; charset=utf-8",
							success : function(rData){
								alert("추천완료!");
								$("#spanRecommend").text(rData);
							}
						});
					}else{
						//이미 추천함
						alert("이미 추천 하셨네요?");
						
						//추천
					
					}
				}
			});
		}
		// 추천 중복 안됨
		return false;
	});
    
    //***************        댓글       ******************
    //댓글 보이기
	showReplys();
	// 덧글달기버튼 클릭
	$("#reply-ul").on("click", ".rereply", function(e){
		console.log(".rereply 클릭");
		let that = $(this);
		let isReply = that.attr("data-isreply");
		let replyno = that.attr("data-replyno");
		let li = that.parent().parent().parent().parent();
		let ul = li.parent();
		
		console.log("isReply : " + isReply);
		console.log("replyno : " + replyno);
		//textarea스크롤처리
		let rereplyClone = $(".rereply-ul > li").clone().css("list-style", "none");
		let textArea = rereplyClone.children(".form-reply").children(".ta-auto-resize");
		autoResizeTextarea(textArea);
		textArea.on('input', function() {
		   autoResizeTextarea(textArea);
		});
		
		// 댓글인지 대댓글인지 체크 후 처리
		if(isReply){
			console.log("본문댓글");
			rereplyClone.children(".form-reply").children(".box-item")
												.children(".btn-reply")
												.attr("data-isreply", true);
		}else{
			console.log("대댓글");
			rereplyClone.children(".form-reply").children(".box-item")
												.children(".btn-reply")
												.attr("data-replyno", replyno)
												.attr("data-isreply", false);
		};
		ul.children(".reply-li").remove();
		li.after(rereplyClone);
	});
    
	
	// *댓글달기
	$("#reply-ul").on('click', ".btn-reply", function(){
		console.log(".btn-reply 클릭");
		let that = $(this);
// 		let checkReply = that.attr("data-checkreply");
// 		console.log("checkReply", checkReply);
		let formReply = that.parent().parent(); 
				
		let isReply = that.attr("data-isreply");
		
		// sdata에 들어갈 변수들
		let boardno = `${dto.boardno}`;
		let comments = formReply.children(".comments").val();
		let userid = `${loginSessionDto.userid}`;
// 		let userid = formReply.children(".userid").val();
		let nickname = `${loginSessionDto.nickname}`;
		let replyno = that.attr("data-replyno");
		
		console.log("isReply : " + isReply);
		
		let sData;
		let url = "/Lee/board/reply/register";
		
		if(isReply==true){
			console.log("댓글일때");
			sData = {
					"boardno" : boardno,
					"comments" : comments,
					"userid" : userid,
					"nickname" : nickname
			};
		}else{
			console.log("덧글일때");
			sData = {
					"boardno" : boardno,
					"comments" : comments,
					"userid" : userid,
					"nickname" : nickname,
					"replyno" : replyno
			};
		}
		console.log("sData");
		console.log(sData);
// 		return false;
		$.ajax({
			type: "post",
			url: url, 
			data : JSON.stringify(sData),
			contentType: "application/json; charset=utf-8",
			success : function(rData){
				console.log(rData);
				$("#comments").val("");
				showReplys();
			}
		});
	});
	
	// 댓글 삭제
	// 삭제버튼 누르면 confirm창으로 확인후 삭제처리
    $("#reply-ul").on('click', ".btnReplyDelete" ,function(e){
    	console.log(e);
    	let that = $(this);
    	let replyno = that.attr("data-replyno");
    	console.log("replyno : " + replyno);
    	
    	$("#btnReplyDeleteOk").attr("data-replyno", replyno);
    	let result = confirm("정말 삭제하시겠습니까?");
    	console.log("result :" + result);
		if(true){
			deleteReply(replyno);
		}
    });
	
	// 삭제처리
	function deleteReply(replyno){
		console.log("deleteReply()");
		console.log("replyno : " + replyno);
    	$.ajax({
			type: "delete",
			url: "/Lee/board/reply/delete/" + replyno,
			success : function(rData){
				console.log(rData);
// 				$("#reply-delete-modal").hide();
				showReplys();
			}
		});
	};

	// 삭제취소
	$("#btnReplyDeleteCancle").click(function(){
		$("#btnReplyDeleteOk").removeAttr("data_replyno");
		$("#reply-delete-modal").hide();
	});
	
	//덧글 좋아요 클릭
	$("#reply-ul").on("click", ".btn-like", function(e){
		console.log("좋아요 클릭")
		console.log(e);
		let that = $(this);
		let replyno  = that.attr("data-replyno");
		console.log("replyno : " + replyno);
		$.ajax({
			type : "get",
			url : "/Lee/board/reply/like/" + replyno,
			success : function(rData){
				console.log(rData);
				showReplys();
			}
		});
	});

  
	//댓글 보이기 메서드
	function showReplys(){
		console.log("showReply()");
		$("#reply-ul").empty();
		let boardno = `${dto.boardno}`;
		let sUrl = "/Lee/board/reply/list/"+boardno;
		$.ajax({
			type : "get",
			url : sUrl ,
			success : function(rData){
				console.log("댓글 보이기 요청 성공");
				let btnReply = `<li class="list-style-none mb-10">
									<div>
										<div>
											<div>
												 <span class="btn rereply width-100" data-isreply=true>덧글달기</span>
											</div>
										</div>
									</div>
								</li>`;
				$("#reply-ul").append(btnReply);
				$.each(rData, function(index, value){
					let obj = value;
					let li =
						`<li class="reply-item mt-10" style="margin-left: \${(obj.reply_level-1)*40}px; width: calc(100% - \${(obj.reply_level-1)*40}px)">
							<div class="user-profile flex">
								<img class="user-profile-img" alt="프로필" src="/resources/Lee/image/Boy6.gif">
							</div>
							<div class="width100per ml-20">
								<div class="flex justify-between pl-10">
									<span class="yellow-border-box">\${obj.nickname}</span>
									<button class="btn-like" data-replyno="\${obj.replyno}">
										<img class="like-img" alt="" src="/resources/Lee/image/favorite.png"> 
										<span style="margin:0 0 4px 4px">\${obj.likes}</span>
									</button>
								</div>
								<textarea class="ta-reply-item ta-auto-resize pl-10 mt-10" rows="" cols="">\${obj.comments}								
								</textarea>
								<div class="flex justify-between pl-10">
									<div>
										<span>\${toDateString(obj.replydate)}</span> 
										<img class="reply-img" alt="reply" src="/resources/Lee/image/reply.png">
										<span class="cursor-pointer hover-black rereply" data-replyno="\${obj.replyno}">덧글달기</span>
									</div>
									<div class="flex">
										<button class="btn mr-10 btnReplyUpdate">수정</button>
										<button class="btn mr-10 btnReplyUpdateOk" data-replyno="\${obj.replyno}" style="display:none">수정완료</button>
										<button class="btn btnReplyDelete" data-replyno="\${obj.replyno}">삭제</button>
									</div>
								</div>
							</div>
						</li>`
					$("#reply-ul").append(li);
					$(".btn-like").hover(function(){
						$(this).css("border", "1px solid hotpink");
					}, function(){
						$(this).css("border", "1px solid pink");
					});
					$(".ta-auto-resize").each(function(){
				        autoResizeTextarea($(this));
				    });
				});//each
				
			}//success
		});
		
	};//show reply
	/////////////////////////////////////////// 댓글 end ///////////////////////////////////////////
	//목록
	$("#btnList").click(function(){
		let url = "/Lee/board/list/" + `${boardtype.boardtype}`;
		$("#actionForm").attr("action", url).submit();
	});
});

</script>

<!-- Write Start -->
<!-- <div class="write-container"> -->
	<h3 class="board-title">상세페이지 입니다</h3>
	<!-- DetailForm Start -->
	<form action="/Lee/board/updateRun" id="update-from" class="write-from" method="post">
		<div class="user-container">
			<div class="user-profile">
				<img class="user-profile-img" alt="프로필" src="/resources/Lee/image/Boy6.gif" width=110 height=110>
			</div>
			<div class="profile-container">
				<div class="mb-10 mt-10">
					<input class="input-user" value="${dto.nickname}" readonly>
				</div>
				<div class="mb-10">
					<span>등록일</span> <input type="text" class="input-user" name="regdate" value="<fmf:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd hh:mm"/>" readonly> 
				</div>
				<div>
					<span>조회수 </span><input type="text" class="input-user" name="views" value="${dto.views}" readonly>
				</div>
			</div>
			
		</div>
      	<input type="text" id="input-write" class="input-write" name="title" placeholder=" 제목을 입력 해 주세요." 
      			value="${dto.title}" readonly>
      	
		<!-- 모듈에서 가져올 html -->
		<textarea rows="" cols="" id="content" name="content" style="display:none;">${dto.content}</textarea>
		<input type="hidden" value="${dto.boardno}" name="boardno">
		
		<!-- CK에디터 start -->
			<div id="readEditor">
				
			</div>		
			<script type="importmap">
				{
					"imports": {
						"ckeditor5": "https://cdn.ckeditor.com/ckeditor5/42.0.2/ckeditor5.js",
						"ckeditor5/": "https://cdn.ckeditor.com/ckeditor5/42.0.2/"
					}
				}
			</script>
			<script type="module" src="/resources/Lee/js/edite-detail.js"></script>
		<!-- CK에디터 end -->
		
        <div class="btn-container justify-between">
        	<!-- 로그인시 보이기 처리 -->
 			<div class="flex">
		        <button type="button" class="btn mr-10" id="btnList">목록</button>
 			</div>

        	<!-- 추천하기 -->
        	<div class="recommend-container">
        		<button type="button" class="btnRecommend" id="btnRecommend">
        			<img alt="" src="/resources/Lee/image/thumb_up.png">
        		</button>
        		<span id="spanRecommend">${dto.likes}</span>
        	</div>
        	
        	<!-- 로그인시 보이기 처리 -->
		    <div class="flex" >
	        	<c:if test="${loginSessionDto != null}">
		        		<button type="button" id="btnUpdate" class="btn mr-10">수정</button>
		        		<button type="button" id="btnDelete" class="btn mr-10">삭제</button>
		        		<button type="button" id="btnUpdateOk" class="btn mr-10" style="display:none">수정완료</button>
		        		<button type="button" id="btnUpdateCancle" class="btn mr-10"  style="display:none">취소</button>
	        	</c:if>
		        <a class="btn" href="/Lee/board/write">글쓰기</a>
		    </div>
         </div>
    </form>
    
    <!-- Reply Start -->
	<div class="reply-container border-t-1 border-b-1 mt-20 pt-20 pb-20">
		<ul id="reply-ul">
<!-- 			<li class="list-style-none mb-10"> -->
<!-- 				<div> -->
<!-- 					<div> -->
<!-- 						<div> -->
<!-- 							<span class="btn rereply width-100" data-isreply=true>덧글달기</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</li> -->
		</ul>
	</div>
    <!-- Reply End -->
    
    <!-- ReplyForm Start -->
    <ul class="rereply-ul">
	    <li class="reply-form-container ml-20 mt-10 mb-10 reply-li">
	    	<div class="mt-10 mb-10">
	    		<span>욕설, 상처 줄 수 있는 악플은 삼가주세요.</span>
	    		<span>loginSessionDto : ${loginSessionDto}</span>
	    	</div>
			<div class="form-reply">
			    <textarea rows="" cols="" class="ta-reply ta-auto-resize comments" placeholder="댓글을 입력해주세요.."></textarea>
				<input type="hidden" class="replyer" value="${loginSessionDto.nickname}">
				<div class="box-item justify-end"> 
					<button class="btn mt-10 btn-reply" >댓글저장</button>
				</div>
			</div>
	    </li>
    </ul>
    <!-- ReplyForm End -->
    
    <!-- Delete Form Start -->
    <form action="/Lee/board/deleteRun" method="post" id="formDelete">
    	<input type="hidden" name="boardno" value="${dto.boardno}">
    </form>
    <!-- Delete Form End -->
</div>
<!-- Write End -->

<%@ include file="/WEB-INF/views/Lee/include/actionForm.jsp"%>
<%@ include file="/WEB-INF/views/Lee/include/footer.jsp"%>