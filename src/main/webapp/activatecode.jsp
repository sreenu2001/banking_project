<body background="banking.jpg">
<%@ page import="java.sql.*" %>
<%
long acountnumber=Integer.parseInt(request.getParameter("anumber"));
String name=request.getParameter("name");
String password=request.getParameter("pswd");
int status=1;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","g_sreenu","sreenu");
	PreparedStatement ps=con.prepareStatement("update bankaccount set status=? where acountnumber=? and name=? and password=?");
  ps.setInt(1, status);
	ps.setLong(2, acountnumber);
	ps.setString(3, name);
	ps.setString(4, password);
	int i = ps.executeUpdate();

	
		out.print("<font color=white><center><h3> your account is activated</h3><center>");
	

} catch (Exception ex) {
	out.print(ex);
}

%>
<table >
<tr style="color:greenyellow">
<td>
<a href="bhome.jsp" style="color:white" >HOME</a>&emsp;
<a href="newaccount.jsp" style="color:white">NEW ACCOUNT</a>&emsp;
<a href="Balance.jsp" style="color:white">BALANCE</a>&emsp;
<a href="Deposit.jsp" style="color:white">DEPOSIT</a>&emsp;
<a href="Withdrawl.jsp" style="color:white">WITHDRAWL</a>&emsp;
<a href="Transter.jsp " style="color:white">TRENSFER</a>&emsp;
<a href="close1.jsp" style="color:white">CLOSEA/C</a>&emsp;
<a href="AboutUs.jsp" style="color:white">ABOUTUS</a><br>&emsp;


</td>
</tr>
</table>
</body>