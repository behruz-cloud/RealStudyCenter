<%@ page import="uz.pdp.study_center.Repo.CourserRepo" %>
<%@ page import="uz.pdp.study_center.entity.Course" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
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
            margin-bottom: 30px;
        }

        .course-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s;
        }

        .course-card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .course-card span {
            font-size: 1.2em;
            color: #333;
        }

        .course-card form button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }

        .course-card form button:hover {
            background-color: #0056b3;
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

        @media (max-width: 768px) {
            .course-card {
                flex-direction: column;
                align-items: flex-start;
            }

            .course-card form button {
                width: 100%;
                margin-top: 10px;
            }

        }
    </style>
</head>
<body>

<div class="container">
    <h1>Available Courses</h1>

    <%
        List<Course> coursesList = CourserRepo.getCoursesList();
        if (coursesList != null && !coursesList.isEmpty()) {
            for (Course course : coursesList) {
    %>
    <div class="course-card">
        <span><%= course.getName() %></span>
        <form action="/Module.jsp" method="post">
            <input type="hidden" name="courseId" value="<%=course.getId()%>">
            <button type="submit">View Directions</button>
        </form>
    </div>
    <%
        }
    } else {
    %>
    <p>No courses available.</p>
    <%
        }
    %>
    <form action="/Report.jsp" method="post">
        <button type="submit" class="back-button">REPORT </button>
    </form>

</div>

</body>
</html>
