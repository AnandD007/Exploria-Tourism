<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Payments - Successful | Exploria</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Billing-Table-with-Add-Row--Fixed-Header-Feature.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-4---Payment-Form.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-4---Timeline.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-Callout-Success.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/steps-progressbar.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<%@ page import = "java.io.*, java.sql.*, java.lang.*, java.util.*" %>
<body style="background: #f4bfd1;">
	<%
		Connection con=null;
		Statement stmt=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int phno = 0;
		int ano = 0;
		int cno = 0;
		int x = 0;

		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exploria","root","anand1234");
		stmt = con.createStatement();
		rs = stmt.executeQuery("select Phone_No from Customer where Cust_ID = (select max(Cust_ID) from Booking)");
		while(rs.next())
		{
			phno = rs.getInt(1);
		}
		String ch = "";
		ch = request.getParameter("pmode");
		
		if(ch.equals("UPI"))
		{		
			ano = phno;
			pstmt = con.prepareStatement("update transaction set MoP = 'UPI' where BID = (select max(BID) from booking);");
			x = pstmt.executeUpdate();
			if(x==0)
			{
				out.println("Fail");
			}
			pstmt = con.prepareStatement("update transaction set Acc_No = "+ano+" where BID = (select max(BID) from booking);");
			x = pstmt.executeUpdate();
			if(x==0)
			{
				out.println("Fail");
			}
		}
		else if(ch.equals("DC"))
		{
			ano = Integer.parseInt(request.getParameter("cardNumber"));
			pstmt = con.prepareStatement("update transaction set MoP = 'DC' where BID = (select max(BID) from booking);");
			x = pstmt.executeUpdate();
			if(x==0)
			{
				out.println("Fail");
			}
			pstmt = con.prepareStatement("update transaction set Acc_No = "+ano+" where BID = (select max(BID) from booking);");
			x = pstmt.executeUpdate();
			if(x==0)
			{
				out.println("Fail");
			}
		}
		else if(ch.equals("CC"))
		{
			ano = Integer.parseInt(request.getParameter("cardNumber"));
			pstmt = con.prepareStatement("update transaction set MoP = 'CC' where BID = (select max(BID) from booking);");
			x = pstmt.executeUpdate();
			if(x==0)
			{
				out.println("Fail");
			}
			pstmt = con.prepareStatement("update transaction set Acc_No = "+ano+" where BID = (select max(BID) from booking);");
			x = pstmt.executeUpdate();
			if(x==0)
			{
				out.println("Fail");
			}
		}
		
		int tatotal = 0;
		int num = 0;
		int gcharges = 0;
		int toutotal = 0;
		stmt = con.createStatement();
		rs = stmt.executeQuery("select sum(fees) from tourist_attraction where ta_id in (select ta_id from bt where bid = (select max(bid) from booking))");
		while(rs.next())
		{
			tatotal = rs.getInt(1);
		}
		rs = stmt.executeQuery("select num from booking where bid = (select max(bid) from bt)");
		while(rs.next())
		{
			num = rs.getInt(1);
		}
		toutotal = tatotal * num;
		rs = stmt.executeQuery("select gcharges from booking where bid = (select max(bid) from bt)");
		while(rs.next())
		{
			gcharges = rs.getInt(1);
		}
	%>
    <nav class="navbar navbar-light navbar-expand-md flex-wrap" style="box-shadow: 0px 0.1px 7px 0px;background: var(--bs-gray-200);">
        <div class="container">
            <div><a class="navbar-brand fs-4" href="..\Home-Exploria\HomePage.html" style="font-family:'Segoe UI Semibold';text-shadow: 1px 1px var(--bs-purple);"><strong>&nbsp;Exploria&nbsp; &nbsp;</strong></a></div><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-2">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="..\Home-Exploria\HomePage.html#attractions">Top Attractions</a></li>
                    <li class="nav-item"></li>
                    <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="file:///">&nbsp;Places&nbsp;</a>
                        <div class="dropdown-menu"><a class="dropdown-item" href="..\Pune-Places\Pune_Places.html">Pune</a><a class="dropdown-item" href="..\Jaipur-Places\Jaipur_Places.html">Jaipur</a><a class="dropdown-item" href="..\Delhi-Places\Delhi_Places.html">Delhi</a><a class="dropdown-item" href="..\Mumbai-Places\Mumbai_Places.html">Mumbai</a></div>
                    </li>
                    <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="file:///">Account</a>
                        <div class="dropdown-menu"><a class="dropdown-item" href="..\Payment-Billing-Details\Payment_Billing_Details.jsp">Billing Details</a><a class="dropdown-item" href="..\Booking_User-Profile-Page\User_Profile_Page.jsp">My Profile</a><a class="dropdown-item" href="..\Login_Page\Login.html">Log Out</a></div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="bs-callout bs-callout-success">
        <div class="d-flex d-sm-flex d-xl-flex d-xxl-flex justify-content-center justify-content-sm-center justify-content-xl-center justify-content-xxl-center"><img src="assets/img/correct.png" style="width: 100px;height: 100px;"></div>
        <h4 class="d-flex d-sm-flex d-xl-flex d-xxl-flex justify-content-center justify-content-sm-center justify-content-xl-center justify-content-xxl-center">Success </h4>
        <p class="d-flex d-sm-flex d-xl-flex d-xxl-flex justify-content-center justify-content-sm-center justify-content-xl-center justify-content-xxl-center"><strong>Wow, You have booked successfully...!</strong></p>
    </div>
    <h3 class="display-6 text-center" style="font-size: 30px;">&nbsp; Tickets Payment</h3>
    <section class="d-inline-flex d-sm-flex d-md-flex d-xl-flex d-xxl-flex justify-content-center justify-content-xl-center justify-content-xxl-center" style="margin-top: 25px;margin-bottom: 25px;">
        <div class="col-auto col-md-3 col-xl-3 d-sm-flex justify-content-sm-center">
            <div class="d-flex box-bg" style="width: 400px;">
                <div class="row text-dark d-flex">
                    <div class="col-xl-5 offset-xl-0 d-flex d-sm-inline-flex align-self-center">
                        <h5 class="mb-0 font-sm">Tourist Ticket amount:</h5>
                    </div>
                    <div class="col-xl-7 offset-xl-0 text-end align-self-center">
                        <div class="d-flex justify-content-center mb-1 form-group"><% out.print(toutotal); %></div>
                    </div>
                    <div class="col-xl-5 offset-xl-0 align-self-center">
                        <h5 class="mb-0 font-sm">Guide Charge:</h5>
                    </div>
                    <div class="col-xl-7 offset-xl-0 text-end align-self-center">
                        <div class="d-flex justify-content-center mb-1 form-group"><% out.print(gcharges); %></div>
                    </div>
                    <div class="col-xl-5 offset-xl-0 align-self-center">
                        <h5 class="mb-0 font-sm">Discount (%)</h5>
                    </div>
                    <div class="col-xl-7 offset-xl-0 text-end align-self-center">
                        <div class="d-flex justify-content-center mb-1 form-group"><% out.print("0"); %></div>
                    </div>
                    <div class="col-xl-5 offset-xl-0 align-self-center">
                        <h5 class="mb-0 font-sm">Net amount:</h5>
                    </div>
                    <div class="col-xl-7 offset-xl-0 text-end align-self-center">
                        <div class="d-flex justify-content-center mb-1 form-group"><% out.print(toutotal+gcharges); %></div>
                    </div>
                    <div class="col-xl-5 offset-xl-0 align-self-center">
                        <h5 class="mb-0 font-sm">Payment mode:</h5>
                    </div>
                    <div class="col-xl-7 offset-xl-0 text-end align-self-center">
                        <div class="d-flex justify-content-center mb-1 form-group"><% out.print(ch); %></div>
                    </div>
                    <div class="col-xl-5 offset-xl-0 align-self-center">
                        <h5 class="mb-0 font-sm">Payment status:</h5>
                    </div>
                    <div class="col-xl-7 offset-xl-0 text-end align-self-center">
                        <div class="d-flex justify-content-center mb-1 form-group"><% out.print("Successful"); %></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="text-end d-flex d-xxl-flex justify-content-center justify-content-xxl-center"><a class="btn btn-primary bg-danger bg-gradient border rounded-pill" role="button" style="width: 140px;margin-left: 10px;" onClick="window.print()"><i class="fa fa-print"></i>&nbsp;Print Inovice</a><button class="btn btn-primary bg-success bg-gradient border rounded-pill" type="button" style="width: 160px;margin-left: 10px;"><strong><a style="color:indigo;" href = "..\Home-Exploria\HomePage.html">Goto Back Home</a></strong></button></div>
    <footer class="footer-basic" style="background: var(--bs-gray-dark);color: var(--bs-light);margin-top: 65px;border-top-left-radius: 20px;border-top-right-radius: 20px;">
        <h1 style="text-align: center;margin-bottom: 20px;text-shadow: 2px 2px var(--bs-indigo);font-family:'Segoe UI Semibold';">Exploria</h1>
        <div class="social"><a href="https://www.instagram.com/"><i class="icon ion-social-instagram"></i></a><a href="https://in.linkedin.com/"><i class="icon ion-social-linkedin"></i></a><a href="https://www.twitter.com/"><i class="icon ion-social-twitter"></i></a><a href="https://www.facebook.com/"><i class="icon ion-social-facebook"></i></a></div>
        <ul class="list-inline d-sm-flex justify-content-sm-center">
            <li class="list-inline-item"><a href="..\Home-Exploria\HomePage.html">Home</a></li>
            <li class="list-inline-item"><a href="..\Home-Exploria\HomePage.html#services">Services</a></li>
            <li class="list-inline-item d-sm-flex"><a href="..\Aboutus-Exploria\AboutUs.html">About</a></li>
        </ul>
        <p class="copyright">Exploria © 2022 All rights are reserved&nbsp;<br></p>
    </footer>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Billing-Table-with-Add-Row--Fixed-Header-Feature.js"></script>
    <script src="assets/js/Bootstrap-4---Payment-Form.js"></script>
    <script src="assets/js/Bootstrap-DateTime-Picker-1.js"></script>
    <script src="assets/js/Bootstrap-DateTime-Picker-2.js"></script>
    <script src="assets/js/Bootstrap-DateTime-Picker.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>

</html>