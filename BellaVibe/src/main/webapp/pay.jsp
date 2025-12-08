<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Cart, model.CartItem, model.Product, java.util.List, java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>チェックアウト完了</title>
    <link rel="stylesheet" href="css/pay.css">
</head>
<body>
<%@ include file="header-navi.jsp" %>

<div class="container">
    <h1 class="title">チェックアウトが完了しました</h1>
    <p class="subtitle">ご購入いただきありがとうございます！</p>

<%
    // セッションから支払い情報を取得
    Cart payData = (Cart) session.getAttribute("pay");
    List<CartItem> items = (payData != null) ? payData.getItems() : new ArrayList<CartItem>();

    if (!items.isEmpty()) {
%>
    <table class="pay-table">
        <thead>
            <tr>
                <th>画像</th>
                <th>商品ID</th>
                <th>商品名</th>
                <th>価格</th>
                <th>数量</th>
            </tr>
        </thead>
        <tbody>
<%
        for (CartItem item : items) {
            Product prod = item.getProduct();
%>
            <tr>
                <td class="prod-image-cell">
                    <img src="<%= prod.getImage() %>" alt="<%= prod.getName() %>">
                </td>
                <td><%= prod.getId() %></td>
                <td><%= prod.getName() %></td>
                <td><%= String.format("¥%,d", prod.getPrice()) %></td>
                <td><%= item.getQuantity() %></td>
            </tr>
<%
        }
%>
        </tbody>
    </table>

    <div class="total">
        合計金額: <span><%= String.format("¥%,d", payData.getTotalPrice()) %></span>
    </div>

<%
        // セッションから支払い情報を削除
        session.removeAttribute("pay");
    } else {
%>
    <p class="empty-message">このチェックアウトには商品がありません。</p>
<%
    }
%>
</div>
</body>
</html>
