<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,com.onlinebank.BankCommons" errorPage="" %>
<%
//java Code

String uname = (String)session.getAttribute("cust_name");

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
                    <a class="navbar-brand" href="#">
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
            <div style="width: 100%;">
                <div class="block" >
                    <h2 class="text-center" style="bgcolor:#333333" scope="col"> <font color="#FFFFFF">Loan Process From</font></h2>
                    
	<form id="form1" name="form1" method="post" action="loan_process">
	  <table >
       
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td ><strong>Account Holder Name </strong></td>
          <td>:</td>
          <td >&nbsp;<%= uname %></td>
        </tr>
          <tr>
          <td ><strong>Select Bank Name</strong></td>
          <td>:</td>
          <td><select name="bankname">
           <option value="">Select Bank Name</option>
              <%
              Connection con=BankCommons.prepareConn();
              Statement st = con.createStatement();
              ResultSet rs=st.executeQuery("select * from bank_details");
      		
             while(rs.next()){
			%>
              <option value="<%=rs.getString("email")%>" ><%=rs.getString("bname")%></option>
              <% } %>
            </select>          </td>
       
              <td><strong>Married</strong></td>
              <td>:</td>
              <td>
                <select name="Married_Status" required>
                <option value="">Select Married Status</option>
                  <option value="Married">Married</option>
                  <option value="UnMarried">UnMarried</option>
                  
                </select>
              </td>
            </tr>
            <tr>
              <td><strong>Education</strong></td>
              <td>:</td>
              <td>
                <select name="Education_Status" required>
                <option value="">Select Education Status</option>
                  <option value="Graduate">Graduate</option>
                   <option value="Post_Graduate">Post Graduate</option>
                  <option value="Not_Graduate">Not_Graduate</option>
                  
                </select>
              </td>
           
              <td><strong>Employed Type</strong></td>
              <td>:</td>
              <td>
                <select name="Employed_type" required>
                <option value="">Select Employed Type</option>
                  <option value="Salaried_Employee:">Salaried Employee</option>
                   <option value="Self_Employed">Self-Employed</option>
                  <option value="Part_Time_Employee">Part-Time Employee</option>
                   <option value="Contractor">Contractor Employee</option>
                  
                </select>
              </td>
            </tr>
            <tr>
          <td><strong>Company Name</strong></td>
          <td>:</td>
          <td>
            <input name="Company_Name" type="text" id="Amount"  required />
          </td>
      
          <td><strong>Company Address</strong></td>
          <td>:</td>
          <td><label>
            <textarea name="Company_address" cols="30" rows="4" required></textarea>
          </label></td>
        </tr>
        <tr>
          <td><strong>Applicant_Income</strong></td>
          <td>:</td>
          <td>
            <input name="Applicant_Income" type="text" id="Amount"  required />
          </td>
        
          <td><strong>CoApplicant_Income</strong></td>
          <td>:</td>
          <td>
            <input name="CoApplicant_Income" type="text" id="Amount"  required />
        </td>
        </tr>
        <tr>
          <td><strong>Loan_Amount</strong></td>
          <td>:</td>
          <td>
            <input name="Loan_Amount" type="text" id="Amount"  required />
          </td>
       
          <td><strong>Loan_Amount_Term</strong></td>
          <td>:</td>
          <td>
            <input name="Loan_Amount_Term" type="text" id="Amount"  required />
       </td>
        </tr>
        <tr>
          <td><strong>Credit score</strong></td>
          <td>:</td>
          <td>
            <input name="Credit_score" type="text" id="Amount"  required />
          </td>
       
          <td><strong>Types of Loans</strong></td>
          <td>:</td>
          <td>
           <select name="Types_Loans" required>
                <option value="">Select Types Loans</option>
                  <option value="Educational_Loan">Educational Loan</option>
                   <option value="Home_Loan">Home Loan</option>
                  <option value="Business_Loan">Business Loan</option>
                   <option value="Vehicle_Loan">Vehicle Loan</option>
                </select>
            
       </td>
        </tr>
        <tr>
              <td><strong>Intrest Per Month</strong></td>
              <td>:</td>
              <td>
            <input name="Intrest_per" type="text" id="Amount"  required />
          </td>
              </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><label>
          <input type="submit" name="Submit" value="Loan Process  " />
          </label></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
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
