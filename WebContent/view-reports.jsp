<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,com.onlinebank.BankCommons" errorPage="" %>


<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html lang="zxx"> <!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Bingo One page parallax responsive HTML Template ">
  
  <meta name="author" content="Themefisher.com">

  <title>Bit-Bank</title>

<!-- Mobile Specific Meta
  ================================================== -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" />
  
  <!-- CSS
  ================================================== -->
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="plugins/themefisher-font.v-2/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="plugins/bootstrap/dist/css/bootstrap.min.css">
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick-theme.css">
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css">

  

</head>

<body id="body">

 <!--
  Start Preloader
  ==================================== -->
  <div id="preloader">
    <div class="preloader">
      <div class="sk-circle1 sk-child"></div>
      <div class="sk-circle2 sk-child"></div>
      <div class="sk-circle3 sk-child"></div>
      <div class="sk-circle4 sk-child"></div>
      <div class="sk-circle5 sk-child"></div>
      <div class="sk-circle6 sk-child"></div>
      <div class="sk-circle7 sk-child"></div>
      <div class="sk-circle8 sk-child"></div>
      <div class="sk-circle9 sk-child"></div>
      <div class="sk-circle10 sk-child"></div>
      <div class="sk-circle11 sk-child"></div>
      <div class="sk-circle12 sk-child"></div>
    </div>
  </div> 
  <!--
  End Preloader
  ==================================== -->


  
<!--
Fixed Navigation
==================================== -->
<section class="top-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                
            </div>
        </div>
    </div>
</section>
<section class="header  navigation">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav class="navbar navbar-expand-lg">
                    <a class="navbar-brand" href="index.html">
                        <img src="images/logo.png" alt="logo">
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="tf-ion-android-menu"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <jsp:include page="menu.jsp"></jsp:include>

                            
                        </ul>
                    </div>
                </nav>
                
            </div>
        </div>
    </div>
</section>
<section class="signin-page account" style="border-style: dotted;">
                     
	  <table style=" width: 92%" border="0" >
        <tr>
          <th colspan="15" bgcolor="#333333" scope="col"><font color="#FFFFFF">Following are the Repost of Your Acount(s). </font></th>
        </tr>
        <tr>
          <td colspan="15">&nbsp;</td>
          </tr>
        <tr>
        <td bgcolor="#2175BC"><div align="center" class="style2">Date</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">UserName</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Email_ID</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Mobile_No</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Company_Name</div></td>
                    <td bgcolor="#2175BC"><div align="center" class="style2">Company_Address</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Applicant_Income</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">CoApplicant_Income</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Loan_Amount</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Loan_Amount_Term</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Credit_score</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Types_Loans</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Intrest_per</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Status</div></td>
           
        </tr>
		<%
		try {

			String email=(String)session.getAttribute("email");
			System.out.println(email);
			Connection con = BankCommons.prepareConn();

			String quer = "select * from tbl_loan_process where Email_ID='"+email+"'";

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(quer);

			while (rs.next()) {
String Status=rs.getString("Status_Loan");
		if(Status.equalsIgnoreCase("Accept"))
		{
		%>
        <tr>
        <td><div align="center"><%=rs.getString(11)%></div></td>
          <td><div align="center"><%=rs.getString(2)%></div></td>
          <td><div align="center"><%=rs.getString(3)%></div></td>
          <td><div align="center"><%=rs.getString(4)%></div></td>
          <td><div align="center"><%=rs.getString(5)%></div></td>
          <td><div align="center"><%=rs.getString(6)%></div></td>
          <td><div align="center"><%=rs.getString(7)%></div></td>
          <td><div align="center"><%=rs.getString(8)%></div></td>
          <td><div align="center"><%=rs.getString(9)%></div></td>
          <td><div align="center"><%=rs.getString(10)%></div></td>
          
          <td><div align="center"><%=rs.getString(14)%></div></td>
          <td><div align="center"><%=rs.getString(15)%></div></td>
          <td><div align="center"><%=rs.getString(16)%></div></td>
          <td><div align="center"><%=rs.getString(13)%></div></td>
         
        </tr>
		<% 
		}
			}
		}
		 catch (SQLException e) {

										}
		%>
        
      </table>
    
	
</section>
<footer id="footer" class="bg-one">
  <div class="top-footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-3 col-md-3 col-lg-3">
         
        </div>
        <!-- End of .col-sm-3 -->

        <div class="col-sm-3 col-md-3 col-lg-3">
          
        </div>
        <!-- End of .col-sm-3 -->

        <div class="col-sm-3 col-md-3 col-lg-3">
          
        </div>
        <!-- End of .col-sm-3 -->

        <div class="col-sm-3 col-md-3 col-lg-3">
          
        </div>
        <!-- End of .col-sm-3 -->

      </div>
    </div> <!-- end container -->
  </div>
  <div class="footer-bottom">
   
  </div>
</footer> <!-- end footer -->


    <!-- end Footer Area
    ========================================== -->

    
    <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <script src="plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="plugins/bootstrap/dist/js/popper.min.js"></script>
    <script src="plugins/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Owl Carousel -->
    <script src="plugins/slick-carousel/slick/slick.min.js"></script>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <!-- Smooth Scroll js -->
    <script src="plugins/smooth-scroll/dist/js/smooth-scroll.min.js"></script>
    
    <!-- Custom js -->
    <script src="js/script.js"></script>

  </body>
  </html>