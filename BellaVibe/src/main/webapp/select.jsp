<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Store"%>
<%@ page import="model.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>商品を選択</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&family=Pacifico&display=swap" rel="stylesheet">
</head>
<body>

<jsp:include page="header-navi.jsp" />

<div class="container">

<%
Store store = (Store) session.getAttribute("store");
List<Product> listProd = (store != null) ? store.getListProd() : new ArrayList<Product>();

if (!listProd.isEmpty()) {

    String[] carouselImages = {"image/beauty1.jpeg","image/beauty2.avif","image/beauty3.avif","image/beauty4.jpg",
                               "image/beauty5.jpg","image/beauty6.jpg"};
    String[] carouselTexts = {
        "2020年: BellaVibeは自信とセルフケアを高める高品質な美容アイテムを提供するために誕生しました。",
        "2021年: 自然由来成分を使用した大人気『Viral Glow セラム』を発売し、多くの人々に支持されました。",
        "2022年: 国際展開を開始し、革新的なスキンケア商品を世界中に届けました。",
        "2023年: 商品品質、顧客満足度、サステナビリティで数々の賞を受賞しました。",
        "2024年: 最先端科学と天然成分を融合したオーガニックラインを発表しました。",
        "2025年: 効果、贅沢さ、環境配慮を兼ね備えた美容イノベーションの世界的リーダーとして認められました。"
    };
%>

<!-- Carousel -->
<div class="product-carousel-container">
    <div class="carousel-text">
        <% for (int i=0;i<carouselTexts.length;i++){ %>
            <p class="carousel-desc <%= (i==0?"active":"") %>"><%=carouselTexts[i]%></p>
        <% } %>
    </div>
    <div class="product-carousel">
        <% for(int i=0;i<carouselImages.length;i++){ %>
            <img src="<%=request.getContextPath() + "/" + carouselImages[i]%>" class="<%= (i==0?"active":"") %>">
        <% } %>
    </div>
</div>

<div class="intro-text">BellaVibeの人気商品「Viral Glow」</div>

<!-- Diamond grid -->
<div class="diamond-grid-wrap">
<div class="diamond-grid">
<% for(int idx=0; idx<listProd.size(); idx++){
        Product prod = listProd.get(idx);
        String imgPath = (prod.getImage()!=null)? request.getContextPath() + "/" + prod.getImage() : request.getContextPath() + "/image/default.jpg";
%>
    <div class="diamond-card">
        <div class="diamond-inner">
            <div class="prod-image">
                <img src="<%=imgPath%>" alt="<%=prod.getName()%>" width="200">
            </div>
            <div class="prod-info">
                <div class="prod-name"><%=prod.getName()%></div>
                <div class="prod-price"><%=prod.getPriceString()%></div>
                <form class="select-form">
                    <input type="hidden" name="idx" value="<%=idx%>">
                    <button type="button" class="select-btn" onclick="addToCart(<%=idx%>)">カートに追加</button>
                </form>
            </div>
        </div>
    </div>
<% } %>
</div>
</div>

<% } else { %>
<div class="intro-text">現在、商品はありません。</div>
<% } %>

</div>

<script>
// Carousel functionality
let currentIndex = 0;
const images = document.querySelectorAll(".product-carousel img");
const texts = document.querySelectorAll(".carousel-text .carousel-desc");

function showNext() {
    images[currentIndex].classList.remove("active");
    texts[currentIndex].classList.remove("active");
    currentIndex = (currentIndex + 1) % images.length;
    images[currentIndex].classList.add("active");
    texts[currentIndex].classList.add("active");
}
setInterval(showNext,5000);

// Toast notification setup
const toast = document.createElement("div");
toast.id = "toast";
toast.style.position = "fixed";
toast.style.bottom = "30px";
toast.style.right = "30px";
toast.style.padding = "15px 25px";
toast.style.background = "linear-gradient(180deg, #ff85a2, #ff5c7a)";
toast.style.color = "#fff";
toast.style.fontWeight = "600";
toast.style.borderRadius = "12px";
toast.style.boxShadow = "0 6px 15px rgba(0,0,0,0.3)";
toast.style.opacity = "0";
toast.style.transition = "opacity 0.5s, transform 0.5s";
toast.style.zIndex = "999";
toast.innerText = "カートに追加しました!";
document.body.appendChild(toast);

function showToast(){
    toast.style.opacity = "1";
    toast.style.transform = "translateY(-10px)";
    setTimeout(()=>{
        toast.style.opacity = "0";
        toast.style.transform = "translateY(0)";
    }, 2000);
}

// Add to Cart function
function addToCart(idx){
    fetch('<%=request.getContextPath()%>/add-prod-servlet',{
        method:'POST',
        headers:{'Content-Type':'application/x-www-form-urlencoded'},
        body:'idx=' + idx
    })
    .then(response => response.json())
    .then(data => {
        const cartCountElem = document.querySelector(".cart-count");
        if(cartCountElem) cartCountElem.textContent = data.count;

        // Show toast notification
        showToast();
    })
    .catch(err => console.error(err));
}
</script>

</body>
</html>
