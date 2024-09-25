package com.userinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlinebank.BankCommons;

/**
 * Servlet implementation class dbRegister
 */
@WebServlet("/dbRegister")
public class dbRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dbRegister() {
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
		HttpSession session = request.getSession(false);
		String uname = request.getParameter("username");
		String password = request.getParameter("password");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String roll=request.getParameter("infodata");
		String cpassword=request.getParameter("cpassword");
		String msg="0";
		if(cpassword.endsWith(password))
		{
		if(roll.equals("User"))
		{
			
		String sqls = "SELECT * FROM user_details WHERE email ='"+email+"'";
		//System.out.println(sql);
		boolean ck = BankCommons.checkUser(sqls,session);
		System.out.println(ck);
		if(ck == true ){
			
			pw.println("<script> alert('AllReady Email-ID Existing');</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/signup.html");
			rd.include(request, response);
		}else {
			
		String sql = "INSERT INTO user_details (uname, upass, sec_question, answer, address, email, mobile ) VALUES ('"+uname+"','"+password+"','"+question+"','"+answer+"','"+address+"','"+email+"','"+mobile+"')";
		String str="insert into otpcodetble(email,otpcode) values('"+email+"','"+msg+"')";
		int update = BankCommons.update(sql);
		 BankCommons.update(str);
		if(update==1)
		{
		pw.println("<script> alert(' Register Successfuly');</script>");
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		rd.include(request, response);
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("/signup.html");
			rd.include(request, response);	
		}
		}
		}
		else
		{
			try {
			String sqls = "SELECT * FROM bank_details WHERE email ='"+email+"'";
			Connection con=BankCommons.prepareConn();
			Statement st;
			
				st = con.createStatement();
				Statement st1;
				
				st1 = con.createStatement();
			ResultSet rs=st.executeQuery(sqls);
			if(rs.next()){
				
				pw.println("<script> alert('AllReady Email-ID Existing');</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/signup.html");
				rd.include(request, response);
			}else 
			{
				String sql = "INSERT INTO bank_details (bname, bpass, sec_question, answer, address, email, mobile ) VALUES ('"+uname+"','"+password+"','"+question+"','"+answer+"','"+address+"','"+email+"','"+mobile+"')";
					st1.executeUpdate(sql);
					pw.println("<script> alert(' Register Successfuly');</script>");
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
					rd.include(request, response);
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		}
		else
		{
			pw.println("<script> alert('Password and Confirm Password Not Matched');</script>");	
			RequestDispatcher rd = request.getRequestDispatcher("/signup.html");
			rd.include(request, response);
		}
	}

}
