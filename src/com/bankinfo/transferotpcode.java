package com.bankinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Blockchain.ChainConsensus;
import Blockchain.ptop;

import com.onlinebank.BankCommons;

/**
 * Servlet implementation class transferotpcode
 */
@WebServlet("/transferotpcode")
public class transferotpcode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public transferotpcode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter pw = response.getWriter();
		//TransferOTPCode.jsp
		HttpSession session = request.getSession(false);
		
		String date = (new java.util.Date()).toString();
		//String uname = request.getParameter("uname");
		
		
		String uname = (String)session.getAttribute("uname");
		String acc=(String)session.getAttribute("accno");
		String am=(String)session.getAttribute("amt");
		String email=(String)session.getAttribute("email");
		String dacc = (String)session.getAttribute("daccno");
		
		int accno = Integer.parseInt(acc);//Source Account No
		int daccno = Integer.parseInt(dacc);//Destination Account No
		int amt = Integer.parseInt(am);
		String otpcode=request.getParameter("username");
		Connection con=BankCommons.prepareConn();
		Statement st;
		try {
			st = con.createStatement();
		ResultSet rs=st.executeQuery("select * from transferotpcode where email='" +email+ "'");
		String dbotpcode=null;
		if(rs.next())
		{
			dbotpcode=rs.getString("otpcode");
			
		}
		if(dbotpcode.toLowerCase().equalsIgnoreCase(otpcode.toLowerCase()))
		{
		String bal_sql = "SELECT balance FROM tx_details WHERE uname='"+uname+"' AND acc_no = "+accno+" AND isnew = 'YES'";
		//System.out.println(bal_sql);
		int bal1=0;
		int update=0;
		Random generator = new Random();
		int num = generator.nextInt(99999) + 99999;
		int bal = BankCommons.getBalance(bal_sql);
		if(bal == 0){
			System.out.println("Current Balance : "+bal);
			pw.println("<script> alert('Your Account Balance is Zero');</script>");
//			response.sendRedirect("noBal.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("/noBal.jsp");
			rd.include(request, response);
		}else if(bal < amt){
			pw.println("<script> alert('Your Account have not Sufficient Balance');</script>");
			//response.sendRedirect("noBal.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("/noBal.jsp");
			rd.include(request, response);
		}else {
			bal1 = bal - amt;
			//System.out.println("Withdraw : "+bal1);
			String sql_up = "UPDATE tblaccountbank SET Amount_Account ='"+bal1+"' WHERE UserName='"+uname+"' AND Accountno = '"+accno+"'";
			update = BankCommons.update(sql_up);
			String sql = "INSERT INTO tx_details (uname, acc_no, operation, amt, balance, time1, isnew,Destination,T_ID ) VALUES ('"+uname+"',"+accno+",'TRANSFER',"+amt+","+bal1+", '"+date+"', 'YES','"+daccno+"','"+num+"')";
			//System.out.println(sql);
			update = BankCommons.update(sql);
			String sql_up1 = "UPDATE tblaccountbank SET Amount_Account ='"+amt+"' WHERE  Accountno = '"+daccno+"'";
			update = BankCommons.update(sql_up1);
			
			
		}
		String data=uname+accno+"TRANSFER"+date+daccno+num;

		ptop.ptopverify(4, data);
		if(update==1)
		{
		pw.println("<script> alert('Amount Transfer Successfuly');</script>");
		RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
		rd.include(request, response);
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("/transfer.jsp");
			rd.include(request, response);	
		}
		}//if end otpcode
		else
		{
			pw.println("<script> alert('OTP Code Wrong');</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/transfer.jsp");
			rd.include(request, response);	
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
