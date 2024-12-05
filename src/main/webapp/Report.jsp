<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="uz.pdp.study_center.entity.Report" %>
<%@ page import="uz.pdp.study_center.Repo.CourserRepo" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        .back-button {
            padding: 12px 24px;
            background-color: #6c757d;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            text-align: center;
            transition: background-color 0.3s ease;
            width: 100px; /* Kenglikni o'zingizga moslashtirishingiz mumkin */
        }

        .back-button:hover {
            background-color: #5a6268;
        }

        .back-button:focus {
            outline: none;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Course Report</h2>
    <table>
        <thead>
        <tr>
            <th>Course Name</th>
            <th>Number of Students</th>
            <th>Total Payment</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Object[]> reportData = CourserRepo.getReport();

            for (Object[] data : reportData) {
                String courseName = (String) data[0];
                Long studentCount = (Long) data[1];
                Object datum = data[2];
        %>
        <tr>
            <td><%= courseName %></td>
            <td><%= studentCount %></td>
            <td><%= datum %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <form action="/Course.jsp" method="post">
        <br>
        <br>
        <button type="submit" class="back-button">COURSE PAGE</button>
    </form>
</div>
</body>
</html>
