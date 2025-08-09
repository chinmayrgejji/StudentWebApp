<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <style>
        body {
            font-family: cursive;
            margin: 0;
            padding: 0;
        }
        header {
            background: linear-gradient(to right, #03001e, #7303c0, #ec38bc, #0f040cac); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            color: white;
            height: 10vh; /* Set header height to 10% of viewport height */
            min-height: 40px; /* Optional: minimum height for very small screens */
            padding: 0 20px; /* Remove vertical padding for tighter fit */
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        header h1 {
            margin: 0;
            font-size: 1.5em;
            text-align: left;
            color: white;
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
    </style>
</head>
<body>
    <header>
        <h1>Welcome to StudenWebApp</h1>
        <nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#services">Services</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
    </header>
</body>
</html>