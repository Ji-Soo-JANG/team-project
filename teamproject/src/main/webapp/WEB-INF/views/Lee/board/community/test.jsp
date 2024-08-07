<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드 테스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>	
<!-- 에디터 -->
<link rel="stylesheet" href="/resources/css/edite.css">
<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/42.0.2/ckeditor5.css">
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/simple-upload-adapter/simple-upload-adapter.js"></script>
<!-- 에디터 -->

</head>
<body>

<!-- 원본 이미지 -->
<div class="bigPictureWrapper" >
	<div class="bigPicture">
	
	</div>
</div>
<!-- // 원본 이미지 -->
			<div>
				<div class="main-container">
						<div class="editor-container editor-container_classic-editor" id="editor-container">
							<div class="editor-container__editor">
								<div id="editor"></div>
							</div>
						</div>
				</div>
			</div>
			<script type="importmap">
				{
					"imports": {
						"ckeditor5": "https://cdn.ckeditor.com/ckeditor5/42.0.2/ckeditor5.js",
						"ckeditor5/": "https://cdn.ckeditor.com/ckeditor5/42.0.2/"
					}
				}
			</script>
			<script type="module" src="/resources/js/edite.js"></script>
			
			<!-- 테스트인풋 -->
			
			<div id="uploadDiv">
				<input type="file" name="uploadFile" id="uploadFile" multiple>
			</div>
			<button type="button" id="btn">전송</button>
			
			<p>이미지</p>
			<img alt="" src="/display?fileName=/D:/upload/board-img/2024/07/31/39644701-db74-4cd0-899f-1235111c932e_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B82.png">
<script>
$(function(){
	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	// -> run.exe, smile.zip, ....
	let maxSize = 5242880; // 5MB
	
	$("#btn").click(function(){
		console.log("전송버튼");
		const inputFile = $("#uploadFile");
		console.log(inputFile[0].files);
		
		
		let files = inputFile[0].files;
		uploadFiles(files);
	});
	
	function uploadFiles(files) {
		// <form>
		let formData = new FormData();
	
		for (let i = 0; i < files.length; i++) {
			let fileName = files[i].name;
			let fileSize = files[i].size;
			if (!checkExtension(fileName, fileSize)) {
				return false;
			}
			// <input type="file" name="uploadFile" >
			formData.append("uploadFile", files[i]);
		}
		
		console.log(formData);
		
		// 비동기 전송
		// contentType:false, processData:false - multipart/form-data
		$.ajax({
			type: "post",
			url: "/uploadAction",
			contentType: false, // "application/json; chartset=utf-8" // x
			processData: false, // &name=hong&age=20 // x
			data: formData,
			success: function(rData) {
				console.log(rData); // List<AttachFileDto>
				for(let i=0; i<rData.length; i++){
					console.log(rData[i].toString);
				}
// 				$.each(rData, function(index, obj) {
// 					let imgTag;
// 					let fileName = `\${obj.uploadPath}/\${obj.uuid}_\${obj.fileName}`;
// 					if (!obj.image) {
// 						imgTag = `<a href='/download?fileName=\${obj.uploadPath}/\${obj.uuid}_\${obj.fileName}'>
// 									<img src='/resources/default.png' width='100'></a>`;
// 					} 
// 					else {
// 						let path = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
// 						let callPath = obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName;
// 						imgTag = `<img class="imgImage" src="/display?fileName=\${path}" 
// 									data-callpath="\${callPath}">`;
// 					}
					
// 					let liTag = `<li>\${imgTag} \${obj.fileName} <span style="cursor:pointer;"
// 									data-filename="\${fileName}">&times;</span></li>`;
// 					$("#uploadedList").append(liTag);
// 				});
			}//success
		}); // $.ajax({
	}
	
	function checkExtension(fileName, fileSize) {
		if (fileSize > maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		
		if (regex.test(fileName)) {
			alert("해당 파일 종류는 업로드 할 수 없습니다.");
			return false;
		}
		
		return true;
	}
});
</script>
</body>
</html>