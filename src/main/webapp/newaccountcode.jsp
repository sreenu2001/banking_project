<body background="banking.jpg">
<%@page import="java.sql.*" %>
<%
   long acountnumber = Long.parseLong(request.getParameter("anumber"));
   String name = request.getParameter("name");
   String password1 = request.getParameter("pswd");
   String cpassword= request.getParameter("pswd1");
   double amount = Double.parseDouble(request.getParameter("amount"));
   String address = request.getParameter("Address");
   long mobileno = Long.parseLong(request.getParameter("mno"));
   int status=1;
   String password="";
if(password1.equals(cpassword))
{
	password=password1;
}
else
{
out.print("<font color=chocolate>Enter The valid Password");
return;
}
   try {
	    Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "g_sreenu", "sreenu");
	    PreparedStatement ps = con.prepareStatement("insert into bankaccount values(?,?,?,?,?,?,?)");
	    ps.setLong(1, acountnumber);
	    ps.setString(2, name);
	    ps.setString(3, password);
    	ps.setDouble(4, amount);
	    ps.setString(5, address);
    	ps.setLong(6, mobileno);
    ps.setInt(7,status);
    		
    	
	    int i = ps.executeUpdate();
	    out.print(i + " <font color=chocolate> one record is inserted..");
    
	    con.close();
       }
   catch (Exception ex)
      {
     	out.print(ex);
       }
%>
</body>