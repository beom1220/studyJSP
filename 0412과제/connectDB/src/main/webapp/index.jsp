<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>

<%!
String str1 = "김기범";
String str2 = "안녕하세요,,!!";
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<nav>
	<ul>		<li><a href="input.jsp">명함입력</a></li>
		<li><a href="search.jsp">명함검색</a></li>
		<li><a href="index.jsp">홈으로</a></li>
	</ul>
</nav>
	<%
		Connection conn = null;
		try{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "123456";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password); // url, user, password를 변수로 처리해도됨
			out.print("데이터베이스 연결이 성공했습니다.");
		} catch(SQLException ex) {
			out.print("데이터베이스 연결이 실패했습니다.");
			out.print("SQLException : " + ex.getMessage());
		}finally{
			if(conn != null) {
				conn.close();
			}
		}
	%>
</body>
</html>