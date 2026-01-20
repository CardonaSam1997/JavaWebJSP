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

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= editMode ? "Editar Usuario" : "Crear Usuario" %></title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Opcional: Bootstrap JS + Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white text-center">
                    <h3 class="mb-0"><%= editMode ? "Editar Usuario" : "Crear Usuario" %></h3>
                </div>
                <div class="card-body">
                    <form action="users" method="post">
                        <% if(editMode) { %>
                            <input type="hidden" name="id" value="<%= user.getId() %>"/>
                        <% } %>

                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="username" class="form-control" 
                                   value="<%= editMode ? user.getUserName() : "" %>" required/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" 
                                   value="<%= editMode ? user.getPassword() : "" %>" required/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" 
                                   value="<%= editMode ? user.getEmail() : "" %>" required/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Role</label>
                            <select name="role" class="form-select" required>
                                <% for(Role r : roles) { %>
                                    <option value="<%= r.name() %>" 
                                        <%= editMode && user.getRole() == r ? "selected" : "" %>>
                                        <%= r.name() %>
                                    </option>
                                <% } %>
                            </select>
                        </div>

                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-success">
                                <%= editMode ? "Actualizar" : "Crear" %>
                            </button>
                            <a href="users" class="btn btn-secondary">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>