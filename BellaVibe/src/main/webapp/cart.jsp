<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="model.Cart"%>
<%@ page import="model.CartItem"%>
<%@ page import="model.Product"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ショッピングカート</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cart.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
    href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&family=Pacifico&display=swap"
    rel="stylesheet">
</head>
<body>
    <jsp:include page="header-navi.jsp" />
    <div class="container">
        <div class="cart-title">ショッピングカート</div>

        <%
        Cart cart = (Cart) session.getAttribute("cart");
        List<CartItem> items = (cart != null) ? cart.getItems() : null;
        int totalQty = (cart != null) ? cart.getTotalItems() : 0;
        int totalPrice = (cart != null) ? cart.getTotalPrice() : 0;
        %>

        <%
        if (items == null || items.isEmpty()) {
        %>
        <div class="empty-cart-container">
            <p class="empty-cart">カート内は空です</p>
            <img src="image/sad.png" alt="カートは空です">
        </div>
        <%
        } else {
        %>
        <div class="cart-table-wrap">
            <table class="cart-list">
                <thead>
                    <tr>
                        <th>商品</th>
                        <th>価格</th>
                        <th>数量</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    for (int i = 0; i < items.size(); i++) {
                        CartItem item = items.get(i);
                        Product prod = item.getProduct();
                    %>
                    <tr>
                        <td class="prod-info-cell">
                            <img src="<%=prod.getImage()%>" alt="<%=prod.getName()%>">
                            <span><%=prod.getName()%></span>
                        </td>
                        <td><%=String.format("¥%,d", prod.getPrice())%></td>
                        <td><%=item.getQuantity()%></td>
                        <td>
                            <form action="remove-prod-servlet" method="post">
                                <input type="hidden" name="productId" value="<%=prod.getId()%>">
                                <button type="submit" class="delete-btn">削除</button>
                            </form>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>

            <div class="cart-summary-box">
                <div class="summary-info">
                    <p>合計数量: <%=totalQty%></p>
                    <p>合計金額: <%=String.format("¥%,d", totalPrice)%></p>
                </div>
                <form action="pay-servlet" method="post">
                    <button type="submit" class="pay-btn">購入手続きへ</button>
                </form>
            </div>
        </div>
        <%
        }
        %>
    </div>

<!-- Toast Styles -->
<style>
#toast {
    position: fixed;
    bottom: 30px;
    right: 30px;
    padding: 15px 25px;
    background: linear-gradient(180deg, #ff85a2, #ff5c7a);
    color: #fff;
    font-weight: 600;
    border-radius: 12px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.3);
    opacity: 0;
    transform: translateY(0);
    transition: opacity 0.5s, transform 0.5s;
    z-index: 999;
}
#toast.show {
    opacity: 1;
    transform: translateY(-10px);
}
</style>

<%
String toastMsg = (String) session.getAttribute("toast");
if (toastMsg != null) {
    session.removeAttribute("toast");
%>
<div id="toast"><%=toastMsg%></div>
<script>
    const toast = document.getElementById("toast");
    toast.classList.add("show");
    setTimeout(() => {
        toast.classList.remove("show");
    }, 2500);
</script>
<%
}
%>

</body>
</html>
