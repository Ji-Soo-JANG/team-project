<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/Lee/include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
        // link 태그 생성
        var link = document.createElement('link');
        link.rel = 'stylesheet';
        link.href = '/resources/Lee/css/user/profile.css';

        // head 태그에 link 태그 추가
        document.head.appendChild(link);
    </script>
<script>
$(function(){
	$(".profile-item").on("click", ".btn-item", function(i){
		// 첫번째 버튼만
		console.log("첫번째버튼클릭");
		let that = $(this);
		let form = that.parent().next();
		console.log("that");
		console.log(that);
		console.log($(this).attr("class"));
		
		if($(this).attr("id")=="btnPw"){
			console.log("비밀번호 수정버튼");
			let userid = "${login.userid}";
			let userpw = $("#input-cur-pw").val();
			console.log(userid + ", " + userpw);
			let sData = {
				"userid" : userid,
				"userpw" : userpw
			};
			//비밀번호 체크
			$.ajax({
				type: "post",
				url: "/Lee/user/checkUser",
				data: sData,
				success: function(rData){
					console.log(rData);
					if(rData===true){
						console.log("인증성공");
						$("form").fadeOut(1000);
						form.append($("#input_userid"));
						form.fadeIn(1000);
					}else{
						//비밀번호 체크 실패
						console.log("인증실패");
						alert("비밀번호를 다시 확인해주세요.");
						return;
					};
				}
			});//ajax
		}else{
			$("form").fadeOut(1000);
			form.append($("#input_userid"));
			form.fadeIn(1000);
		}
		
	});
	
	$(".profile-item").on("click", ".secondBtn", function(i){
		//두번째버튼
		console.log("두번째버튼 클릭");
		let that = $(this);
		console.log(that);
		if(that.attr("id")=="btnPwOk"){
			//비밀번호 변경버튼
			console.log("비밀번호 변경 완료 버튼");
			let userpw = $("#userpw").val();
			let userpw_check = $("#userpw_check").val();
			console.log("userpw : " + userpw + ", userpw_check : " + userpw_check);
			if(userpw === userpw_check){
				//폼전송
				console.log("폼전송");
				let form = that.parent().parent();
				console.log(form);
				form.submit();
			}else{
				alert("비밀번호가 다릅니다.");
			}
		}else{
			//비밀번호 변경 버튼 아닌경우
// 			let imgFile = $("#img-file");
// 			let files = imgFile[0].files;
// 			let file = files[0];
// 			let name = file.name;
			console.log(imgFile);
			console.log(files);
			console.log(file);
		}
		
	});
	
});
</script>

<div class="profile-container">
    <div class="title-item">
        <h1>프로필</h1>
<%--         <span>${profile}</span>  --%>
    </div>
    <div class="div-profile">
        <div class="profile-item">
            <label for=""><span class="bold">아이디</span></label>
            <span>${profile.userid}</span>
            <input type="hidden" value="${profile.userid}" id="input_userid" name="userid">
        </div>
       
        <!-- 프로필사진 -->
        <div class="profile-item">
            <label for=""><span class="bold">프로필</span></label>
            <span><img alt="profile" src="<c:choose>
									      	<c:when test="${profile.thumbnail!=null}">/display/${profile.thumbnail}</c:when>
									        <c:otherwise>/resources/Lee/image/empty_profile.jpg</c:otherwise>
									      </c:choose> 
           								 " width="110" height="110"></span>
            <button type="button" class="btn-item">수정</button>
        </div>
        <form class="form-item">
        	<div class="profile-item">
            	<label for=""><span class="color-gray">이미지파일</span></label>
            	<input type="file" id="img-file">
            </div>
        	<div class="profile-item">
        		<label for=""></label>
            	<button type="button" class="secondBtn" >완료</button>

            </div>
        </form>
  
  		<!-- 닉네임 -->
        <div class="profile-item">
            <label for=""><span class="bold">닉네임</span></label>
            <span>${profile.nickname}</span>
            <button type="button" class="btn-item">수정</button>
        </div>
        <form class="form-item">
        	<div class="profile-item">
            	<label for=""><span class="color-gray">중복확인</span></label>
            	<input type="text" class="input-item" placeholder="닉네임" name="nickname">
            	<button type="button" class="secondBtn">확인</button>
            </div>
        </form>
        
        <!-- 이메일 -->
        <div class="profile-item">
            <label for=""><span class="bold">이메일</span></label>
            <span>
            	${profile.email}
            </span>
            <button type="button" class="btn-item">수정</button>
        </div>
        <form class="form-item">
        	<div class="profile-item">
            	<label for=""><span class="color-gray">중복 확인</span></label>
            	<input type="email" class="input-item" placeholder="이메일" name="email">
            	<button type="button" class="secondBtn">확인</button>
            </div>
        </form>
        
        <div class="profile-item">
            <label for=""><span class="bold">레벨</span></label>
            <span>${profile.lv}</span>
        </div>
        <div class="profile-item">
            <label for=""><span class="bold">포인트</span></label>
            <span>${profile.point}</span>
        </div>
        
        <!-- 비밀번호 -->
        <div class="profile-item">
            <label for=""><span class="bold">비밀번호</span></label>
            <input type="password" id="input-cur-pw" class="input-item" placeholder="현재 비밀번호" >
            <button type="button" class="btn-item" id="btnPw">수정</button>
        </div>
        <form class="form-item" action="updatePassword" method="post">
        	<div class="profile-item">
            	<label for=""><span class="color-gray">변경할 비밀번호</span></label>
            	<input type="password" id="userpw" class="input-item" placeholder="비밀번호" name="userpw">
            	<button type="button" id="btnPwOk" class="secondBtn">완료</button>
            </div>
        	<div class="profile-item">
            	<label for=""><span class="color-gray">비밀번호 확인</span></label>
            	<input type="password" id="userpw_check" class="input-item" placeholder="비밀번호 확인">
            </div>
        </form>
        
    </div>
</div>


<%@ include file="/WEB-INF/views/Lee/include/footer.jsp"%>