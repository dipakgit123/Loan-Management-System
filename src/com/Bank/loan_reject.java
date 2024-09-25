package com.Bank;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
 * Servlet implementation class loan_reject
 */
@WebServlet("/loan_reject")
public class loan_reject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loan_reject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		HttpSession session = request.getSession(false);
		String id = request.getParameter("id");
		String email=(String)session.getAttribute("bemail");
		
		try {
			String Status_Loan="Reject";
			Connection con = BankCommons.prepareConn();
			
				Statement s=con.createStatement();
				s.executeUpdate("update tbl_loan_process set Status_Loan='"+Status_Loan+"' where Bank_Email_ID ='" + email
					+ "' and Lid='"+id+"'");
				
				
				pw.println("<script> alert(' Update Successfuly');</script>");
				RequestDispatcher rd = request
						.getRequestDispatcher("/Bank_userview.jsp");
				rd.include(request, response);
			
		} catch (SQLException e) {
		
			System.out.println(e);
		}
	}

}
