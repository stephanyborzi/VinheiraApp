<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Vinheria Agnello - Gerenciamento</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/css/list-wines.css' />">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <div class="section-header">
        <div>
            <p>Sua Seleção de Vinhos </p>
            <h2>Adega Agnello</h2>
        </div>
        <a href="wine?action=new" class="btn-add">
            <i class="fa fa-plus"></i> Novo Vinho
        </a>
    </div>

    <div class="wine-grid">
        <c:forEach var="wine" items="${wines}">
            <div class="wine-card">
                <div class="wine-image-placeholder">
                    <img src="<c:url value='/images/${wine.image}'/>" alt="${wine.name}">
                </div>
                <div class="wine-info">
                    <h3>${wine.name}</h3>
                    <p style="color: var(--text-gray); font-size: 14px; height: 50px; overflow: hidden;">
                            ${wine.description}
                    </p>
                </div>
                <div class="price-row">
                    <div class="price">R$ ${wine.price}</div>
                    <div class="actions">
                        <a href="wine?action=edit&id=${wine.id}" class="btn-action btn-edit"><i class="fa fa-edit"></i></a>
                        <a href="wine?action=delete&id=${wine.id}" class="btn-action btn-delete" onclick="return confirm('Excluir ${wine.name}?')"><i class="fa fa-trash"></i></a>
                        <a href="cart?action=add&id=${wine.id}" class="btn-action btn-cart" title="Adicionar ao Carrinho"><i class="fa fa-shopping-cart"></i>
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>