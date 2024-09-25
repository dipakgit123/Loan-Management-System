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
 * Servlet implementation class withdrawotpcode
 */
@WebServlet("/withdrawotpcode")
public class withdrawotpcode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public withdrawotpcode() {
        super();
        // TODO Auto-generated constructor stub
    }
    public String otpcode() 
	{
	
		StringBuilder ss = new StringBuilder();
		Random r = new Random();
		char ch;

		for (int i = 0; i < 5; i++) 
		{
			ch = (char) (Math.floor(26 * r.nextDouble() + 65));
			ss.append(ch);
		}

		return ss.toString();

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(false);
		String email=(String)session.getAttribute("email");
		Connection con=BankCommons.prepareConn();
		Statement st;
		try {
			String otpcodes=otpcode();
			st = con.createStatement();
		ResultSet rs=st.executeQuery("select * from withdrawotpcode where email='" +email+ "'");
		if(rs.next())
		{
			
			String str="update withdrawotpcode set otpcode='"+otpcodes+"' where email='" +email+ "'";
			Statement sst=con.createStatement();
			sst.executeUpdate(str);
		}
		else
		{
			String str="insert into withdrawotpcode values('"+email+"','"+otpcodes+"')";
			Statement sst=con.createStatement();
			sst.executeUpdate(str);
		}
		
		}
		catch(Exception e)
		{
			System.out.println(e);
			
		}
		response.sendRedirect("OTPCode.jsp?id=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(false);
		String op = "WITHDRAW";
		String date = (new java.util.Date()).toString();
		String uname = (String)session.getAttribute("uname");
		String acc=(String)session.getAttribute("accno");
		String am=(String)session.getAttribute("amt");
		int accno = Integer.parseInt(acc);
		int amt = Integer.parseInt(am);
		String otpcode=request.getParameter("username");
		String email=(String)session.getAttribute("email");
		Connection con=BankCommons.prepareConn();
		Statement st;
		try {
			st = con.createStatement();
		ResultSet rs=st.executeQuery("select * from withdrawotpcode where email='" +email+ "'");
		String dbotpcode=null;
		if(rs.next())
		{
			dbotpcode=rs.getString("otpcode");
			
		}
		if(dbotpcode.toLowerCase().equalsIgnoreCase(otpcode.toLowerCase()))
		{
		String msg="self";
		Random generator = new Random();
		int num = generator.nextInt(99999) + 99999;
		String bal_sql = "SELECT balance FROM tx_details WHERE uname='"+uname+"' AND acc_no = "+accno+" AND isnew = 'YES'";
		//System.out.println(bal_sql);
		int bal1=0;
		int update=0;
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
			String sql = "INSERT INTO tx_details (uname, acc_no, operation, amt, balance, time1, isnew,Destination,T_ID ) VALUES ('"+uname+"',"+accno+",'WITHDRAW',"+amt+","+bal1+", '"+date+"', 'YES','"+msg+"','"+num+"')";
			//System.out.println(sql);
			update = BankCommons.update(sql);
			
			
		}
		String data=uname+accno+"WITHDRAW";
		ptop.ptopverify(4, data);
		if(update==1)
		{
		pw.println("<script> alert('Amount WithDraw Successfuly');</script>");
		RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
		rd.include(request, response);
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("/withdraw.jsp");
			rd.include(request, response);	
		}
		}//if end otpcode
		else
		{
			pw.println("<script> alert('OTP Code Wrong');</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/withdraw.jsp");
			rd.include(request, response);	
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
