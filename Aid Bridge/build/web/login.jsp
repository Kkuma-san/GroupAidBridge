<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100%;
            background-color: #e0f0ff; 
            display: flex;
            flex-direction: column; 
            align-items: center; 
        }

        .top-bar {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: rgba(255, 255, 255, 0.8);  
            box-sizing: border-box; 
        }

        .logo-container {
            width: 70px; 
            height: 70px; 
            border-radius: 50%;
            overflow: hidden;
            border: 2px solid #007bff; 
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #fff;
        }

        #logo {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
        }

        .home-link a {
            text-decoration: none;
        }

        .home-icon {
            width: 30px; 
            height: 30px;
        }

        .login-container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px; 
            margin-top: 30px; 
            box-sizing: border-box;
        }

        .login-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 10px; 
        }

        .user-type-selection {
            display: flex;
            justify-content: center;
            margin-bottom: 25px; 
            font-size: 0.95em;
        }

        .user-type-selection label {
            margin: 0 15px; 
            cursor: pointer;
            display: flex;
            align-items: center;
        }

        .user-type-selection input[type="radio"] {
            margin-right: 8px;
            accent-color: #007bff; 
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
            font-size: 0.9em;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 1em;
        }

        .login-button {
            background-color: #007bff; 
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            font-weight: bold;
            width: 100%;
            margin-top: 10px; 
        }

        .login-button:hover {
            background-color: #0056b3; 
        }

        .form-links {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            font-size: 0.85em;
        }

        .form-links a {
            color: #007bff;
            text-decoration: none;
        }

        .form-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="top-bar">
        <div class="logo-container">
            <img src="images/logo.png" alt="My Logo" id="logo">
        </div>
        <div class="home-link">
            <a href="main.html">
                <img src="https://img.icons8.com/ios-glyphs/30/000000/home.png" alt="Home" class="home-icon"/>
            </a>
        </div>
    </div>

    <div class="login-container">
        <h2>Login</h2> 
        <% if (request.getParameter("error") != null) { %>
        <p style="color: red; text-align: center;">
            <% if ("1".equals(request.getParameter("error"))) { %>
                Invalid credentials. Try again.
            <% } else { %>
                Server error. Please contact admin.
            <% } %>
        </p>
            <% } %>

        <form action="LoginServlet" method="post"> <div class="user-type-selection">
                <label for="user-type-user">
                    <input type="radio" id="user-type-user" name="userType" value="user" checked> User
                </label>
          
            </div>

            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
			
			<p id="error-message" style="color: red; text-align: center;"></p>

            <button type="submit" class="login-button" onclick="validate()">Login</button>

            <div class="form-links">
                <a href="register.jsp">Register</a> </div>
				
        </form>
    </div>
</body>
</html>