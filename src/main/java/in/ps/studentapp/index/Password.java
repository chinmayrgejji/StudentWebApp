package in.ps.studentapp.index;

import java.util.Scanner;

import in.ps.studentapp.dao.StudentDAO;
import in.ps.studentapp.dao.StudentDAOimpl;
import in.ps.studentapp.dto.Student;

public class Password {

	public static void reset(Student s) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		StudentDAO sdao = new StudentDAOimpl();
		System.out.println("Enter phone number : ");
		long phone=sc.nextLong();
		System.out.println("Enter mail ID : ");
		String mail = sc.next();
		
		if(s.getPhone()==phone && s.getMail().equals(mail)) {
			System.out.println("Set the new Password");
			String pass=sc.next();
			System.out.println("Confirm new password");
			String confpass=sc.next();
			if(pass.equals(confpass)) {
				s.setPassword(pass);
				boolean res=sdao.updateStudent(s);
				if(res) {
					System.out.println("Password updated Successfully... ");
				}else {
					System.out.println("Failed to update the password..!!!!");
				}
			}else {
				System.out.println("Password mismatch..!!!");
			}
		}else {
			System.out.println("Incorrect phone number or mail ID ...!");
		}
	}

	public static void forgot() {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the phone number : ");
		long phone = sc.nextLong();
		System.out.println("Enter the mail ID : ");
		String mail = sc.next();
		
		StudentDAO sdao = new StudentDAOimpl();
		Student s= sdao.getStudent(phone, mail);
		if(s!=null) {
			System.out.println("Set the new Password");
			String pass=sc.next();
			System.out.println("Confirm new password");
			String confpass=sc.next();
			if(pass.equals(confpass)) {
				s.setPassword(pass);
				boolean res=sdao.updateStudent(s);
				if(res) {
					System.out.println("Password updated Successfully... ");
				}else {
					System.out.println("Failed to update the password..!!!!");
				}
			}else {
				System.out.println("Password mismatch..!!!");
			}
		}
	}

}
