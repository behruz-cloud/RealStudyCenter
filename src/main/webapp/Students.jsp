<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.study_center.entity.Groups" %>
<%@ page import="uz.pdp.study_center.Repo.GroupsRepo" %>
<%@ page import="uz.pdp.study_center.entity.Student" %>
<%@ page import="uz.pdp.study_center.Repo.StudentsRepo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
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

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .module-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .module-card h3 {
            margin: 0;
            font-size: 1.5em;
            color: #333;
        }

        .module-card form button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }

        .module-card form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Students for Group</h1>
    <%
        int groupId = Integer.parseInt(request.getParameter("groupId"));
        Groups group = GroupsRepo.getById(groupId);
        List<Student> studentList = StudentsRepo.getStudentsList(groupId);
        if (studentList != null && !studentList.isEmpty()) {
            for (Student student : studentList) {
    %>
    <div class="module-card">
        <div>
            <h3><%= student.getName() + " ---- " + student.getAmount() + " 000 so'm"%>
            </h3>
        </div>
        <form action="/Payments.jsp" method="post">
            <input type="hidden" name="studentId" value="<%=student.getId()%>">
            <button type="submit">+Add Payment</button>
        </form>
    </div>
    <%
            }
        }
    %>
    <form action="/Groups.jsp" method="post">
        <input type="hidden" name="moduleId" value="<%=group.getModule().getId()%>">
        <button type="submit" class="back-button">BACK</button>
    </form>
</div>
</body>
</html>
