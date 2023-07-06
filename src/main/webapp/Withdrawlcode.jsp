<body background="banking.jpg">
	<%@ page import="java.sql.*"%>
	<%
	long acountnumber = Integer.parseInt(request.getParameter("anumber"));
	String name = request.getParameter("name");
	String password = request.getParameter("pswd");
	double wamount = Double.parseDouble(request.getParameter("wamount"));

	out.print("<font color=chocolate>" + "withdrawl  amount is:" + wamount + "<br>");

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "g_sreenu", "sreenu");
		PreparedStatement ps = con.prepareStatement(
		"select status from bankaccount where acountnumber=? and name=? and password=? and status=1");
		ps.setLong(1, acountnumber);
		ps.setString(2, name);
		ps.setString(3, password);

		ResultSet rs = ps.executeQuery();

		if (rs.next()) {

			PreparedStatement ps1 = con
			.prepareStatement("select amount from bankaccount where acountnumber=? and name=? and password=?");
			ps1.setLong(1, acountnumber);
			ps1.setString(2, name);
			ps1.setString(3, password);
			ResultSet rs1 = ps1.executeQuery();
			ResultSetMetaData rss = rs1.getMetaData();

			int n = rss.getColumnCount();
			for (int i = 1; i <= n; i++)

		out.print("<tr>");
			while (rs.next()) {
		for (int i = 1; i <= n; i++)
			out.print("<td><br> originalamount is: " + rs.getString(i) + "<br>");
		out.print("<tr>");
			}

			PreparedStatement ps2 = con.prepareStatement(
			"update bankaccount set amount=amount-? where acountnumber=? and name=? and password=?");
			ps2.setDouble(1, wamount);
			ps2.setLong(2, acountnumber);
			ps2.setString(3, name);
			ps2.setString(4, password);
			int m = ps2.executeUpdate();

			out.print("withdrawl amount is" + wamount + "<br>");

			PreparedStatement ps3 = con
			.prepareStatement("select amount  from bankaccount where acountnumber=? and name=? and password=?");
			ps3.setLong(1, acountnumber);
			ps3.setString(2, name);
			ps3.setString(3, password);
			ResultSet rs2 = ps3.executeQuery();
			ResultSetMetaData rss1 = rs2.getMetaData();

			int p = rss1.getColumnCount();
			for (int i = 1; i <= p; i++)

		out.print("<tr>");
			while (rs1.next()) {
		for (int i = 1; i <= p; i++)
			out.print("<td><br> After withdrawl amount is:" + rs1.getString(i));

			}

		} else {
			out.print(
			"sorry we con't withdrawl the amount because  your account is temporerly blocked <br> plase activate your account");
		}
		con.close();
	} catch (Exception ex) {
		out.print(ex);
	}
	%>
</body>