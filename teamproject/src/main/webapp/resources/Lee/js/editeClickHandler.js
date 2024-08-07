/**
 * 
 */
function setInputBysrc(src, i){
    	console.log("setInputByPaths...........");
    	//console.log(imgPaths);
    	let inputTag = "";
    	let startPoint = src.indexOf("/D");
    	let path = src.substring(startPoint);
    	inputTag += `<input type="text" name="attachList[${i}].at_url" value="${path}">`;

    	console.log("inputTag done");
    	console.log("inputTag : " + inputTag);
    	$("#div_empty").append(inputTag);
}//setInputByPaths