<html>
	<%@ page import="java.io.*, java.sql.*" %>
	<body>
		<%
			String email = request.getParameter("Username");
			String pwd = request.getParameter("Password");
			
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
					
					if(pass.equals(pwd))
					{
						// stmt = con.createStatement();
						stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
						rs = stmt.executeQuery("select Cust_ID from customer where Email_ID='"+email+"' ;");
						rs.absolute(1);
						int usercustid = rs.getInt(1);
						Cookie usercid = new Cookie("usercid",String.valueOf(usercustid));
						response.addCookie(usercid);
						response.sendRedirect("Home-Exploria\\HomePage.html");
					}
					else
					{
						response.sendRedirect("Login_Page\\Login.html");
					}
				}
				else
				{
					out.println("Such credentials do not exist in our database... Please try something else");
				}
			}
			catch(Exception e)
			{
				out.println(e);
			}
		%>
	</body>
</html>