<body background="banking.jpg">

<%@ page import="java.sql.*" %>
<%
long acountnumber=Integer.parseInt(request.getParameter("anumber"));
String name=request.getParameter("name");
String password=request.getParameter("pswd");
double damount=Double.parseDouble(request.getParameter("damount"));
//double amount=damount+amount;

try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","g_sreenu","sreenu");
PreparedStatement ps4=con.prepareStatement("select status from bankaccount where acountnumber=? and name=? and password=? and status=1");
ps4.setLong(1,acountnumber);
ps4.setString(2,name);
ps4.setString(3,password);

ResultSet rs6=ps4.executeQuery();
if(rs6.next())
{
	out.print("<font color=chocolate>"+"diposite amount is:"+damount+"<br>");
PreparedStatement ps=con.prepareStatement("select amount from bankaccount where acountnumber=? and name=? and password=?");
ps.setLong(1,acountnumber);
ps.setString(2,name);
ps.setString(3,password);
ResultSet rs=ps.executeQuery();
ResultSetMetaData rss=rs.getMetaData();
//out.print("<html><body><table border='1'>");
int n=rss.getColumnCount();
for(int i=1;i<=n;i++)
	//out.print("<td><font color=blue size=3>"+"<br>"+rss.getColumnName(i));
out.print("<tr>");
while(rs.next())
{
	for(int i=1;i<=n;i++)
		out.print("<td><br>my acount balance is: "+rs.getString(i));
	out.print("<tr>");
}
PreparedStatement ps1=con.prepareStatement("update bankaccount set amount=amount+? where acountnumber=? and name=? and password=?");
ps1.setDouble(1,damount);
ps1.setLong(2,acountnumber);
ps1.setString(3,name);
ps1.setString(4,password);
int m=ps1.executeUpdate();
//out.print(m+"one row updated");
PreparedStatement ps2=con.prepareStatement("select amount from bankaccount where acountnumber=? and name=? and password=?");
ps2.setLong(1,acountnumber);
ps2.setString(2,name);
ps2.setString(3,password);
ResultSet rs1=ps2.executeQuery();
ResultSetMetaData rss1=rs1.getMetaData();
//out.print("<html><body><table border='1'>");
int s=rss.getColumnCount();
for(int i=1;i<=s;i++)
	//out.print("<td><font color=blue size=3>"+"<br>"+rss.getColumnName(i));
out.print("<tr>");
while(rs1.next())
{
	for(int i=1;i<=s;i++)
		out.print("<td><br>After diposite  my acount balance is: "+rs1.getString(i));
	out.print("<tr>");
}
	//out.print("</table></body></html>");
}
else
{
	out.print("<font color=chocolate> sorry...<br>account is in inactive ");
}
	con.close();
	
}
catch(Exception ex)
{
	out.print(ex);
}

%>
</body>