<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            width: 100%;
            background: linear-gradient(to right, #ACB6E5, #74ebd5);
            font-family: cursive;
        }

        @keyframes popZoom {
            0% {
                transform: scale(0.5);
                opacity: 0;
            }
            60% {
                transform: scale(1.05);
                opacity: 1;
            }
            80% {
                transform: scale(0.98);
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        .container {
            height: 90vh; /* Adjust based on header height */
            display: flex;
            justify-content: center;
            align-items: center;
            animation: popZoom 0.7s cubic-bezier(0.23, 1, 0.32, 1);
        }

        form {
            background: linear-gradient(to right, #EAEAEA, #DBDBDB, #F2F2F2, #ADA996);
            width: 30%;
            height: 60vh;
            padding: 32px 28px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            min-width: 320px;
            max-width: 350px;
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
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
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

        .login-btn {
            text-align: center;
            margin-top: 10px;
            padding: 8px 24px;
            background: #1976d2;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
        }

        .forgot-link {
            font-size: 0.95em;
            color: #1976d2;
        }

        .signup-link {
            text-align: center;
            font-size: 0.98em;
            margin-top: 8px;
        }

        .signup-link a {
            color: #1976d2;
            text-decoration: none;
            font-weight: 500;
        }
        .success{
        	color: green;
        }
        .error{
        	color: red;
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
	
    <div class="container">
        <form action="login" method="post">
            <h1>LOGIN</h1>
            <%if(request.getAttribute("success")!=null){ %>
				<h3 class="success"><%= request.getAttribute("success") %></h3>
			<%} %>
			<%if(request.getAttribute("error")!=null){ %>
				<h3 class="error"><%= request.getAttribute("error") %></h3>
			<%} %>
            <p>MAIL ID</p>
            <input type="text" name="mail">
            <p>PASSWORD</p>
            <input type="password" name="password">
            <div class="button-group">
                <input type="submit" value="Login" class="login-btn">
                <a href="forgot.jsp" class="forgot-link">Forgot password?</a>
            </div>
            <div class="signup-link">
                Don't have an account? <a href="register.jsp">Signup</a>
            </div>
        </form>
    </div>
</body>
</html>
