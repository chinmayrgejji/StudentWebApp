<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
           
        }
        body {
            font-family: cursive;
            height: 100vh;
            margin: 0;
            padding: 0;
           background: linear-gradient(to right, #ACB6E5, #74ebd5);
            
        }
        .container {
        
            height: 85vh;
            width: 90%;
            max-width: 340px;
            padding: 14px;
            margin-top: 20px;
            background: linear-gradient(to right, #EAEAEA, #DBDBDB, #F2F2F2, #ADA996);
            border-radius: 10px;
            box-shadow: 10px rgba(0,0,1,);
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        h1 {
            text-align: center;
            color: #333;
            font-size: 1.3em;
            margin-bottom: 10px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 2px;
            font-size: 0.95em;
        }
        input[type="text"],
        input[type="tel"],
        input[type="email"],
        input[type="password"],
        select {
            padding: 7px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 0.95em;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .login-a {
            text-align: center;
            margin-top: 10px;
            font-size: 0.95em;
        }
        .login-a a {
            color: #007BFF;
            text-decoration: none;
        }
        .login-a a:hover {
            text-decoration: underline;
        }
        input[type="submit"]:focus {
            outline: none;
            box-shadow: 0 0 5px #4CAF50;
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
    <%@ include file="header.jsp" %>
    <%if(request.getAttribute("error")!=null){ %>
	<h3><%= request.getAttribute("error") %></h3>
	<%} %>
    <div style="display: flex; align-items: center; justify-content: center; ">
        <div class="container">
            <h1>SIGNUP</h1>
            <form action="register" method="post">
                <label>Name:</label>
                <input type="text" name="name">
                <label>Phone:</label>
                <input type="tel" name="phone">
                <label>E-mail:</label>
                <input type="email" name="mail">
                <label>Branch:</label>
                <select name="branch" required>
                    <option value=" ">--Select the Branch--</option>
                    <option value="cse">CSE</option>
                    <option value="ece">ECE</option>
                    <option value="civil">CIVIL</option>
                    <option value="mech">MECH</option>
                    <option value="eee">EEE</option>
                </select>
                <label>Location:</label>
                <input type="text" name="loc">
                <label>Password:</label>
                <input type="password" name="password">
                <label>Confirm Password:</label>
                <input type="password" name="confirm">
                <input type="submit" value="Create account">
                <div class="login-a">
                    Already have an account?<a href="login.jsp"> Login</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>