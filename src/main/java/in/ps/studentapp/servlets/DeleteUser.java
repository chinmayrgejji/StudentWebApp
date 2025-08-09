package in.ps.studentapp.servlets;

import java.io.IOException;

import in.ps.studentapp.dao.StudentDAO;
import in.ps.studentapp.dao.StudentDAOimpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		StudentDAO sdao=new StudentDAOimpl();
		
		boolean res= sdao.deleteStudent(Integer.parseInt(req.getParameter("id")));
		if(res) {
			req.setAttribute("success", "User Deleted Successfully");
			RequestDispatcher rd= req.getRequestDispatcher("ViewUser.jsp");
			rd.forward(req, resp);
		}else {
			req.setAttribute("error", "Delete failed");
			RequestDispatcher rd= req.getRequestDispatcher("ViewUser.jsp");
			rd.forward(req, resp);
		}
	}
}
