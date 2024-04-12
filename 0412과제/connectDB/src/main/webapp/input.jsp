<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>명함 입력</title>
</head>
<body>
	<%
	System.out.println("-------------------------------------");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String loginid = "system";
	String password = "123456";
	
	String id = request.getParameter("txtId");
	String name = request.getParameter("txtName");
	String telNo = request.getParameter("txtTelNo");
	String mail = request.getParameter("txtMail");
	
	System.out.println("txtId : " + id);
	System.out.println("txtName : " + name);
	System.out.println("txtTelNo : " + telNo);
	System.out.println("txtMail : " + mail);
	
	Connection conn = null;
	Statement stat = null;
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, loginid, password);
		String sql = "Insert into namecard (id, name, telno, mail) values ('" + id + "', '" + name + "', '" + telNo + "', '" + mail + "')";
        
		System.out.println(sql);
		stat = conn.createStatement();
		stat.executeUpdate(sql);
	%>
	<script>
		alert("저장되었습니다.");
	</script>
	<%
	} catch (Exception e) {
		e.printStackTrace();
	%>
	<script>
		alert("저장 오류 발생. 관리자에게 문의하세요.");
	</script>
	<%
	} finally {
		if (stat != null) {
			stat.close();
		}
		if (conn != null) {
			conn.close();
		}
	}
	%>
	<div align="center"></div>
	<form action="<%= request.getRequestURI() %>" method="post">
		<table border="1" width="550" height="300">
			<tr align="center">
				<td>ID</td>
				<td><input type="text" name="txtId" size="10" value=""></td>
			</tr>
			<tr align="center">
				<td>이름</td>
				<td><input type="text" name="txtName" size="10" value=""></td>
			</tr>
			<tr align="center">
				<td>폰번호</td>
				<td><input type="text" name="txtTelNo" size="15" value=""></td>
			</tr>
			<tr align="center">
				<td>이메일</td>
				<td><input type="text" name="txtMail" size="30" value=""></td>
			</tr>
		</table>
		<input type="submit" value="입력"/>
	</form>
	<nav>
		<ul>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
</body>
</html>