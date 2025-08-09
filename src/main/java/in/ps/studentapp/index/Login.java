package in.ps.studentapp.index;

import java.util.ArrayList;
import java.util.Scanner;

import in.ps.studentapp.dao.StudentDAO;
import in.ps.studentapp.dao.StudentDAOimpl;
import in.ps.studentapp.dto.Student;


public class Login {

	public static void login() {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		StudentDAO sdao = new StudentDAOimpl();
		System.out.println("<--Login Page-->");
		System.out.println("Enter the mail ID : ");
		String mail= sc.next();
		System.out.println("Enter the password : ");
		String pass= sc.next();
		Student s = sdao.getStudent(mail, pass);
		if(s!=null) {
			System.out.println("Login successful..!!\nWelcome "+s.getName());
			int choice=0;
			do {
				System.out.println("1. View Data");
				System.out.println("2. Search User");
				System.out.println("3. Update account");
				System.out.println("4. Reset Password");
				System.out.println("5. back to main menu");
				if(s.getId()==1) {
					System.out.println("6. View all users");
					System.out.println("7. Delete the user ");
				}
				choice=sc.nextInt();
				switch(choice) {
				case 1: System.out.println(s);
					break;
				case 2: System.out.println("Enter name to search : ");
					String str=sc.next();
					ArrayList<Student> studentList=sdao.getStudent(str);
					for(Student st: studentList) {
						System.out.println("Student ID  : " + st.getId());
						System.out.println("Name : "+st.getName());
						System.out.println("Branch : "+st.getBranch());
						System.out.println("Location : "+st.getLoc());
					}
					break;
				case 3: Update.update(s);
					break;
				case 4: Password.reset(s);
					break;
				case 5:System.out.println("Going back to main menu ...!!!");
					break;
				case 6:System.out.println("Our Users.....!");
					ArrayList<Student> studentList1=sdao.getStudent();
					for(Student st: studentList1) {
						System.out.println(st);
					}
					break;
				case 7: System.out.println("Enter the ID of the student to be deleted ...");
					boolean b=sdao.deleteStudent(sc.nextInt());
					if(b) {
						System.out.println("Record Deleted successfully...");
					}else {
						System.out.println("Delete Operation failed...");
					}
					break;
				default: System.out.println("Invalid choice !! please try again.....");
				}
			}while(choice!=5);
		}else {
			System.out.println("Failed to login");
		}
	}
}
