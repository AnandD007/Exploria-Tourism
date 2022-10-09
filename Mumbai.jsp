<html>
	<%@ page import="java.io.*, java.sql.*" %>
	<body>
		<%
			
			Connection con = null;
			Statement stmt = null;
			PreparedStatement pstmt;
			ResultSet rs = null;
			
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exploria","root","anand1234");
				stmt = con.createStatement();
				String taid[]  = request.getParameterValues("Mumbai");

				int l = taid.length;
				int i = 0;
				int cid = 0;
				int bid = 0;
				int r=0;
				int y=0;
				int z=0;

				//rs = stmt.executeQuery("select max(Cust_ID) from Customer");
				//while(rs.next())
				//{
				//	cid = rs.getInt(1);
				//}
				
				
       				Cookie my_cookie = null;
       				Cookie[] cookies = null;
       				// Get an array of Cookies associated with the this domain
         			cookies = request.getCookies();
         			my_cookie = cookies[0];
				cid = Integer.parseInt(my_cookie.getValue());
				
				pstmt = con.prepareStatement("insert into Booking (Cust_ID) values ("+cid+");");
				r = pstmt.executeUpdate();
				
				rs = stmt.executeQuery("select max(BID) from Booking");
				while(rs.next())
				{
					bid = rs.getInt(1);
				}
				for(i=0;i<l;i++)
				{
					pstmt = con.prepareStatement("insert into bt (BID, TA_ID) values ("+bid+","+taid[i]+");");
					y = pstmt.executeUpdate();
				}
				
				if(r==0)
					out.println("Not Done!!!");
				else
					response.sendRedirect("Booking_Page\\Booking_Page.html");
			}
			 catch(Exception e)
			{
				response.sendRedirect("Login_Page\\Login.html");
			}
		%>
	</body>
</html>