<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vinheria Agnello — Acesso Reservado</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/css/auth.css' />">
</head>
<body class="auth-login">

<div class="bg-image"></div>
<div class="bg-overlay"></div>
<div class="bg-glow"></div>

<div class="login-wrapper">
    <div class="login-box">
        <div class="brand">
            <div class="brand-top-line"></div>
            <h1 class="brand-name">VINHERIA<br>AGNELLO</h1>
            <div class="brand-divider">
                <div class="line line-left"></div>
                <span class="brand-est">Desde 1985</span>
                <div class="line line-right"></div>
            </div>
            <div class="brand-subtitle">Acesso Reservado</div>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>

        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>

        <form action="user" method="post">
            <input type="hidden" name="action" value="login">

            <div class="form-group">
                <label for="login-email">E-mail</label>
                <input type="email" id="login-email" name="email" required autocomplete="email" placeholder="seu@email.com">
            </div>

            <div class="form-group">
                <label for="login-password">Senha</label>
                <input type="password" id="login-password" name="password" required autocomplete="current-password" placeholder="••••••••">
            </div>

            <button type="submit" class="btn-signin">Entrar</button>
        </form>

        <a href="user?action=register" class="register-link">Solicitar acesso</a>
    </div>
</div>

</body>
</html>
