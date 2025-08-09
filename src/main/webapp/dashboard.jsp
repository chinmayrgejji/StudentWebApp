<%@page import="in.ps.studentapp.dao.StudentDAOimpl"%>
<%@page import="in.ps.studentapp.dao.StudentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.ps.studentapp.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        body {
            font-family: cursive;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #ada996, #f2f2f2, #dbdbdb, #eaeaea); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            
        }
        header {
            background: linear-gradient(to right, #03001e, #7303c0, #ec38bc, #0f040cac);
            color: white;
            height: 10vh;
            min-height: 40px;
            padding: 0 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        header h1 {
            margin: 0;
            font-size: 2em;
            white-space: nowrap;
        }
        .header-right {
            display: flex;
            align-items: center;
            gap: 30px;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 20px;
        }
        nav ul li {
            display: inline;
            margin-right: 0;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
        }
        nav ul li a:hover {
            text-decoration: underline;
        }
        .logout-form {
            margin: 0;
        }
        .logout-btn {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        h1.Dashboard {
            /* text-align: center; */
            margin-top: 20px;
            padding: 10px;
            font-size: 2em;
            color: #333;
        }
        .table-container {
            margin: 20px 10px; /* Space around the table: 20px top/bottom, 10px left/right */
           
        }
        table {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            padding: 10px;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
            background-color: #f2f2f2; 
        }
        th {
            background-color: #9e8b8b;
        }
        .search-user {
            margin: 20px 10px; /* Space around the search user section */
            /* text-align: center; */
        }
        .search-user input[type="text"] {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 200px; /* Fixed width for the search input */
        }
        .search-user button.search {
            padding: 10px 20px;
            background-color: #4CAF50; /* Green background for search button */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .search-user button.search:hover {
            background-color: #175d1b; /* Darker green on hover */
        }
        .searched-user-table {
            margin: 20px 10px; /* Space around the searched user table */
        }
        .success{
        	color: green;
        }
        .error{
        	color: red;
        }
        .logout-container {
            margin-left: auto;
            /* Ensures logout button is at the far right */
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
	<%if(session.getAttribute("student")!=null){ %>
		<%Student s=(Student)session.getAttribute("student"); %>
    <header>
        <h1>Welcome <%= s.getName() %></h1>
        <div class="header-right">
            <nav>
                <ul>
                    <%if(s.getId()==1){ %>
                    <li><a href="ViewUser.jsp">View Users </a></li>
                    <%} %>
                    <li><a href="update.jsp">Update Account </a></li>
                    <li><a href="reset.jsp">Reset Password</a></li>
                </ul>
            </nav>
            <form action="logout" method="post" class="logout-form">
                <button class="logout-btn">Logout</button>
            </form>
        </div>
    </header>
	
	<%if(request.getAttribute("success")!=null) {%>
	<h3 class="success"> <%= request.getAttribute("success") %></h3>
	<%} %>
		
    <h1 class="Dashboard">Dashboard </h1>
    <div class="table-container">
        <table>
            <tr>
                <th>id</th>
                <th>name</th>
                <th>phone</th>
                <th>mail</th>
                <th>branch</th>
                <th>loc</th>
            </tr>
            <tr>
                <td><%= s.getId() %></td>
                <td><%= s.getName() %></td>
                <td><%= s.getPhone() %></td>
                <td><%= s.getMail() %></td>
                <td><%= s.getBranch() %></td>
                <td><%= s.getLoc() %></td>
            </tr>
        </table>
    </div>
    <div class="search-user">
        <h1>Search-user</h1>
        <form action="search" method="post">
        	<input type="text" name="user">
        	<button class="search" type="submit">Search</button>
        </form>
    </div>
   <%ArrayList<Student> sl=(ArrayList<Student>)request.getAttribute("sl"); %>
    <div class="searched-user-table">
        <table>
            <tr>
                <th>id</th>
                <th>name</th>
                <th>phone</th>
                <th>mail</th>
                <th>branch</th>
                <th>loc</th>
            </tr>
            <% if (sl != null) { 
                for(Student s1 : sl){ %>
            <tr>
                <td><%= s1.getId() %></td>
                <td><%= s1.getName() %></td>
                <td><%= s1.getPhone() %></td>
                <td><%= s1.getMail() %></td>
                <td><%= s1.getBranch() %></td>
                <td><%= s1.getLoc() %></td>
            </tr>
            <%  } 
            } %>
        </table>
    </div>
    <%if(request.getAttribute("error1")!=null){ %>
    <h3><%= request.getAttribute("error1") %></h3>
    <%} %>
    <%}
	else{
		request.setAttribute("error", "Session Expired");
		RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}
	%>
	
</body>
</html>