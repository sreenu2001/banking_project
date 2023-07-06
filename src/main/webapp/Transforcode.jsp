<body background="banking.jpg">
<%@ page import="java.sql.*"%>
<%
long acountnumber=Long.parseLong(request.getParameter("anumber"));
String name=request.getParameter("name");
String password=request.getParameter("pswd");
long targetAccountno=Long.parseLong(request.getParameter("tacno"));
double tamount=Double.parseDouble(request.getParameter("tamount"));
out.print(" <font color=chocolate> my acount is drecess with:"+tamount+"<br>");
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
PreparedStatement ps=con.prepareStatement("update bankaccount set amount=amount-? where acountnumber=? and name=? and password=?");
ps.setDouble(1,tamount);
ps.setLong(2,acountnumber);
ps.setString(3,name);
ps.setString(4,password);
int m=ps.executeUpdate();
//out.print(m+"one row updated"+"<br>");
PreparedStatement ps1=con.prepareStatement("select amount from bankaccount where acountnumber=? and name=? and password=?");

ps1.setLong(1,acountnumber);
ps1.setString(2,name);
ps1.setString(3,password);
ResultSet rs=ps1.executeQuery();
ResultSetMetaData rss=rs.getMetaData();
//out.print("<html><body><table border='1'>");
int n=rss.getColumnCount();
for(int i=1;i<=n;i++)
	//out.print("<td><font color=blue size=3>"+"<br>"+rss.getColumnName(i));
out.print("<tr>");
while(rs.next())
{
	for(int i=1;i<=n;i++)
		out.print("<td><br><font color=chocolate> my account balance is:"+rs.getString(i)+"<br> ");
	out.print("<tr>");
}
//	out.print("</table></body></html>");

out.print("  <font color=chocolate> target account incress with:"+tamount);
PreparedStatement ps2=con.prepareStatement("update bankaccount set amount=amount+? where acountnumber=?");
ps2.setDouble(1,tamount);
ps2.setLong(2,targetAccountno);

int c=ps2.executeUpdate();
//out.print(c+"one row updated");
PreparedStatement ps3=con.prepareStatement("select amount from bankaccount where acountnumber=?");

ps3.setLong(1,targetAccountno);

ResultSet rs1=ps3.executeQuery();
ResultSetMetaData rss1=rs1.getMetaData();
//out.print("<html><body><table border='1'>");
int p=rss1.getColumnCount();
for(int i=1;i<=p;i++)
	//out.print("<td><font color=blue size=3>"+"<br>"+rss.getColumnName(i)+"<br>");
out.print("<tr>");
while(rs1.next())
{
	for(int i=1;i<=p;i++)
		out.print("<td><br><font color=chocolate> finally the target amount is:"+rs1.getString(i));
	out.print("<tr>");
}
}
//	out.print("</table></body></html>");
else
{
	out.print(" sorry...<br>  we con't do this transaction because...<br> because one of the account is in inactivate  ");
}
con.close();
}
catch(Exception ex)
{
	out.print(ex);
}
%>
</body>