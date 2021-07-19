<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function drive(){
	alert("drive 출력");
}
//코드의 양이 많아서 result값 받아서 실행하는 proc(result) 함수 생성
function proc(result){
	$.each(result, function (index, item) {
	    //table에 출력	
		var str = '<tr><td> 제목 : '+item.C_COOK+'</td>';
		str += '<td> 날짜 : ' + item.C_DATE + '</td></tr>';
		str += '<tr><td colspan="2"> 준비물 : ' + item.C_INGREDIENTS + '</td></tr>';
		str += '<tr><td colspan="2"> 주소 : ' + item.C_ZIP + '</td></tr>';
		str += '<tr><td> 최대인원 : ' + item.MAXPERSONS + '</td>';
		str += '<td> <button onclick="drive()">신청하기</td></tr>';
		$('table').append(str);

	});
}

$(document).ready(function () {
	// 버튼이 클릭되면 ajax 호출
	$('button').click(function () {
		$.ajax({
			url: '/cookclass/showClass.np?m_id='+"aabbccdd13",
			success : function (result) { // each()함수 사용하거나 for문 사용
				//alert(result) // 객체이기 때문에 아래와 같이 출력된다.
						// [object Object],[object Object],[object Object]
				proc(result); // proc함수 호출
			} // success
		});
	});
	
});
</script>
</head>
<body>
	<button type="button">버튼</button>
	<div></div>
	<br>
	<table border="1">
	</table>

</body>