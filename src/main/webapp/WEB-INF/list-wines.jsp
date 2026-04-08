<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Vinheria Agnello - Sua Seleção</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        :root {
            --bg-dark: #0b0b0b;
            --card-bg: #1a1a1a;
            --gold: #d4af37;
            --text-gray: #888;
        }

        body {
            background-color: var(--bg-dark);
            color: white;
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 120px 0 0 0;
        }

        .container {
            height: calc(100vh - 86px);
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-header {
            margin-bottom: 40px;
            border-left: 4px solid var(--gold);
            padding-left: 20px;
        }

        .section-header p {
            color: var(--gold);
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 2px;
            margin-bottom: 5px;
        }

        .section-header h2 {
            font-size: 32px;
            font-weight: 500;
        }

        .wine-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
        }

        .wine-card {
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 20px;
            border: 1px solid #333;
            transition: all 0.3s ease;
            position: relative;
        }

        .wine-card:hover {
            transform: translateY(-10px);
            border-color: var(--gold);
            box-shadow: 0 10px 20px rgba(0,0,0,0.5);
        }

        .wine-image-placeholder {
            width: 100%;
            height: 250px;
            background: #252525;
            border-radius: 8px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .wine-image-placeholder img {
            height: 90%;
            object-fit: contain;
        }

        .tag-match {
            background: rgba(212, 175, 55, 0.2);
            color: var(--gold);
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 11px;
            position: absolute;
            top: 20px;
            right: 20px;
            font-weight: bold;
        }

        .wine-info h3 {
            font-size: 20px;
            margin-bottom: 10px;
            font-weight: 600;
            color: #fff;
        }

        .wine-info p {
            color: var(--text-gray);
            font-size: 14px;
            line-height: 1.4;
            height: 40px;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .price-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid #333;
            padding-top: 15px;
        }

        .price {
            font-size: 20px;
            font-weight: bold;
            color: var(--gold);
        }

        .actions {
            display: flex;
            gap: 10px;
        }

        .btn-icon {
            background: transparent;
            color: white;
            border: 1px solid #444;
            width: 38px;
            height: 38px;
            border-radius: 50%;
            cursor: pointer;
            transition: 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-icon:hover {
            border-color: var(--gold);
            color: var(--gold);
            background: rgba(212, 175, 55, 0.1);
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <div class="section-header">
        <p>Baseado no seu perfil</p>
        <h2>Sua Seleção Personalizada</h2>
    </div>

    <div class="wine-grid">
        <c:forEach var="wine" items="${wines}">
            <div class="wine-card">
                <div class="tag-match">MATCH 98%</div>

                <div class="wine-image-placeholder">
                    <img src="https://images.vivino.com/thumbs/006pt89f0j6yk_375x500.jpg" alt="Vinho">
                </div>

                <div class="wine-info">
                    <h3>${wine.name}</h3>
                    <p>${wine.description}</p>
                </div>

                <div class="price-row">
                    <div class="price">R$ ${wine.price}</div>
                    <div class="actions">
                        <button class="btn-icon" title="Favoritar"><i class="fa fa-heart"></i></button>
                        <button class="btn-icon" title="Compartilhar"><i class="fa fa-share-alt"></i></button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <c:if test="${empty wines}">
        <div style="text-align: center; padding: 100px 0;">
            <i class="fa fa-wine-glass-empty" style="font-size: 48px; color: #333; margin-bottom: 20px;"></i>
            <p style="color: var(--text-gray);">Sua adega está vazia no momento.</p>
        </div>
    </c:if>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>