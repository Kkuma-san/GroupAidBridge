<%@ page import="java.util.*, model.Product, model.CartItem" %>
<%@ page session="true" %>

<%
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <link rel="stylesheet" href="your-css-file.css">
    <style>
        .cart-container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }

        .cart-container h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px 16px;
            border-bottom: 1px solid #cce0ff;
            text-align: left;
        }

        th {
            background-color: #e8f4ff;
            color: #007bff;
        }

        .checkout-button {
            display: inline-block;
            padding: 10px 18px;
            background-color: #28a745;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            margin-right: 15px;
            border: none;
            cursor: pointer;
        }

        .checkout-button:hover {
            background-color: #218838;
        }

        .back-button {
            display: inline-block;
            padding: 10px 18px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }

        .back-button:hover {
            background-color: #0056b3;
        }

        .empty-message {
            text-align: center;
            font-size: 1.3em;
            color: #666;
            margin-top: 80px;
        }
        
        #address {
        width: 100%;
        max-width: 100%;
        padding: 12px 14px;
        border: 1px solid #cce0ff;
        border-radius: 6px;
        font-size: 1rem;
        font-family: 'Segoe UI', sans-serif;
        resize: vertical;
        box-shadow: inset 0 1px 2px rgba(0,0,0,0.05);
        transition: border-color 0.3s ease;
    }
    #address:focus {
        border-color: #007bff;
        outline: none;
        box-shadow: 0 0 3px rgba(0,123,255,0.5);
    }

    .address-label {
        font-weight: bold;
        color: #333;
        margin-bottom: 5px;
        display: inline-block;
    }

    </style>
</head>
<body>

<div class="cart-container">
    <h1>Your Shopping Cart</h1>

    <%
        if (cart == null || cart.isEmpty()) {
    %>
        <p class="empty-message">Your cart is currently empty.</p>
        <div style="text-align: center; margin-top: 30px;">
            <a class="back-button" href="user-home.jsp">Back</a>
        </div>
    <%
        } else {
    %>
        <table>
            <tr>
                <th>Product</th>
                <th>Price (RM)</th>
                <th>Quantity</th>
                <th>Total (RM)</th>
                <th>Action</th>
            </tr>


            <%
                for (CartItem item : cart.values()) {
                    Product p = item.getProduct();
            %>
            <tr>
                <td><%= p.getName() %></td>
                <td><%= String.format("%.2f", p.getPrice()) %></td>
                <td><%= item.getQuantity() %></td>
                <td><%= String.format("%.2f", p.getPrice() * item.getQuantity()) %></td>
                <td>
                    <form action="DeleteCartItemServlet" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="<%= p.getId() %>">
                        <button type="submit" class="checkout-button" style="background-color: #dc3545;">Delete</button>
                    </form>
                </td>
            </tr>


            <% } %>
        </table>
        
        <form action="BookingServlet" method="post" style="margin-top: 20px;">
            <label for="address" class="address-label">Delivery Address:</label><br>
            <textarea name="address" id="address" rows="4" required></textarea><br><br>


            <a class="back-button" href="user-home.jsp">Back</a>
            <button type="submit" class="checkout-button">Book Now</button>
        </form>
    <%
        }
    %>
</div>

</body>
</html>






