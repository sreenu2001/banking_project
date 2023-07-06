<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background="banking.jpg">
<style>
tr{
color:white;
}
a{
color:chocolate;
}
td{
color:yellow;

}
</style>
<a href="home.jsp">HOME</a>&emsp;
<a href="newaccount.jsp">NEW ACCOUNT</a>&emsp;
<a href="Balance.jsp">BALANCE</a>&emsp;
<a href="Deposit.jsp">DEPOSIT</a>&emsp;
<a href="Withdrawl.jsp">WITHDRAWL</a>&emsp;
<a href="Transter.jsp ">TRENSFER</a>&emsp;
<a href="close1.jsp">CLOSEA/C</a>&emsp;
<a href="AboutUs.jsp">ABOUTUS</a><br>&emsp;

<h1 align="center" style="color:green">TRANSFOR FORM</h1>
<form action="Transforcode.jsp">
<table align="center">
<tr align="center">
<td>Account Number:</td><td>
<input type="number" name="anumber"><p></p> </td>
</tr>
<tr align="center">
<td>Name:</td><td><input type="text" name="name"><p></p></td>
</tr>
<tr align="center">
<td>Password:</td><td><input type="password" name="pswd"><p></p></td>
</tr >

<tr align="center">
<td>targetAccountno:</td><td><input type="number" name="tacno"><p></p></td>
</tr >
<tr align="center">
<td>amount:</td><td><input type="number" name="tamount"><p></p></td>
</tr >

<tr align="center">
<td><input type="submit" value="submit"></td>
<td><input type="reset" value="clear"></td>
</tr>
</table>
</form>

</body>
</html>