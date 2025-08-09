<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
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
        header h1 {
            margin: 0;
            font-size: 1.5em;
        }
        .container {
            width: 90%;
            max-width: 340px;
            padding: 14px;
            background: linear-gradient(to right, #ada996, #f2f2f2, #dbdbdb, #eaeaea);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: absolute;
            left: 50%;
            top: calc(10vh + 50px); /* 10vh for header + some space */
            transform: translate(-50%, 0);
        }
        h1.Welcome {
            margin-top: 20px;
            padding: 10px;
            font-size: 2em;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
            font-size: 0.95em;
        }
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
            background-color: #4CAF50;
            color: white;
        }
        .back-btn {
            background-color: #f44336;
            color: white;
        }
        .error{
        	color: red;
        }
        .success{
        	color: green;
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
        <h1>Reset Password</h1>
    </header>
    <div class="container">
        <h1 class="Welcome">Reset Your Password</h1>
        <%if(request.getAttribute("error")!=null){ %>
			<h3 class="error"><%= request.getAttribute("error") %></h3>
		<%} %>
        <form action="reset" method="post">
            <label for="">Current Password</label>
            <input type="password" name="current_password" required>
            <label for="">New Password</label>
            <input type="password" name="new_password" required>
            <label for="">Confirm New Password</label>
            <input type="password" name="confirm_password" required>
            <div class="button-group">
                <input class="reset-btn" type="submit" value="Reset Password">
                <a class="back-btn" href="dashboard.jsp">Back</a>
            </div>
        </form>
    </div>
</body>
</html>