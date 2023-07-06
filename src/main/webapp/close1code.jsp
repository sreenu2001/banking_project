<body background="banking.jpg">


<%@ page import="java.sql.*" %>
<%
long acountnumber=Integer.parseInt(request.getParameter("anumber"));
String name=request.getParameter("name");
String password=request.getParameter("pswd");
int status=0;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","g_sreenu","sreenu");
	PreparedStatement ps=con.prepareStatement("update bankaccount set status=? where acountnumber=? and name=? and password=?");
  ps.setInt(1, status);
	ps.setLong(2, acountnumber);
	ps.setString(3, name);
	ps.setString(4, password);
	int i = ps.executeUpdate();

	
		out.print("<font color=white> <center> your account is closed<center>");
	

} catch (Exception ex) {
	out.print(ex);
}

%>

<h4>PLASE ACTIVATE YOUR ACCOUNT </h4>

<a href="activate.jsp" Style="color:white"><h3>ACTIVATE</h3> </a>

</body>