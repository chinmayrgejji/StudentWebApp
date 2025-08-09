package in.ps.studentapp.servlets;

import java.io.IOException;

import in.ps.studentapp.dao.StudentDAO;
import in.ps.studentapp.dao.StudentDAOimpl;
import in.ps.studentapp.dto.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/reset")
public class Reset extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session= req.getSession(false);
		Student s=(Student)session.getAttribute("student");
		StudentDAO sdao= new StudentDAOimpl();
		if(req.getParameter("current_password").equals(s.getPassword())) {
			if(req.getParameter("new_password").equals(req.getParameter("confirm_password"))) {
				s.setPassword(req.getParameter("new_password"));
				sdao.updateStudent(s);
				req.setAttribute("success", "Password changed successfully");
				RequestDispatcher rd= req.getRequestDispatcher("dashboard.jsp");
				rd.forward(req, resp);
			}else {
				req.setAttribute("error", "new password mismatch");
				RequestDispatcher rd= req.getRequestDispatcher("reset.jsp");
				rd.forward(req, resp);
			}
		}else {
			req.setAttribute("error", "current password mismatch");
			RequestDispatcher rd= req.getRequestDispatcher("reset.jsp");
			rd.forward(req, resp);
		}
	}
}
