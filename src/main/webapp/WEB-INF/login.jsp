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
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        html, body {
            height: 100%;
        }

        body {
            font-family: 'Inter', -apple-system, sans-serif;
            color: #e8e4dc;
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
        }

        /* Camada 1 — Imagem de fundo (vinhedo) com leve desfoque */
        .bg-image {
            position: fixed;
            inset: -10px;
            background-image: url('<%= request.getContextPath() %>/images/vinho.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            filter: blur(2px);
            z-index: -3;
        }

        /* Camada 2 — Overlay zinc-950/85 (#09090b a 85%) */
        .bg-overlay {
            position: fixed;
            inset: 0;
            background-color: rgba(9, 9, 11, 0.85);
            z-index: -2;
        }

        /* Camada 3 — Brilho radial bordô no centro, escurecendo nas bordas */
        .bg-glow {
            position: fixed;
            inset: 0;
            background: radial-gradient(circle at center,
                        rgba(80, 10, 10, 0.15) 0%,
                        rgba(9, 9, 11, 1) 100%);
            z-index: -1;
        }

        /* Container principal centralizado */
        .login-wrapper {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }

        .login-box {
            position: relative;
            z-index: 10;
            width: 100%;
            max-width: 440px;
            padding: 48px 32px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            background-color: rgba(9, 9, 11, 0.4);
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 2px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            animation: fadeInUp 0.8s ease forwards;
            opacity: 0;
            transform: translateY(20px);
        }

        /* Linha horizontal dourada colada ao topo da box */
        .login-box::before {
            content: '';
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60%;
            height: 1px;
            background: linear-gradient(to right,
                        transparent 0%,
                        rgba(120, 53, 15, 0.6) 50%,
                        transparent 100%);
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Marca */
        .brand {
            width: 100%;
            margin-bottom: 45px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Linha vertical dourada acima de VINHERIA AGNELLO */
        .brand-top-line {
            width: 1px;
            height: 28px;
            background: linear-gradient(to bottom,
                        transparent 0%,
                        rgba(120, 53, 15, 0.6) 100%);
            margin-bottom: 18px;
        }

        .brand-name {
            font-family: 'Cormorant Garamond', 'Playfair Display', serif;
            font-size: 46px;
            font-weight: 500;
            letter-spacing: 4px;
            line-height: 0.95;
            color: #f2ede3;
            text-shadow: 0 2px 20px rgba(0, 0, 0, 0.6);
        }

        .brand-divider {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 16px;
            width: 100%;
            max-width: 240px;
            margin: 22px 0 8px;
        }

        .brand-divider .line {
            flex: 1;
            height: 1px;
        }

        .brand-divider .line-left {
            background: linear-gradient(to right,
                        transparent 0%,
                        rgba(120, 53, 15, 0.6) 100%);
        }

        .brand-divider .line-right {
            background: linear-gradient(to left,
                        transparent 0%,
                        rgba(120, 53, 15, 0.6) 100%);
        }

        .brand-est {
            font-family: 'Inter', sans-serif;
            font-size: 10px;
            letter-spacing: 4px;
            color: rgba(217, 119, 6, 0.8);
            text-transform: uppercase;
            white-space: nowrap;
        }

        .brand-subtitle {
            font-size: 10px;
            letter-spacing: 4px;
            text-transform: uppercase;
            color: #8a8275;
            margin-top: 22px;
            font-weight: 300;
        }

        /* Formulário */
        form {
            width: 100%;
            margin-top: 10px;
        }

        .alert { width: 100%; }
        .forgot-link, .register-link { width: 100%; }

        .form-group {
            margin-bottom: 32px;
            text-align: left;
        }

        label {
            display: block;
            font-size: 9px;
            letter-spacing: 3px;
            text-transform: uppercase;
            color: #8a8275;
            margin-bottom: 12px;
            font-weight: 400;
        }

        input {
            width: 100%;
            background: transparent;
            border: none;
            border-bottom: 1px solid rgba(232, 228, 220, 0.22);
            padding: 6px 0 10px;
            color: #f2ede3;
            font-size: 14px;
            font-family: inherit;
            letter-spacing: 1.5px;
            transition: border-color 0.4s ease;
        }

        input::placeholder {
            color: rgba(232, 228, 220, 0.25);
            letter-spacing: 1px;
        }

        input:focus {
            outline: none;
            border-bottom-color: rgba(212, 175, 55, 0.7);
        }

        input:-webkit-autofill {
            -webkit-text-fill-color: #f2ede3;
            -webkit-box-shadow: 0 0 0 30px transparent inset;
            transition: background-color 5000s ease-in-out 0s;
        }

        /* Botão Sign In */
        .btn-signin {
            width: 100%;
            background: rgba(74, 10, 10, 0.55);
            color: #f2ede3;
            border: 1px solid rgba(212, 175, 55, 0.35);
            padding: 16px;
            font-size: 11px;
            letter-spacing: 5px;
            text-transform: uppercase;
            cursor: pointer;
            margin-top: 15px;
            font-family: inherit;
            font-weight: 500;
            transition: all 0.4s ease;
        }

        .btn-signin:hover {
            background: rgba(110, 18, 18, 0.75);
            border-color: rgba(212, 175, 55, 0.7);
            letter-spacing: 6px;
        }

        /* Links inferiores */
        .forgot-link {
            display: block;
            margin-top: 35px;
            font-size: 9px;
            letter-spacing: 2.5px;
            text-transform: uppercase;
            color: #6e6858;
            text-decoration: none;
            transition: color 0.3s;
        }

        .forgot-link:hover { color: #d4af37; }

        .register-link {
            display: block;
            margin-top: 14px;
            font-size: 9px;
            letter-spacing: 2.5px;
            text-transform: uppercase;
            color: #6e6858;
            text-decoration: none;
            transition: color 0.3s;
        }

        .register-link:hover { color: #d4af37; }

        /* Alertas */
        .alert {
            padding: 11px;
            font-size: 10px;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-bottom: 25px;
            text-align: center;
            border: 1px solid;
        }

        .alert-error {
            background: rgba(74, 10, 10, 0.3);
            border-color: rgba(180, 40, 40, 0.4);
            color: #e8a0a0;
        }

        .alert-success {
            background: rgba(20, 60, 30, 0.3);
            border-color: rgba(80, 160, 90, 0.4);
            color: #a8e0b0;
        }
    </style>
</head>
<body>

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

        <!-- <a href="#" class="forgot-link">Esqueceu sua senha?</a> -->
        <a href="user?action=register" class="register-link">Solicitar acesso</a>
    </div>
</div>

</body>
</html>
