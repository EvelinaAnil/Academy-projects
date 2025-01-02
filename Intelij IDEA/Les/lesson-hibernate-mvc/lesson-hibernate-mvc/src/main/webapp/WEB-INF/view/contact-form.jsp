<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

        form {
            max-width: 400px;
            margin: 0 auto;
        }

        div {
            margin-bottom: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>CONTACT:</h1>
    <form:form action="saveContact" modelAttribute="contact">
        <form:hidden path="id"/>
        <div>
            <form:input path="firstName" placeholder="first name"/>
        </div>
        <div>
            <form:input path="lastName" placeholder="last name"/>
        </div>
        <div>
            <form:input path="phone" placeholder="phone"/>
        </div>
        <input type="submit" value="ok">
    </form:form>
</body>
</html>
