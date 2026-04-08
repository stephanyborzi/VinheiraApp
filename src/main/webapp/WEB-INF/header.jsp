<style>
    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
        font-family: 'Inter', -apple-system, sans-serif;
        background-color: #0b0b0b;
        color: #ffffff;
        line-height: 1.6;
    }

    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 25px 60px;
        background: rgba(0, 0, 0, 0.9);
        position: fixed;
        width: 100%;
        top: 0;
        z-index: 1000;
    }

    .logo {
        text-decoration: none;
        font-size: 22px;
        font-weight: 800;
        letter-spacing: 1px;
        color: #d4af37; /* Dourado */
    }

    .logo span { color: #fff; font-weight: 400; }

    nav a {
        color: #e0e0e0;
        text-decoration: none;
        margin: 0 18px;
        font-size: 13px;
        font-weight: 500;
        transition: color 0.3s;
    }

    nav a:hover { color: #d4af37; }

    .header-icons {
        display: flex;
        gap: 20px;
        font-size: 16px;
    }
</style>

<header>
    <a href="<c:url value='/' />" class="logo">
        Vinheria <span>Agnello</span>
    </a>
    <nav>
        <a href="#">Explorar por momento</a>
        <a href="#">Sua selecao</a>
        <a href="#">Minha adega</a>
        <a href="wine?action=list">Sommelier AI</a>
    </nav>
    <div class="header-icons">
        <i class="fas fa-search"></i>
        <i class="fas fa-user"></i>
        <i class="fas fa-shopping-bag"></i>
    </div>
</header>