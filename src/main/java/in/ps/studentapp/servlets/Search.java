package in.ps.studentapp.servlets;

import java.io.IOException;
import java.util.ArrayList;

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
@WebServlet("/search")
public class Search extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		StudentDAO sdao=new StudentDAOimpl();
		ArrayList<Student> sl=null;
		sl=sdao.getStudent(req.getParameter("user"));
		if(sl!=null) {
			req.setAttribute("sl", sl);
			RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
			rd.forward(req, resp);
		}else {
			req.setAttribute("error1", "No Matches to search!!");
			RequestDispatcher rd= req.getRequestDispatcher("dashboard.jsp");
			rd.forward(req, resp);
		}
	}
}
