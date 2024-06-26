<%@ page import="com.demo.Booking" %>
<%@ page import="com.demo.BookingService" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {

        int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
        String customerName = request.getParameter("customerName");
        String email = request.getParameter("email");
        String checkInDateStr = request.getParameter("checkInDate");
        String checkOutDateStr = request.getParameter("checkOutDate");
        String hotel = request.getParameter("hotel");
        String id = request.getParameter("id");
        String status = "Booked";
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date checkInDate = null;
        Date checkOutDate = null;

        if (checkInDateStr != null && checkOutDateStr != null) {
            try {
                java.util.Date checkInDateUtil = dateFormat.parse(checkInDateStr);
                java.util.Date checkOutDateUtil = dateFormat.parse(checkOutDateStr);
                checkInDate = new Date(checkInDateUtil.getTime());
                checkOutDate = new Date(checkOutDateUtil.getTime());
            } catch (Exception e) {
                e.printStackTrace(); // Handle parsing exception as needed
            }
        }

        Booking booking = new Booking(roomNumber, customerName, email, checkInDate, checkOutDate, hotel, id, status);
        BookingService bookingService = new BookingService();
        String message = bookingService.createBooking(booking);
        out.println("<p>" + message + "</p>");
        response.sendRedirect("confirmation.jsp?message=" + message);
    }
%>

<html>
<head>
    <title>Bookings</title>
</head>
<body>
    <h2>Booking Details</h2>
    <form action="" method="post"> <!-- Removed action attribute to submit to the same page -->
        <label for="roomNumber">Room Number:</label>
        <input type="text" id="roomNumber" name="roomNumber" value="<%= request.getParameter("roomNumber") %>">
        <br>
        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName">
        <br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email">
        <br>
        <label for="checkInDate">Check-In Date:</label>
        <input type="date" id="checkInDate" name="checkInDate" pattern="\d{4}-\d{2}-\d{2}">
        <br>
        <label for="checkOutDate">Check-Out Date:</label>
        <input type="date" id="checkOutDate" name="checkOutDate" pattern="\d{4}-\d{2}-\d{2}">
        <br>
        <label for="hotel">Hotel:</label>
        <input type="text" id="hotel" name="hotel" value="<%= request.getParameter("hotel")%>">
        <br>
        <label for="id">Id:</label>
        <input type="text" id="id" name="id">
        <br>
        <button type="submit">Submit Booking</button>
    </form>
</body>
</html>
