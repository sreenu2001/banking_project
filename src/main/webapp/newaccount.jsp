
<body background="banking.jpg" >
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
h2
{
color:yellow;
text-align:center;
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
<h2>OPEN NEW ACCOUNT</h2>
<form action="newaccountcode.jsp" method="post">
<table align="center" style="font-color:white">
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
<td>Conform_password:</td><td><input type="password" name="pswd1"><p></p></td>
</tr>
<tr align="center">
<td>Amount:</td><td><input type="number" name="amount"><p></p></td>
</tr>
<tr align="center">
<td>
Address:</td>
<td><input type="text" name="Address"><p></p></td>
</tr>
<tr align="center">
<td>
Mobile number:</td>
<td><input type="number" name="mno"><p></p></td>
</tr>
<tr align="center">
<td><input type="submit" value="submit"></td>
<td><input type="reset" value="clear"></td>
</tr>
</table>
</form>

</body>
