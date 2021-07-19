<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.Enumeration" %>
    <%request.setCharacterEncoding("UTF-8");
    Enumeration e = request.getParameterNames();
	while ( e.hasMoreElements() ){
		String name = (String) e.nextElement();
		String[] values = request.getParameterValues(name);		
		for (String value : values) {
			System.out.println("name=" + name + ",value=" + value);

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=value%>

<%		}   
	} %>
</body>
</html>