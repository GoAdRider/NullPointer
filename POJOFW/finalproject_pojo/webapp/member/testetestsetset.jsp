<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.12.1/polyfill.min.js"></script>

<script>
function abc(){
   let abc=`abc`;
   let bcd=`bcd\${abc}`;
   alert(bcd);
}
</script>

</head>
<body>
<button onclick="abc()">버튼</button>

</body>
</html>