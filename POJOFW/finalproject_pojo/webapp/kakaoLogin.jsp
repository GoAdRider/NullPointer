<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>  
<%
	//response.setIntHeader("Refresh",5);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<!-- =============================== 카카오 로그인 ================================================== -->
<div id="kakao-login-btn">
	<a href="/auth/kakao"></a>
</div>

<!-- 	<a href="https://kauth.kakao.com/oauth/authorize?client_id=15f5287d753e527b86e1f231f7128313&redirect_uri=http://192.168.0.38:8000/kLogin.np&response_type=code"> -->
<!--           <img src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile28.uf.tistory.com%2Fimage%2F99BEE8465C3D7D12140EAC"> -->
<!--     </a> -->
<!-- <div id="d_test">d_test</div> -->
<script type='text/javascript'>
	var kakaoNick = "";
	var kakaoMail = "";
	var kakaoUser = "";
//     <![CDATA[
   	// 사용할 앱의 JavaScript 키를 설정해 주세요.
   	Kakao.init('15f5287d753e527b86e1f231f7128313');
// 	GET /oauth/authorize?client_id="15f5287d753e527b86e1f231f7128313"&redirect_uri="http://192.168.0.38:8000/member/index.jsp&response_type=code" HTTP/1.1
// 	Host: kauth.kakao.com
// 	"https://kauth.kakao.com/oauth/authorize?client_id=b5f85af25d1bdf961d4f2016bafe3c6e&redirect_uri=http://localhost:8000/login&response_type=code"
   	console.log(Kakao.isInitialized());
   	// 카카오 로그인 버튼을 생성합니다.
   	Kakao.Auth.createLoginButton({
		container: '#kakao-login-btn',
		success: function(authObj) {
//     	alert(JSON.stringify(authObj));

    	// 세션이 종료된 이후에도 토큰을 유지.
		persistAccessToken: true,
		// 세션이 종료된 이후에도 refresh토큰을 유지.
// 		persistRefreshToken: true,
		
//     	로그인 성공시, API를 호출합니다.
    	Kakao.API.request({
	 	    url: '/v2/user/me',
	 	    success: function(response) {
	 	    	var imsi = JSON.stringify(response);
	 	    	//alert("imsi : "+imsi);
	 	    	console.log(imsi);
	 	    	var jsonDoc = JSON.parse(imsi);
//	 	    	alert("response : "+response);
	 	    	//alert("jsonDoc : "+jsonDoc);
	 	    	
    	    	var user = response.kakao_account //계정 정보
	    	    console.log(user);
	    	    user.host = 'kakao'
	    	    kakaoUser = response.properties; //유저 정보
	    	    console.log(kakaoUser);
	    	    kakaoNick = response.properties.nickname; //유저가 등록한 별명
	    	    console.log(kakaoNick);
	    	    kakaoMail = response.kakao_account.email; //유저의 이메일
	    	    console.log(kakaoMail);
	    	    
	//     	    var kakaoAge = response.properties.age_range; //유저가 등록한 성별
	//     	    console.log(kakaoAge);
	//     	    var kakaoGender = response.kakao_account.gender; //유저가 등록한 나이
	//     	    console.log(kakaoGender);
	// 			kakaobirthday = repons.kakao_account.birthday; //유저가 등록한 생일
	//     	    console.log(kakaobirthday);

	// 			var image = response.properties.profile_image;
				
				//작업이 끝나면 띄울 화면의 파일 주소
	//     	    window.location.replace("http://192.168.0.38:8000/member/index.jsp?kakaoNick="+kakaoNick);
				
				//작업이 끝나면 띄울 화면 LoginController의 주소
	    	    window.location.replace("http://192.168.0.209:9000/kLogin.np?kakaoNick="+kakaoNick);
	    	    
		 	    },
	    	    fail: function(error) {
	    	        alert("에러1"+JSON.stringify(error));
	    	    }
				//정보를 넘겨주는 함수
//       		Kakao.Auth.authorize({
// // 				redirectUri: 'http://192.168.0.38:8000/kLogin.np?kakaoNick='+kakaoNick
//  				redirectUri: 'http://192.168.0.38:8000/index.jsp'
//  			});
    	    
    	})
    		//토근정보를 담을 변수
	    	var token = authObj.access_token;
	    	console.log(token);
	    	
	    	//
// 	    	$.ajax({
//     	    	url:"/kLogin.np?kakaoNcik="+kakaoNick
// //     	    	url:"/index.jsp?s_name="+kakaoNick
//     	    	,success: function(data) {
    	    		
//     	    	}
//     	    });
 	

    	  },
    	  fail: function(err) {
    	  	alert("에러2"+JSON.stringify(err));//카카오개발자홈피에 등록이 되지 않았을때 자주 나타남
    	  }
    });
   
</script>
<!-- =============================== 카카오 로그인 ================================================== -->
<!-- =============================== 카카오 로그아웃 ================================================== -->
<a href="http://developers.kakao.com/logout"></a>

<!-- =============================== 카카오 로그아웃 ================================================== -->

</body>
</html>