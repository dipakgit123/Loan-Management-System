package com.userinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlinebank.BankCommons;

/**
 * Servlet implementation class loan_process
 */
@WebServlet("/loan_process")
public class loan_process extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loan_process() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		// TransferOTPCode.jsp
		HttpSession session = request.getSession(false);
		String uname = (String) session.getAttribute("cust_name");
		System.out.println(uname);
		String date = (new java.util.Date()).toString();

		String email = (String) session.getAttribute("email");
		String mobile = (String) session.getAttribute("Mobile_No");

		String Married_Status = request.getParameter("Married_Status");
		String Education_Status = request.getParameter("Education_Status");
		String Employed_type = request.getParameter("Employed_type");
		String Company_Name = request.getParameter("Company_Name");
		String Company_address = request.getParameter("Company_address");
		String Applicant_Income = request.getParameter("Applicant_Income");
		String CoApplicant_Income = request.getParameter("CoApplicant_Income");
		String Loan_Amount = request.getParameter("Loan_Amount");
		String Loan_Amount_Term = request.getParameter("Loan_Amount_Term");
String bank_email_id=request.getParameter("bankname");
		String Credit_score = request.getParameter("Credit_score");
String Types_Loans= request.getParameter("Types_Loans");
String Intrest_per= request.getParameter("Intrest_per");

		Connection con = BankCommons.prepareConn();
		Statement st;
		try {
String Status_Loan="Pending";
			String str = "insert into tbl_loan_process(User_Name,Email_ID,Mobile_No,Company_Name,Company_Address,Applicant_Income,CoApplicant_Income,Loan_Amount,Loan_Amount_Term,Date_Application,Bank_Email_ID,Status_Loan,Credit_score,Types_Loans,Intrest_per) values('"
					+ uname + "','"+email+"','"+mobile+"','"+Company_Name+"','"+Company_address+"','"+Applicant_Income+"','"+CoApplicant_Income+"','"+Loan_Amount+"','"+Loan_Amount_Term+"','"+date+"','"+bank_email_id+"','"+Status_Loan+"','"+Credit_score+"','"+Types_Loans+"','"+Intrest_per+"')";
			Statement sst = con.createStatement();
			sst.executeUpdate(str);

		} catch (Exception e) {
			System.out.println(e);

		}
		response.sendRedirect("Loan_transfer.jsp?id=1");
	}

}
