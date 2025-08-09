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

@WebServlet("/update")
public class update extends HttpServlet  {
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		StudentDAO sdao=new StudentDAOimpl();
		HttpSession session=req.getSession(false);
		Student s=(Student)session.getAttribute("student");
		if(s!=null) {
			s.setName(req.getParameter("name"));
			s.setPhone(Long.parseLong( req.getParameter("phone")));
			s.setMail(req.getParameter("email"));
			s.setBranch( req.getParameter("branch"));
			s.setLoc( req.getParameter("location"));
			boolean res=sdao.updateStudent(s);
			if(res) {
				req.setAttribute("success",	 "Account updated successfully");
				RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
				rd.forward(req, resp);
			}else {
				req.setAttribute("error",	 "Failed to update ");
				RequestDispatcher rd=req.getRequestDispatcher("update.jsp");
				rd.forward(req, resp);
			}
		}else {
			req.setAttribute("error", "Session Expired");
			RequestDispatcher rd= req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
		
		
	}
}
