<%-- 
    Document   : index
    Created on : 20 ene 2026, 2:06:34 p.m.
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenido a MyWebApp</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS + Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- Navbar simple -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">MyWebApp</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="users">Lista de Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="users?action=new">Crear Usuario</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Contenido principal -->
<div class="container mt-5 text-center">
    <div class="card shadow-sm p-4">
        <h1 class="mb-4">Bienvenido a MyWebApp</h1>
        <p class="lead">Gestiona tus usuarios de manera rápida y sencilla.</p>
        <div class="d-flex justify-content-center mt-3">
            <a href="users" class="btn btn-primary btn-lg me-3">Lista de Usuarios</a>
            <a href="users?action=new" class="btn btn-success btn-lg">Crear Usuario</a>
        </div>
    </div>
</div>

</body>
</html>