<%-- 
    Document   : user-list
    Created on : 20 ene 2026, 2:24:43 p.m.
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>

<html>
<head>
    <title>Lista de Usuarios</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Usuarios</h1>
    <a href="users?action=new">Crear Usuario Nuevo</a>
    <br/><br/>
    
    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Role</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<User> users = (List<User>) request.getAttribute("userList");
            if (users != null) {
                for (User u : users) {
        %>
            <tr>
                <td><%= u.getId() %></td>
                <td><%= u.getUserName() %></td>
                <td><%= u.getEmail() %></td>
                <td><%= u.getRole() %></td>
                <td>
                    <a href="users?action=edit&id=<%= u.getId() %>">Editar</a>
                    |
                    <a href="users?action=delete&id=<%= u.getId() %>"
                       onclick="return confirm('¿Desea eliminar este usuario?');">Eliminar</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr><td colspan="5">No hay usuarios registrados.</td></tr>
        <%
            }
        %>
        </tbody>
    </table>

    <br/>
    <a href="index.jsp">Volver al Inicio</a>
</body>
</html>
