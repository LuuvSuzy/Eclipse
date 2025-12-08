<%@ page pageEncoding="UTF-8"%>
<%@ page import="model.Cart"%>
<%@ page import="model.Store"%>
<%
Store storeHdr = (Store) session.getAttribute("store");
Cart cartHdr = (Cart) session.getAttribute("cart");
String currentLang = (String) session.getAttribute("lang");
if (currentLang == null)
	currentLang = "ja";

// Store/cart объект null бол default текстийг ашиглана
String storeName = (storeHdr != null && storeHdr.getName() != null) ? storeHdr.getName() : "BellaVibe";
%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&family=Pacifico&display=swap"
	rel="stylesheet">

<header class="site-header">
	<div class="header-left">
		<div class="language-dropdown">
			<button class="lang-btn">
				<img src="<%=request.getContextPath()%>/image/globe.svg" width="22"
					alt="Lang"> <span class="current-lang"><%=currentLang.toUpperCase()%></span>
			</button>
			<ul class="lang-menu">
				<li data-lang="en">English</li>
				<li data-lang="ja">日本語</li>
				<li data-lang="ko">한국어</li>
				<li data-lang="zh">中文</li>
				<li data-lang="mn">Монгол</li>
			</ul>
		</div>
	</div>

	<div class="store-name">
		<%=storeName%>
	</div>

	<div class="header-right">
		<nav class="site-nav">
			<a href="select.jsp" class="nav-item"> <img
				src="<%=request.getContextPath()%>/image/user.svg" width="26"
				alt="User">
			</a> <a href="cart.jsp" class="nav-item cart-icon"> <img
				src="<%=request.getContextPath()%>/image/shopping-cart.svg"
				width="26" alt="Cart"> <span class="cart-count"> <%=(cartHdr != null) ? cartHdr.getTotalItems() : 0%>
			</span>
			</a> <a href="logout-servlet" class="nav-item"> <img
				src="<%=request.getContextPath()%>/image/exit.svg" width="26"
				alt="Logout">
			</a>
		</nav>
	</div>
</header>

<script>
window.addEventListener('DOMContentLoaded', () => {
    // Login page-д бүх текстүүдийг орчуулах объект
    const loginTexts = {
        en: { msg1: "Please log in to access this site.", msg2: "Login", user: "Login ID", pass: "Password", submit: "Login" },
        ja: { msg1: "このサイトにアクセスするにはログインしてください。", msg2: "ログイン", user: "ログインID", pass: "パスワード", submit: "ログイン" },
        ko: { msg1: "이 사이트에 접속하려면 로그인하세요.", msg2: "로그인", user: "로그인 ID", pass: "비밀번호", submit: "로그인" },
        zh: { msg1: "请登录以访问此站点。", msg2: "登录", user: "登录ID", pass: "密码", submit: "登录" },
        mn: { msg1: "Энэ сайт руу нэвтрэхийн тулд нэвтэрнэ үү.", msg2: "Нэвтрэх", user: "Нэвтрэх ID", pass: "Нууц үг", submit: "Нэвтрэх" }
    };

    // DOM элементүүд
    const loginMsg1 = document.getElementById("msg1");
    const loginMsg2 = document.getElementById("msg2");
    const userInput = document.getElementById("idInput");
    const passInput = document.getElementById("passInput");
    const submitBtn = document.getElementById("submitBtn");

    function setLoginLanguage(lang){
        const t = loginTexts[lang];
        if(loginMsg1) loginMsg1.textContent = t.msg1;
        if(loginMsg2) loginMsg2.textContent = t.msg2;
        if(userInput) userInput.placeholder = t.user;
        if(passInput) passInput.placeholder = t.pass;
        if(submitBtn) submitBtn.value = t.submit;
    }

    setLoginLanguage("<%=currentLang%>");

    // Header дээрх хэлний сонголт
    const langSelectHeader = document.querySelectorAll(".lang-menu li");
    langSelectHeader.forEach(li => {
        li.addEventListener("click", () => {
            const lang = li.getAttribute("data-lang");
            fetch("<%=request.getContextPath()%>/ChangeLanguageServlet?lang=" + lang)
                .then(response => { 
                    if(response.ok) setLoginLanguage(lang); 
                    document.querySelector(".current-lang").textContent = lang.toUpperCase();
                });
        });
    });

    // Dropdown toggle
    document.querySelector(".lang-btn").addEventListener("click", () => {
        document.querySelector(".language-dropdown").classList.toggle("active");
    });
    document.addEventListener("click", (e) => {
        const dropdown = document.querySelector(".language-dropdown");
        if (!dropdown.contains(e.target)) dropdown.classList.remove("active");
    });
});
</script>
