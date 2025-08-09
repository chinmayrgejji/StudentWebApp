<%@page import="in.ps.studentapp.dto.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.ps.studentapp.dao.StudentDAOimpl"%>
<%@page import="in.ps.studentapp.dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Users</title>
    <style>
        body {
            font-family: cursive;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #ACB6E5, #74ebd5);
            height: 100vh;
            overflow: hidden;
        }
        header {
            background: linear-gradient(to right, #03001e, #7303c0, #ec38bc, #0f040cac);
            color: white;
            height: 10vh;
            min-height: 40px;
            padding: 0 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 10;
        }
        .back-btn {
            background-color: #555;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            margin-left: 20px;
        }
        .container {
            width: 90%;
            max-width: 1100px;
            margin: 0 auto;
            margin-top: calc(10vh + 30px); /* Push below header */
            background: linear-gradient(to right, #ada996, #f2f2f2, #dbdbdb, #eaeaea);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 30px 20px 20px 20px;
            position: relative;
            z-index: 1;
        }
        .container h2 {
            text-align: center;
            font-size: 2em;
            margin-bottom: 20px;
            color: #333;
            font-family: cursive;
        }
        .user-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 0;
            background: transparent;
            border-radius: 10px;
            overflow: hidden;
        }
        .user-table th, .user-table td {
            border: 1px solid #ddd;
            background-color: white;
            padding: 8px;
            text-align: center;
        }
        .user-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .user-table tr:nth-child(even) {
            background-color: #997777;
        }
        .user-table tr:hover {
            background-color: #ddd;
        }
        .user-table button {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 4px;
        }
        .user-table button:hover {
            background-color: #d32f2f;
        }
        .user-table input[type="hidden"] {
            display: none;
        }
        .user-table form {
            display: inline;
        }
        .user-table td {
           
            vertical-align: middle;
            font-size: 14px;
        }
        .success{
        	color: green;
        }
        .error{
        	color:red;
        }
        .back-btn {
            padding: 10px 15px;
            border-radius: 4px;
            color: white;
            border: none;
            cursor: pointer;
            background-color: #f44336; 
            
        }
    </style>
    <script>
        <%if(request.getAttribute("success")!=null){ %>
            alert("<%= request.getAttribute("success") %>");
        <%} %>
        <%if(request.getAttribute("error")!=null){ %>
            alert("<%= request.getAttribute("error") %>");
        <%} %>
    </script>
</head>
<body>
    <header>
        <h1>View Users</h1>
        <button class="back-btn"><a  href="dashboard.jsp">Back</a> </button>
    </header>
    <div class="container">
        <h2>Users</h2>
         <%if(request.getAttribute("success")!=null){ %>
			<h3 class="success"><%= request.getAttribute("success") %></h3>
		<%} %>
		<%if(request.getAttribute("error")!=null){ %>
			<h3 class="error"><%= request.getAttribute("error") %></h3>
		<%} %>
        <table class="user-table">
            <thead>
                <tr>
                    <th>id</th>
                    <th>name</th>
                    <th>phone</th>
                    <th>mail</th>
                    <th>branch</th>
                    <th>loc</th>
                    <th>Delete user</th>
                </tr>
            </thead>
            <%StudentDAO sdao=new StudentDAOimpl(); %>
            <%ArrayList<Student> sl=sdao.getStudent(); %>
            <tbody>
            	<%for(Student s:sl){ %>
                <tr>
                    <td><%= s.getId() %></td>
                    <td><%= s.getName()%></td>
                    <td><%= s.getPhone()%></td>
                    <td><%= s.getMail()%></td>    
                    <td><%= s.getBranch()%></td>
                    <td><%= s.getLoc()%></td>
                    <td>
                        <form action="deleteUser" method="post">
                            <input type="hidden" name="id" value="<%=s.getId()%>">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
    </div>
</body>
</html>