<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        h1 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        input[type="button"] {
            background-color: #4caf50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="button"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h1>ALL CONTACTS:</h1>
<table>
    <tr>
        <th>FIRST NAME</th>
        <th>LAST NAME</th>
        <th>PHONE</th>
        <th>OPERATIONS</th>
    </tr>
    <c:forEach var="contact" items="${contacts}">
        <c:url var="deleteButton" value="/deleteContact">
            <c:param name="contactId" value="${contact.id}"/>
        </c:url>
        <c:url var="updateButton" value="/updateContact">
            <c:param name="contactId" value="${contact.id}"/>
        </c:url>
        <tr>
            <td>${contact.firstName}</td>
            <td>${contact.lastName}</td>
            <td>${contact.phone}</td>
            <td>
                <input type="button" value="update" onclick="window.location.href='${updateButton}'"/>
                <input type="button" value="delete" onclick="window.location.href='${deleteButton}'"/>
            </td>
        </tr>
    </c:forEach>
</table>
<input type="button" value="create new" onclick="window.location.href='createContact'"/>
</body>
</html>
