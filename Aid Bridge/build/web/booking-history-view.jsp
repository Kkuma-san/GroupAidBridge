<%@ page import="java.util.*, model.Booking, model.BookingDAO" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking History</title>
    <link rel="stylesheet" href="your-css-file.css"> 
    <style>
        .history-container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }

        .history-container h1 {
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

        .empty-message {
            text-align: center;
            font-size: 1.2em;
            color: #666;
            margin-top: 60px;
        }

        .back-button {
            padding: 8px 14px;
            font-size: 14px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
        }

        .back-button:hover {
            background-color: #0056b3;
        }


        .button-container {
            text-align: center;
            margin-top: 25px;
        }
        
        .receive-button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        .receive-button:hover {
            background-color: #218838;
        }

        .received-text {
            color: #28a745;
            font-weight: bold;
        }
</style>

</head>
<body>

<div class="history-container">
    
    <div class="button-container" style="text-align: left; margin-bottom: 20px;">
            <a class="back-button" href="user-home.jsp">Back</a>
        </div>
    
    <h1>Your Booking History</h1>

    <%
        List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
        if (bookings == null || bookings.isEmpty()) {
    %>
        <p class="empty-message">You haven't booked anything yet.</p>
    <%
        } else {
    %>
        <table>
            <tr>
                <th>Product</th>
                <th>Price (RM)</th>
                <th>Quantity</th>
                <th>Total (RM)</th>
                <th>Address</th>
                <th>Booking Date</th>
                <th>Status </th>
            </tr>

            <% for (Booking b : bookings) { %>
               <tr>
                    <td><%= b.getProductName() %></td>
                    <td>RM <%= String.format("%.2f", b.getPrice()) %></td>
                    <td><%= b.getQuantity() %></td>
                    <td>RM <%= String.format("%.2f", b.getPrice() * b.getQuantity()) %></td>
                    <td><%= b.getAddress() %></td>
                    <td><%= b.getBookingDate() %></td>
                    <td>
                        <% if (!"Received".equalsIgnoreCase(b.getStatus())) { %>
                            <form action="receive-booking" method="post">
                                <input type="hidden" name="bookingDate" value="<%= b.getBookingDate() %>">
                                <button type="submit" class="receive-button">Mark as Received</button>
                            </form>
                        <% } else { %>
                            <span class="received-text">Received</span>
                        <% } %>
                    </td>
                </tr>

            <% } %>
        </table>
    <%
        }
    %>

</div>

</body>
</html>


