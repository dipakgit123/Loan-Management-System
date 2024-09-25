<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,com.onlinebank.BankCommons" errorPage="" %>
<%
//java Code

String uname = (String)session.getAttribute("cust_name");
int accNo = Integer.parseInt(request.getParameter("accNo"));
String sql = "SELECT acc_no, acc_type FROM acc_details WHERE uname='"+uname+"'";
//System.out.println(sql);
String bal_sql = "SELECT balance FROM tx_details WHERE uname='"+uname+"' AND acc_no = "+accNo+" AND isnew = 'YES'";
//System.out.println(bal_sql);
int bal = BankCommons.getBalance(bal_sql);
%>

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
<section class="signin-page account">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="block">
                    <h2 class="text-center" style="bgcolor:#333333" scope="col"> <font color="#FFFFFF">Your Current Banalce is As Follows</font></h2>
                    
                    
	<form id="form1" name="form1" method="post" action="">
	  <table >
       
        <tr>
          <td><div align="right"><strong>Customer Name </strong></div></td>
          <td><div align="right"><strong>:</strong></div></td>
          <td><%=uname%></td>
        </tr>
        <tr>
          <td><div align="right"><strong>Account No. </strong></div></td>
          <td><div align="right"><strong>:</strong></div></td>
          <td>&nbsp;<%=accNo%></td>
        </tr>
        <tr>
          <td><div align="right"><strong>Current Balance </strong></div></td>
          <td><div align="right"><strong>:</strong></div></td>
          <td>&nbsp;<font color="#FF0000"><%=bal%> Rs. </font></td>
        </tr>
        <tr>
          <td colspan="3">&nbsp;If you want to Deposite then <a href="deposite.jsp">Click Here</a><br/> Or For Withdrow the Ammount fro Your Account <a href="withdraw.jsp">Click here</a></td>
          </tr>
        <tr>
          <td width="43%">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="55%">&nbsp;</td>
        </tr>
      </table>
      </form>
	     </div>
            </div>
        </div>
    </div>
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
