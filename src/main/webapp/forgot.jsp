<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot</title>
    <style>
        body {
            font-family: cursive;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #ACB6E5, #74ebd5);
            
        }
        h2 {
            text-align: center;
            color: #333;
        }
        
        form {
        	
            width: 90%;
            max-width: 340px;
            padding: 14px;
            background: linear-gradient(to right, #ada996, #f2f2f2, #dbdbdb, #eaeaea);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
        }
        input[type="number"],
        input[type="text"],
        input[type="password"] {
            padding: 7px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
        }
        .reset-btn,
        .back-btn {
            padding: 10px 15px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
        }
        .reset-btn {
            background-color: #4CAF50; /* Green */
            color: white;
        }
        .back-btn {
            background-color: #f44336; /* Red */
            color: white;
        }
    </style>
</head>
<body>
	<%@ include file="header.jsp" %>
	
    <div style=" display:flex; align-items:center; justify-content:center;">
        <div class="container">
            <h2>Reset your password here</h2>
            <form action="forgot" method="post">
                <label>Enter the Phone number:</label>
                <input type="number" name="phone">
                <label>Enter the Mail ID:</label>
                <input type="text" name="mail">
                <label>Enter the password:</label>
                <input type="password" name="password">
                <label>Confirm the password:</label>
                <input type="password" name="confirmPassword">
                <div class="button-group">
                    <input class="reset-btn" type="submit" value="Reset Password">
                    <a class="back-btn" href="login.jsp">Back</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>