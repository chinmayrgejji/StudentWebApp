package in.ps.studentapp.index;

import java.util.Scanner;

import in.ps.studentapp.dao.StudentDAO;
import in.ps.studentapp.dao.StudentDAOimpl;
import in.ps.studentapp.dto.Student;

public class Update {

	public static void update(Student s) {
		// TODO Auto-generated method stub
		StudentDAO sdao = new StudentDAOimpl();
		int choice=0;
		Scanner sc = new Scanner(System.in);
		System.out.println("<--Update Account-->");
		do {
			System.out.println("Enter the field to be updated");
			System.out.println("1. Name");
			System.out.println("2. Phone");
			System.out.println("3. Mail");
			System.out.println("4. Branch");
			System.out.println("5. Location");
			System.out.println("6. Go back to dashboard");
			choice=sc.nextInt();
			switch(choice) {
			case 1 : System.out.println("Enter new name :");
				s.setName(sc.next());
				break;
			case 2 :System.out.println("Enter new Phone number : ");
				s.setPhone(sc.nextLong());
				break;
			case 3 :System.out.println("Enter new Mail ID : ");
				s.setMail(sc.next());
				break;
			case 4 :System.out.println("Enter the the updated branch : ");
				s.setMail(sc.next());
				break;
			case 5 : System.out.println("Enter the new location : ");
				s.setLoc(sc.next());
				break;
			case 6 : System.out.println("Dashboard Loading..............");
				break;
			default :System.out.println("Invalid Choice ....     Enter a Valid Choice ........");
			}
			sdao.updateStudent(s);
		} while (choice!=6);
	}

}
