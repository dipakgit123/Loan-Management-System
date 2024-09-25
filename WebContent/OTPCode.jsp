<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
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
<script language ="javascript" >
        var tim;
       
        var min = 1;
        var sec = 60;
        var f = new Date();
    function f1() {
        	f2();
        	
        }
        function f2() {
            if (parseInt(sec) > 0) {
                sec = parseInt(sec) - 1;
                document.getElementById("showtime").innerHTML = "Your Left Time  is :"+min+" Minutes ," + sec+" Seconds";
                tim = setTimeout("f2()", 1000);
            }
            else {
                if (parseInt(sec) == 0) {
                    min = 0;
                    document.getElementById("showtime").innerHTML = "Your Left Time  is :" + min + " Minutes ," + sec + " Seconds";
                    tim = setTimeout("f2()", 1000);
                    clearTimeout(tim);
                    location.href = "OTPCode.jsp?id=2";
                    
                }
               
            }
        }
    </script>
  

</head>

<body id="body" onload="f1()">

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
                <%
String id=request.getParameter("id");
%>
                    <h2 class="text-center">Sign In to BitBank</h2>
        <form id="form1" name="form1" method="post" action="withdrawotpcode">
          <table width="100%" border="1" align="center" cellpadding="2" cellspacing="2" style="border:#000000 solid 2px; padding:5px;">
            <tr>
              <th colspan="3" bgcolor="#000000" scope="col"><font color="#FFFFFF">Customer Login</font></th>
              </tr>
            <tr>
              <td width="22%" rowspan="3"><div align="center"><img src="images/icon_module.png" width="42" height="42" /></div></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="24%">OTP Code:</td>
              <td width="48%"><label>
                <input name="username" type="text" id="username"  required/>
              </label></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td colspan="2"><label>
                
                    <div align="center">
                      <input name="Submit" type="submit"  value="Submit" />
                    </div>
                   
                  </label>
                   
                  </td>
              </tr>
          <% 
          System.out.println(id);
          if(id==null)
          {
        	  response.sendRedirect("withdraw.jsp?id=1");
        	  
          }
          else if(id.equals("1"))
            		{
        	  %>
            <tr>
              <td colspan="3" align="center"><div id="showtime"></div></td>
             
            </tr>
           <%
           id="0";
            		}
          else if(id.equals("2")){
          %>
          <tr>
              <td colspan="3" align="center"><a href="withdrawotpcode?i=0" style="color: red;">ReSend OTPCode</a></td>
             
            </tr>
          
          <%
          id="0";
          }
          else
          {
        	  %>
        	  <%
          }
          %>
          </table>
                </form>        </div>
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
