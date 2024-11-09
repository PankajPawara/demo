package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out=response.getWriter();
			response.setContentType("text/html");
			
			Class.forName("com.mysql.jc.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dabba.com","root","Pankaj@123");
			String n=request.getParameter("username");
			String p=request.getParameter("password");
			PreparedStatement ps=con.prepareStatement("select name from admin where mobile=? and password=?");
			ps.setString(1, n);
			ps.setString(2, p);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) 
			{
				RequestDispatcher rd=request.getRequestDispatcher("adminpanel.html");
				rd.forward(request,response);
			}
			else {
				out.println("<font color=red fontsize=15>Login Failed!!<br>");
				out.println("<a herf=ULogin.html>Try Again!!</a>");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
