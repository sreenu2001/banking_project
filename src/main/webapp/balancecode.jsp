<body background="banking.jpg">
<%@ page import="java.sql.*" %>
<%
long acountnumber=Integer.parseInt(request.getParameter("anumber"));
String name=request.getParameter("name");
String password=request.getParameter("pswd");

try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","g_sreenu","sreenu");


PreparedStatement ps=con.prepareStatement("select status from bankaccount where acountnumber=? and name=? and password=? and status=1");
ps.setLong(1,acountnumber);
ps.setString(2,name);
ps.setString(3,password);

ResultSet rs=ps.executeQuery();
//ResultSetMetaData rss=rs.getMetaData();

if(rs.next())
{

PreparedStatement ps1=con.prepareStatement("select amount from bankaccount where acountnumber=? and name=? and password=?");
ps1.setLong(1,acountnumber);
ps1.setString(2,name);
ps1.setString(3,password);

ResultSet rs1=ps1.executeQuery();
ResultSetMetaData rss=rs1.getMetaData();
//out.print("<html><body><table border='1'>");
int n=rss.getColumnCount();
for(int i=1;i<=n;i++)
	out.print("<td><font color=chocolate size=3>"+"<br>"+rss.getColumnName(i));
out.print("<tr>");
while(rs1.next())
{
	for(int i=1;i<=n;i++)
		out.print("<td><br>"+rs1.getString(i));
	out.print("<tr>");
}
	//out.print("</table></body></html>");
 // }
}
else
{
	out.print(" <font color=chocolate size=4>your account is temporarly blocked <br> place activate your account...");
}
	con.close();
	
}

catch(Exception ex)
{
	out.print(ex);
}
%>
</body>