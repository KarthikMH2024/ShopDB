<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Insert Data into MySQL</title>
</head>
<body>
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the MySQL database
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Cars", "root", "");

            // Retrieve data from request parameters
            String carIdString = request.getParameter("car_id");
            String model = request.getParameter("model");
            String brand = request.getParameter("brand");
            String priceString = request.getParameter("price");

            // Validate input values
            if (carIdString != null && !carIdString.isEmpty() && priceString != null && !priceString.isEmpty()) {
                int carId = Integer.parseInt(carIdString);
                int price = Integer.parseInt(priceString);

                // Prepare SQL statement for insertion
                String sql = "INSERT INTO cars (car_id, model, brand, price) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, carId);
                pstmt.setString(2, model);
                pstmt.setString(3, brand);
                pstmt.setInt(4, price);

                // Execute the SQL statement
                int rowsAffected = pstmt.executeUpdate();
    %>
                <p>Data inserted successfully. Rows affected: <%= rowsAffected %></p>
    <%
            } else {
                out.println("Error: Car ID and Price must be provided.");
            }
        } catch (ClassNotFoundException e) {
            out.println("Error: MySQL JDBC driver not found. Please make sure the MySQL Connector/J JAR file is correctly added to your project's classpath.");
        } catch (SQLException e) {
            out.println("Error: " + e.getMessage());
        } catch (NumberFormatException e) {
            out.println("Error: Invalid data format. Please enter valid numeric values for Car ID and Price.");
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                out.println("Error while closing resources: " + ex.getMessage());
            }
        }
    %>
    <h2>Car Database</h2>
    <table border="1">
        <tr>
            <th>Car ID</th>
            <th>Model</th>
            <th>Brand</th>
            <th>Price</th>
        </tr>
        <% 
            try {
                // Connect to the MySQL database
                conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Cars", "root", "");

                // Retrieve data from the cars table
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM cars");

                // Iterate through the result set and display data in the table
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("car_id") + "</td>");
                    out.println("<td>" + rs.getString("model") + "</td>");
                    out.println("<td>" + rs.getString("brand") + "</td>");
                    out.println("<td>" + rs.getInt("price") + "</td>");
                    out.println("</tr>");
                }
            } catch (SQLException ex) {
                out.println("Error: " + ex.getMessage());
            } finally {
                // Close resources
                try {
                    if (conn != null) conn.close();
                } catch (SQLException ex) {
                    out.println("Error while closing resources: " + ex.getMessage());
                }
            }
        %>
    </table>
</body>
</html>

</html>
