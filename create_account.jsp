<html>	
	<%@ page import="java.io.*, java.sql.*" %>
	<body>
		<%
			PreparedStatement pstmt2 = null;
			String Cust_Name = request.getParameter("FullName");
			String Email_ID = request.getParameter("Email");
			int Phone_No = Integer.parseInt(request.getParameter("PhoneNumber"));
			String pwd = request.getParameter("Password");
			String cpwd = request.getParameter("passwordconfirm");
			String Gender = request.getParameter("gender");
			int Age = Integer.parseInt(request.getParameter("Age"));
			Connection con = null;
			Statement stmt = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exploria","root","anand1234");
				pstmt = con.prepareStatement("insert into Customer(Cust_Name,Phone_No,Email_ID,Gender,Age) values(?,?,?,?,?);");
				pstmt.setString(1,Cust_Name);
				pstmt.setInt(2,Phone_No);
				pstmt.setString(3,Email_ID);
				pstmt.setString(4,Gender);
				pstmt.setInt(5,Age);
				int s = pstmt.executeUpdate();
				
				if(s==0){
					out.println("Fail");
					}
				else{
					pstmt2 = con.prepareStatement("insert into log_in(Username,Password) values(?,?);");
					pstmt2.setString(1,Email_ID);
					pstmt2.setInt(2,Integer.parseInt(pwd));
					pstmt2.executeUpdate();
					String userphno = request.getParameter("PhoneNumber");
					// stmt = con.createStatement();
					stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
					rs = stmt.executeQuery("select Cust_ID from Customer where Phone_No="+userphno+";");
					rs.absolute(1);
					int usercustid = rs.getInt(1);
					Cookie usercid = new Cookie("usercid",String.valueOf(usercustid));
					response.addCookie(usercid);
					response.sendRedirect("Home-Exploria\\HomePage.html"); 
				    }
			}
			catch(Exception e)
			{
				out.println(e);
			}
		%>
	</body>
</html>
		