package in.ps.studentapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import in.ps.studentapp.dao.StudentDAO;
import in.ps.studentapp.dao.StudentDAOimpl;
import in.ps.studentapp.dto.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/forgot")
public class Forgot extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudentDAO sdao = new StudentDAOimpl();
		//PrintWriter out = resp.getWriter();
		Student s=sdao.getStudent(Long.parseLong(req.getParameter("phone")),req.getParameter("mail"));
		if(s!=null) {
			if(req.getParameter("password").equals(req.getParameter("confirmPassword"))) {
			s.setPassword(req.getParameter("password"));	
			boolean res=sdao.updateStudent(s);
	        if(res) {
	        	//out.println("<h1>Password updated successfully!</h1>");
	        	req.setAttribute("success", "Password updated successfully!");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
				} else {
					//out.println("<h1>failed to update the password!</h1>");
					req.setAttribute("error", "failed to update the password!");
					RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
					rd.forward(req, resp);
				}
			} else {
				//out.println("<h1>Password mismatch</h1>");
				req.setAttribute("error", "Password mismatch");
				RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
				rd.forward(req, resp);
			}
		}else {
			//out.println("<h1>incorrect phone or mail</h1>");
			req.setAttribute("error", "incorrect phone or mail");
			RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
			rd.forward(req, resp);
		}
	}

}
