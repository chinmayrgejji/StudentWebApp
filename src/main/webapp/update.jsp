<%@page import="in.ps.studentapp.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            font-family: cursive;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #ACB6E5, #74ebd5);
        }
        header {
            background: linear-gradient(to right, #03001e, #7303c0, #ec38bc, #0f040cac);
            color: white;
            height: 10vh; /* Set header height to 10% of viewport height */
            /* min-height: 40px; Optional: minimum height for very small screens */
            padding: 0 20px; /* Remove vertical padding for tighter fit */
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        header h1 {
            margin: 0;
            font-size: 1.5em;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        nav ul li {
            display: inline;
            margin-right: 15px;
        }
        nav ul li:last-child {
            margin-right: 0;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
        }
        nav ul li a:hover {
            text-decoration: underline;
        }
        .logout-btn {
            background-color: #f44336; /* Red background for logout button */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        form {
            background: linear-gradient(to right, #EAEAEA, #DBDBDB, #F2F2F2, #ADA996);
            width: 100%;
            max-width: 370px; /* Reduced width */
            min-width: 260px;
            height: auto;
            padding: 28px 18px; /* Reduced padding */
            border-radius: 14px;
            box-shadow: 0 0 14px rgba(0, 0, 0, 0.13);
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        form h1 {
            margin-bottom: 10px;
            text-align: center;
        }
        form p {
            margin-bottom: 20px;
            text-align: center;
        }
        form input {
            margin-bottom: 18px;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            width: 100%;
            font-size: 1em;
            box-sizing: border-box;
        }
        form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        form input[type="submit"]:hover {
            background-color: #45a049;
        }
        .button-group {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            gap: 20px;
            margin-top: 10px;
        }
        .button-group .update,
        .button-group .back {
            flex: 1 1 0;
            max-width: 120px;
            min-width: 80px;
            padding: 8px 0;
            font-size: 1em;
            margin: 0;
            text-align: center;
        }
        .button-group .back {
            display: inline-block;
            text-decoration: none;
            line-height: normal;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh; /* Full viewport height */
        }
        h1.Welcome {
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
            height: auto;
            border-collapse: collapse;
            margin-top: 20px;
            padding: 10px;
            border-radius: 10px;
            overflow: hidden;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;

        }
        .update {
            background-color: #4CAF50; /* Green */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .back {
            background-color: #f44336; /* Red */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
		 .success{
        	color: green;
        }
        .error{
        	color: red;
        }
        label{
        	text-align: left;
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
	<% if (session.getAttribute("student")!=null){ %>
	<%Student s=(Student)session.getAttribute("student"); %>
    <header>
        <h1>Update Data </h1>
        <nav>
            <ul>
                <li><a href="#home">View Data </a></li>
                <li><a href="#profile">Update Account </a></li>
                <li><a href="#settings">Reset Password</a></li>
                <li><button class="logout-btn"><a href="#logout">Logout</a></button></li>
            </ul>
        </nav>
    </header>
    
	<%if(request.getAttribute("error")!=null){ %>
		<h3 class="error"><%= request.getAttribute("error") %></h3>
	<%} %>
	
    <div class="container">
        <form action="update" method="post">
            <h1>Update Account</h1>
            <p>Update your account details below:</p>
            <label>name</label>
            <input type="text" name="name" placeholder="Name" required value="<%= s.getName()%>" >
             <label>phone</label>
            <input type="text" name="phone" placeholder="Phone" required value="<%= s.getPhone() %>">
             <label>mail</label>
            <input type="email" name="email" placeholder="Email" required value="<%= s.getMail()%>">
             <label>branch</label>
            <input type="text" name="branch" placeholder="Branch" required value="<%= s.getBranch() %>">
             <label>location</label>
            <input type="text" name="location" placeholder="Location" required value="<%= s.getLoc()%>">
            
            <div class="button-group">
                <input class="update" type="submit" value="update account">
                <a class="back" href="dashboard.jsp">Back</a>
            </div>
        </form>
    </div>
   <%}else{
	   request.setAttribute("error", "Session Expired");
		RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}
	%>
</body>
</html>