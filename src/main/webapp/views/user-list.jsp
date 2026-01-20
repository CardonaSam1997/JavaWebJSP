<%-- 
    Document   : user-list
    Created on : 20 ene 2026, 2:24:43 p.m.
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuarios</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS + Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Usuarios</h2>
        <a href="users?action=new" class="btn btn-primary">Crear Usuario Nuevo</a>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle">
            <thead class="table-dark text-center">
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
                if (users != null && !users.isEmpty()) {
                    for (User u : users) {
            %>
                <tr class="text-center">
                    <td><%= u.getId() %></td>
                    <td><%= u.getUserName() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getRole() %></td>
                    <td>
                        <a href="users?action=edit&id=<%= u.getId() %>" class="btn btn-sm btn-warning">Editar</a>
                        <a href="users?action=delete&id=<%= u.getId() %>" 
                           onclick="return confirm('¿Desea eliminar este usuario?');"
                           class="btn btn-sm btn-danger">Eliminar</a>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="5" class="text-center">No hay usuarios registrados.</td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="mt-3">
        <a href="index.jsp" class="btn btn-secondary">Volver al Inicio</a>
    </div>
</div>
</body>
</html>