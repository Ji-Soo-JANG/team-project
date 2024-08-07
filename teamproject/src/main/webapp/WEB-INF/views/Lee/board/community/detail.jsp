<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/Lee/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/resources/js/detail.js" defer></script>
<!-- CKEditor CDN 추가 -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/35.3.0/classic/ckeditor.js"></script> -->
<link rel="stylesheet" href="/resources/css/edite.css">
<link rel="stylesheet" href="/resources/css/edite-detail.css">
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
		let b_f_no = ${dto.b_f_no};
		let b_f_writer = '${dto.b_f_writer}';
		let u_id = '${login.u_id}';
		//let url = "/board/community/commend";
		let data = {"b_f_no" : ${dto.b_f_no}};
		let sData = {
				"b_f_no" : b_f_no,
				"u_id" : u_id
		};
		
		if(${login == null}){
			alert("로그인 해야 추천할수 있다능!");
			return;
		}
		
		// 로그인 한사람만
		console.log("글쓴이 아이디 : " +  b_f_writer);
		console.log("b_f_no : " + b_f_no);
		console.log("u_id : " + u_id);
		if(b_f_writer == u_id){
			alert("내글은 추천 안된다능!?");
			return;
		}else{
			console.log("추천된다능");
			
			$.ajax({
				type : "post",
				url : "/board/community/checkLike",
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
							url : "/board/community/boardLike",
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
	// *댓글달기
	$("#reply-ul").on('click', ".btn-reply", function(){
		let that = $(this);
		let checkReply = that.attr("data-checkreply");
		console.log("checkReply", checkReply);
		let formReply = that.parent().parent(); 
		let b_f_no = ${dto.b_f_no};
		let reply = formReply.children(".reply").val();
		let replyer = formReply.children(".replyer").val();
		let b_f_r_no = that.attr("data-b_f_r_no");
		let isReply = that.attr("data-isreply");
		
		let sData;
		let url = "/board/free/reply/register";
		
		if(isReply==true){
			console.log("댓글일때");
			sData = {
					"b_f_no" : b_f_no,
					"reply" : reply,
					"replyer" : replyer
			};
		}else{
			console.log("덧글일때");
			sData = {
					"b_f_no" : b_f_no,
					"reply" : reply,
					"replyer" : replyer,
					"b_f_r_no" : b_f_r_no
			};
		}

		$.ajax({
			type: "post",
			url: url, 
			data : JSON.stringify(sData),
			contentType: "application/json; charset=utf-8",
			success : function(rData){
				console.log(rData);
				$("#reply").val("");
				showReplys();
			}
		});
	});
	
	// 댓글 삭제
	// 삭제버튼 누르면 모달 삭제버튼에 댓글번호 data로 입력
    $("#reply-ul").on('click', ".btnReplyDelete" ,function(e){
    	console.log(e);
    	let that = $(this);
    	let b_f_r_no = that.attr("data-b_f_r_no");
    	console.log("b_f_r_no : " + b_f_r_no);
    	
    	$("#btnReplyDeleteOk").attr("data-b_f_r_no", b_f_r_no);
    	$("#reply-delete-modal").show();
    });
	// 삭제처리
	$("#btnReplyDeleteOk").click(function(){
		let b_f_r_no = $(this).attr("data-b_f_r_no");
    	$.ajax({
			type: "delete",
			url: "/board/free/reply/delete/" + b_f_r_no,
			success : function(rData){
				console.log(rData);
				$("#reply-delete-modal").hide();
				showReplys();
			}
		});
	});
	// 삭제취소
	$("#btnReplyDeleteCancle").click(function(){
		$("#btnReplyDeleteOk").removeAttr("data_b_f_r_no");
		$("#reply-delete-modal").hide();
	});
	
	//덧글 좋아요 클릭
	$("#reply-ul").on("click", ".btn-like", function(e){
		console.log("좋아요 클릭")
		console.log(e);
		let that = $(this);
		let b_f_r_no  = that.attr("data-b_f_r_no");
		console.log("b_f_r_no : " + b_f_r_no);
		$.ajax({
			type : "get",
			url : "/board/free/reply/like/" + b_f_r_no,
			success : function(rData){
				console.log(rData);
				showReplys();
			}
		});
	});
	
	// 댓글클릭
	// 덧글클릭
	$("#reply-ul").on("click", ".rereply", function(e){
		let that = $(this);
		let isReply = that.attr("data-isreply");
		let b_f_r_no = that.attr("data-b_f_r_no");
		let li = that.parent().parent().parent().parent();
		let ul = li.parent();
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
												.attr("data-b_f_r_no", b_f_r_no)
												.attr("data-isreply", false);
		};
		ul.children(".reply-li").remove();
		li.after(rereplyClone);
	});
	
  
	//댓글 보이기 메서드
	function showReplys(){
		$("#reply-ul").empty();
		$.ajax({
			type : "get",
			url : "/board/free/reply/list/${dto.b_f_no}",
			success : function(rData){
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
						`<li class="reply-item mt-10" style="margin-left: \${(obj.reply_level-1)*20}px; width: calc(100% - \${(obj.reply_level-1)*20}px)">
							<div class="user-profile flex">
								<img class="user-profile-img" alt="프로필" src="/resources/image/Boy6.gif">
							</div>
							<div class="width100per ml-20">
								<div class="flex justify-between pl-10">
									<span class="yellow-border-box">\${obj.replyer}</span>
									<button class="btn-like" data-b_f_r_no="\${obj.b_f_r_no}">
										<img class="like-img" alt="" src="/resources/image/favorite.png"> 
										<span style="margin:0 0 4px 4px">\${obj.good}</span>
									</button>
								</div>
								<textarea class="ta-reply-item ta-auto-resize pl-10 mt-10" rows="" cols="">\${obj.reply}								
								</textarea>
								<div class="flex justify-between pl-10">
									<div>
										<span>\${toDateString(obj.replydate)}</span> 
										<img class="reply-img" alt="reply" src="/resources/image/reply.png">
										<span class="cursor-pointer hover-black rereply" data-b_f_r_no="\${obj.b_f_r_no}">덧글달기</span>
									</div>
									<div class="flex">
										<button class="btn mr-10 btnReplyUpdate">수정</button>
										<button class="btn mr-10 btnReplyUpdateOk" data-b_f_r_no="\${obj.b_f_r_no}" style="display:none">수정완료</button>
										<button class="btn btnReplyDelete" data-b_f_r_no="\${obj.b_f_r_no}">삭제</button>
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
	
	
	
});

</script>

<!-- 댓글 삭제 모달 start -->
<div id="reply-delete-modal" class="modal">
	<div class="modal-content reply-delete-modal">
    	<span class="reply-delete-title">댓글을 삭제 하시겠어요?</span>
        <span class="reply-delete-content">이 게시물을 삭제하면 복원 할 수 없습니다</span>
        <div class="reply-delete-btn-box">
            <button class="reply-delete-btn reply-delete-btn-l" id="btnReplyDeleteCancle">취소</button>
            <button class="reply-delete-btn reply-delete-btn-r" id="btnReplyDeleteOk">삭제</button>
        </div>
    </div>
    <input type="hidden" id="b_f_r_no" name="b_f_r_no">
</div>
<!-- 댓글 삭제 모달 end -->

<!-- Write Start -->
<!-- <div class="write-container"> -->
	<h3 class="board-title">상세페이지 입니다</h3>
	<!-- DetailForm Start -->
	<form action="/board/community/updateRun" id="update-from" class="write-from" method="post">
		<div class="user-container">
			<div class="user-profile">
				<img class="user-profile-img" alt="프로필" src="/resources/image/Boy6.gif">
			</div>
			<div class="profile-container">
				<div class="mb-10 mt-10">
					<input class="input-user" value="${dto.b_f_writer}" readonly>
				</div>
				<div class="mb-10">
					<span>등록일</span> <input type="text" class="input-user" name="b_f_regdate" value="<fmf:formatDate value="${dto.b_f_regdate}" pattern="yyyy-MM-dd hh:mm"/>" readonly> 
				</div>
				<div>
					<span>조회수 </span><input type="text" class="input-user" name="b_f_views" value="${dto.b_f_views}" readonly>
				</div>
			</div>
			
		</div>
      	<input type="text" id="input-write" class="input-write" name="b_f_title" placeholder=" 제목을 입력 해 주세요." 
      			value="${dto.b_f_title}" readonly>
      	
		<!-- 모듈에서 가져올 html -->
		<textarea rows="" cols="" id="b_f_content" name="b_f_content" style="display:none;">${dto.b_f_content}</textarea>
		<input type="hidden" value="${dto.b_f_no}" name="b_f_no">
		<input type="hidden" value="${dto.b_f_img}" id="b_f_img" name="b_f_img">
		
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
			<script type="module" src="/resources/js/edite-detail.js"></script>
		<!-- CK에디터 end -->
		
        <div class="btn-container justify-between">
        	<!-- 로그인시 보이기 처리 -->
 			<div class="flex">
		        <button type="button" class="btn mr-10" id="btnList">목록</button>
		        
 			</div>

        	<!-- 추천하기 -->
        	<div class="recommend-container">
        		<button type="button" class="btnRecommend" id="btnRecommend">
        			<img alt="" src="/resources/image/thumb_up.png">
        		</button>
        		<span id="spanRecommend">${dto.b_f_recommended}</span>
        	</div>
        	
        	<!-- 로그인시 보이기 처리 -->
		    <div class="flex" >
	        	<c:if test="${login != null}">
		        		<button type="button" id="btnUpdate" class="btn mr-10">수정</button>
		        		<button type="button" id="btnDelete" class="btn mr-10">삭제</button>
		        		<button type="button" id="btnUpdateOk" class="btn mr-10" style="display:none">수정완료</button>
		        		<button type="button" id="btnUpdateCancle" class="btn mr-10"  style="display:none">취소</button>
	        	</c:if>
		        <a class="btn" href="/write">글쓰기</a>
		    </div>
         </div>
    </form>
    
    <!-- Reply Start -->
	<div class="reply-container border-t-1 border-b-1 mt-20 pt-20 pb-20">
		<ul id="reply-ul">
			
		</ul>
	</div>
    <!-- Reply End -->
    
    <!-- ReplyForm Start -->
    <ul class="rereply-ul">
	    <li class="reply-form-container ml-20 mt-10 mb-10 reply-li">
	    	<div class="mt-10 mb-10">
	    		<span >욕설, 상처 줄 수 있는 악플은 삼가주세요.</span>
	    		
	    	</div>
			<div class="form-reply">
			    <textarea rows="" cols="" class="ta-reply ta-auto-resize reply" placeholder="댓글을 입력해주세요.."></textarea>
	<!-- 		    <div> -->
				<input type="hidden" class="replyer" value="${login.u_nickname}">
	<!-- 		    </div> -->
				<div class="box-item justify-end"> 
					<button class="btn mt-10 btn-reply">댓글저장</button>
				</div>
			</div>
	    </li>
    </ul>
    <!-- ReplyForm End -->
    
    <!-- Delete Form Start -->
    <form action="/board/community/freeDelRun" method="post" id="formDelete">
    	<input type="hidden" name="b_f_no" value="${dto.b_f_no}">
    	<input type="hidden" name="b_f_img" value="${dto.b_f_img}">
    </form>
    <!-- Delete Form End -->
</div>
<!-- Write End -->

<%@ include file="/WEB-INF/views/Lee/include/actionForm.jsp"%>
<%@ include file="/WEB-INF/views/Lee/include/footer.jsp"%>