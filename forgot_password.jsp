<html>
	<%@ page import="java.io.*, java.sql.*" %>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	    <title>Password - Show | Exploria</title>
	</head>

	<body style="background: #f4bfd1;">
		<h3 align='center' style="text-color:indigo;">Exploria</h3><br/><hr/>
		<h4 align="center">
		<%
			String email = request.getParameter("Email_Id");
			
			Connection con;
			Statement stmt;
			ResultSet rs;
			
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exploria","root","anand1234");
				stmt = con.createStatement();
				rs = stmt.executeQuery("select password from log_in where username = '"+email+"';");
				
				if(rs.next())
				{
					String pass = rs.getString(1);
					out.println("Your password is - "+pass);
				}
				else
				{
					out.println("Email Id is Not Found...!");
				}
				rs.close();
				stmt.close();
				con.close();
			}
			catch(Exception e)
			{
				out.println(e);
			}
		%>
		</h4><br><hr>
		<button style="float:center; align-items:center;" align='center' type="button" ><strong align='center'><a align="center" href = "..\jsp\Login_Page\Login.html">Goto Back To Login</a></strong></button>
	</body>
</html>