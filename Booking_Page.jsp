<html>
	<%@ page import  = "java.io.*, java.sql.*, java.lang.*, java.util.*" %>
	<body>
		<%
			Connection con;
			Statement stmt;
			PreparedStatement pstmt;
			ResultSet rs;
			int x = 0;
			
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exploria","root","anand1234");
				stmt = con.createStatement();
				
				String date = request.getParameter("Date");
				String time = request.getParameter("Time");
				int bid = 0;
				int r = 0;
				String guide[]  = request.getParameterValues("Guide");
				int l = 0;
				if(guide==null)
				{
					l=0;
				}
				else
				{
					l = guide.length;
				}
				int num = Integer.parseInt(request.getParameter("num"));
				int total1 = 0;
				int total2 = 0;
				int gcharge = 0;
				
				pstmt = con.prepareStatement("update booking set BDate = '"+date+"', BTime = '"+time+"' where BID = (select max(BID) from bt);");
				x = pstmt.executeUpdate();
				if(x==0)
				{
					out.println("Fail");
				}
				else
				{
					rs = stmt.executeQuery("select sum(fees) from Tourist_Attraction where TA_ID in (select TA_ID from bt where BID = (select max(BID) from Booking));");
					while(rs.next())
					{
						total1 = rs.getInt(1);
					}

					if(l!=0)
					{
						rs = stmt.executeQuery("select sum(fees) from Guide where TA_ID in (select TA_ID from bt where BID = (select max(BID) from Booking))");
						while(rs.next())
						{
							gcharge = rs.getInt(1);
						}	
						
					}
					else
					{
						gcharge = 0;
					}
					pstmt = con.prepareStatement("update booking set gcharges = "+gcharge+" where bid = (select max(bid) from bt);");
					x = pstmt.executeUpdate();
					if(x==0)
					{
						out.println("Fail");
					}
					
					total2 = total1*num+gcharge;
					pstmt = con.prepareStatement("insert into transaction(BID,Total) values ((select max(BID) from Booking),"+total2+")");
					x = pstmt.executeUpdate();
					if(x==0)
					{
						out.println("Fail");
					}
				}
				pstmt = con.prepareStatement("update booking set num = "+num+" where bid = (select max(bid) from bt);");
				x = pstmt.executeUpdate();
				if(x==0)
				{
					out.println("Fail");
				}
				else
				{
					response.sendRedirect("Payments_Page\\Payments_Page.jsp");
				}
			}
			catch(Exception e)
			{
				out.println(e);
			}
		%>
	</body>
</html>