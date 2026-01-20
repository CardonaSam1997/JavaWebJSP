<%-- 
    Document   : user-form
    Created on : 20 ene 2026, 2:22:20 p.m.
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import="model.Role" %>

<%
    User user = (User) request.getAttribute("user");
    Role[] roles = (Role[]) request.getAttribute("roles");
    boolean editMode = (user != null);
%>

<html>
<head>
    <title><%= editMode ? "Editar Usuario" : "Crear Usuario" %></title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1><%= editMode ? "Editar Usuario" : "Crear Usuario" %></h1>

    <form action="users" method="post">
        <% if(editMode) { %>
            <input type="hidden" name="id" value="<%= user.getId() %>"/>
        <% } %>

        <label>Username:</label><br/>
        <input type="text" name="username" value="<%= editMode ? user.getUserName() : "" %>" required/><br/><br/>

        <label>Password:</label><br/>
        <input type="password" name="password" value="<%= editMode ? user.getPassword() : "" %>" required/><br/><br/>

        <label>Email:</label><br/>
        <input type="email" name="email" value="<%= editMode ? user.getEmail() : "" %>" required/><br/><br/>

        <label>Role:</label><br/>
        <select name="role" required>
            <% for(Role r : roles) { %>
                <option value="<%= r.name() %>" 
                    <%= editMode && user.getRole() == r ? "selected" : "" %>>
                    <%= r.name() %>
                </option>
            <% } %>
        </select><br/><br/>

        <input type="submit" value="<%= editMode ? "Actualizar" : "Crear" %>"/>
        <a href="users">Cancelar</a>
    </form>
</body>
</html>
