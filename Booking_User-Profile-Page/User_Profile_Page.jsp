<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Booking_User-Profile-Page-Exploria</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Billing-Table-with-Add-Row--Fixed-Header-Feature.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-4---Payment-Form.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-4---Timeline.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-Callout-Success.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/Profile-with-data-and-skills.css">
    <link rel="stylesheet" href="assets/css/steps-progressbar.css">
    <link rel="stylesheet" href="assets/css/styles.css">
<%@ page import = "java.io.*, java.sql.*, java.lang.*, java.util.*" %>

</head>
<%
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		int phno = 0;
		String addr = "";
		String name = "";
		String emailer = "";
		int custid = 0;
		int age = 0;
		int cid = 0;
		
		Cookie my_cookie = null;
		Cookie[] cookies = null;
		 // Get an array of Cookies associated with the this domain
		cookies = request.getCookies();
		my_cookie = cookies[0];
		cid = Integer.parseInt(my_cookie.getValue());

		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exploria","root","anand1234");
		stmt = con.createStatement();
		rs = stmt.executeQuery("select Phone_No, Cust_Name, Cust_ID, Email_ID,Age from Customer where Cust_ID ="+cid+";");
		while(rs.next())
		{
			phno = rs.getInt(1);
			name = rs.getString(2);
			custid = rs.getInt(3);
			emailer = rs.getString(4);
			age = rs.getInt(5);
		}
%>
<body style="background: #f4bfd1;">
    <nav class="navbar navbar-light navbar-expand-md flex-wrap" style="box-shadow: 0px 0.1px 7px 0px;background: var(--bs-gray-200);">
        <div class="container">
            <div><a class="navbar-brand fs-4" href="..\Home-Exploria\HomePage.html" style="font-family:'Segoe UI Semibold';text-shadow: 1px 1px var(--bs-purple);"><strong>&nbsp;Exploria&nbsp; &nbsp;</strong></a></div><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-2">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="..\Home-Exploria\HomePage.html#attractions">Top Attractions</a></li>
                    <li class="nav-item"></li>
                    <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">&nbsp;Places&nbsp;</a>
                        <div class="dropdown-menu"><a class="dropdown-item" href="..\Pune-Places\Pune_Places.html">Pune</a><a class="dropdown-item" href="..\Jaipur-Places\Jaipur_Places.html">Jaipur</a><a class="dropdown-item" href="..\Delhi-Places\Delhi_Places.html">Delhi</a><a class="dropdown-item" href="..\Mumbai-Places\Mumbai_Places.html">Mumbai</a></div>
                    </li>
                    <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">Account</a>
                        <div class="dropdown-menu"><a class="dropdown-item" href="..\Payment-Billing-Details\Payment_Billing_Details.jsp">Billing Details</a><a class="dropdown-item" href="..\Login_Page\Login.html">Log Out</a></div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <h3 class="display-6 text-center" style="font-size: 30px;margin-top: 25px;">Your Profile Details</h3>
    <div class="container">
        <div class="row d-lg-flex d-xl-flex justify-content-lg-center justify-content-xl-center" style="margin-bottom: 20px;">
            <div class="col-md-6 d-lg-flex d-xl-flex justify-content-lg-center align-items-lg-center">
                <div class="d-lg-flex d-xl-flex justify-content-lg-center align-items-lg-center justify-content-xl-center" style="padding: 40px;">          <div class="row gutters-sm d-lg-flex d-xl-flex justify-content-lg-center align-item-center rounded">
            <div class="col-md-11 mb-3 rounded">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="assets/img/user1.png" alt="Admin" class="rounded-circle" width="170">
                    <div class="mt-3">
                      <h4><% out.print(name); %></h4>
                      <p class="text-secondary mb-1">Traveller</p>
                      <p class="text-muted font-size-sm"><% out.print("Customer UID : "+custid); %></p>
                    </div>
                  </div>
                </div>
                </div></div></div>
            </div>
            <div class="col-md-6 d-lg-flex d-xl-flex justify-content-lg-center align-items-lg-center justify-content-xl-center">
                <div class="d-lg-flex d-xl-flex justify-content-lg-center align-items-lg-center justify-content-xl-center">
              <div class="card mb-0 d-lg-flex d-xl-flex justify-content-lg-center align-item-center rounded" style="margin-top:-40px">
                <div class="card-body rounded">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Full Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <% out.print(name); %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <% out.print(emailer); %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Phone</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <% out.print(phno); %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Age</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <% out.print(age); %>
                    </div>
                  </div>
                </div>
              </div></div>
            </div>
        </div>
    </div>
    <div class="text-end d-flex d-xxl-flex justify-content-center justify-content-xxl-center"><a href="..\Home-Exploria\HomePage.html"<button class="btn btn-primary bg-success bg-gradient border rounded-pill" type="button" style="width: 160px;margin-left: 10px;"><strong>Goto Back Home</strong></button></a></div>
    <footer class="flex-fill footer-basic" style="background: var(--bs-gray-dark);color: var(--bs-light);margin-top: 20px;border-radius: 20px;border-top-left-radius: 20px;border-top-right-radius: 20px;margin-bottom: 20px;">
        <h1 style="text-align: center;margin-bottom: 20px;text-shadow: 2px 2px var(--bs-indigo);font-family:'Segoe UI Semibold';">Exploria</h1>
        <div class="social"><a href="https://www.instagram.com/"><i class="icon ion-social-instagram"></i></a><a href="https://in.linkedin.com/"><i class="icon ion-social-linkedin"></i></a><a href="https://www.twitter.com/"><i class="icon ion-social-twitter"></i></a><a href="https://www.facebook.com/"><i class="icon ion-social-facebook"></i></a></div>
        <ul class="list-inline d-sm-flex justify-content-sm-center">
            <li class="list-inline-item"><a href="C:\Users\user\Desktop\Full_Pro_Exploria\Home-Exploria\HomePage.html">Home</a></li>
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