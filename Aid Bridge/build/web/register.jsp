<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
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

        .register-container { 
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px; 
            margin-top: 30px;
            box-sizing: border-box;
        }

        .register-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
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
        .form-group input[type="email"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 1em;
        }

        .register-button { 
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

        .register-button:hover {
            background-color: #0056b3;
        }

        .form-links { 
            text-align: center;
            margin-top: 20px;
            font-size: 0.9em;
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

    <div class="register-container">
        <h2>Create Account</h2>

        <% if (request.getParameter("success") != null) { %>
            <p style="color: green; text-align: center;">
                Registration successful! You can now <a href="login.jsp">login</a>.
            </p>
        <% } else if (request.getParameter("error") != null) { %>
            <p style="color: red; text-align: center;">
                Passwords do not match. Please try again.
            </p>
        <% } %>

        <form action="RegisterServlet" method="post"> <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Choose a username" required>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email address" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Create a password" required>
            </div>

            <div class="form-group">
                <label for="confirm-password">Repeat Password</label>
                <input type="password" id="confirm-password" name="confirmPassword" placeholder="Confirm your password" required>
            </div>

            <button type="submit" class="register-button">Register</button>

            <div class="form-links">
                <p>Already have an account? <a href="login.jsp">Login here</a></p>
            </div>
        </form>
    </div>

</body>
</html>
