package in.ps.studentapp.index;

import java.util.Scanner;

import in.ps.studentapp.dao.StudentDAO;
import in.ps.studentapp.dao.StudentDAOimpl;
import in.ps.studentapp.dto.Student;

public class Signup {

	public static void signup() {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		StudentDAO sdao = new StudentDAOimpl();
		Student s= new Student();
		
		
		System.out.println("<--Student SignUp-->");
		System.out.println("Enter the Name : ");
		s.setName(sc.next());
		System.out.println("Enter the phone : ");
		s.setPhone(sc.nextLong());
		System.out.println("Enter the Mail ID :");
		s.setMail(sc.next());
		System.out.println("Enter the branch : ");
		s.setBranch(sc.next());
		System.out.println("Enter the location : ");
		s.setLoc(sc.next());
		System.out.println("Enter the password : ");
		String pass=sc.next();
		System.out.println("Confirm password : ");
		String confirmpass= sc.next();
		if(pass.equals(confirmpass)) {
			s.setPassword(pass);
			boolean res = sdao.insertStudent(s);
			if(res) {
				System.out.println("Data added Successfully...!!");
			}else {
				System.out.println("Failed to add data ...!!!");
			}
		}else {
			System.out.println("Password mismatch");
		}
	}
}
