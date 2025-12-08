package model;

import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;

public class Moperation {

    public boolean loginProc(String userId, String password, HttpSession session) {
        if (!authenticate(userId, password))
            return false;

        Store store = makeStore();
        session.setAttribute("store", store);

        Cart cart = new Cart(userId);
        session.setAttribute("cart", cart);

        return true;
    }

    private boolean authenticate(String userId, String password) {
        return "pass".equals(password);
    }

    private Store makeStore() {
        Store store = new Store("BellaVibe", new ArrayList<Product>());

        String[] images = {
            "image/biore.webp", "image/centella.avif", "image/chanel.webp", "image/dior.jpg",
            "image/Fig.jpg", "image/makeupforever.jpg", "image/medicube.jpg",
            "image/mediheal.jpg", "image/rom$nd.jpg", "image/tirtir.avif",
            "image/turmerik.jpg", "image/YvesSaint.jpg"
        };

        String[] names = {
        		"Biore UV Aqua Rich Watery Essence SPF50+/PA++++ 70ml",
        		"SKIN1004 Madagascar Centella Travel Kit 5 Pieces",
        		"Chanel Lèvres Eau Waterfresh",
        		"Dior Addict Lip Maximizer",
        		"Skin Cycling Set",
        		"HD Skin Sculpting Palette",
        		"Medicube PDRN Capsule Cream",
        		"MEDIHEAL Collagen Sheet Mask",
        		"rom&nd Better Zan Palette",
        		"TIRTIR Mask Fit Red Cushion",
        		"Turmeric Glow Combo Set",
        		"YSL Touche Éclat Foundation SPF22"
        };

        for (int i = 0; i < 12; i++) {
            String id = "A" + (110 + i);
            String name = names[i % names.length];
            int price = 5000 + i * 100;
            String img = images[i % images.length];
            store.add(new Product(id, name, price, img));
        }

        return store;
    }

    public void logoutProc(HttpSession session) {
        session.invalidate();
    }

    public void addProd(int idx, HttpSession session) {
        Store store = (Store) session.getAttribute("store");
        Cart cart = (Cart) session.getAttribute("cart");
        if (store != null && cart != null) {
            Product p = store.getListProd().get(idx);
            cart.add(p);
            session.setAttribute("cart", cart);
        }
    }

    public void removeProd(String productId, HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart != null) {
            cart.removeProduct(productId);
            session.setAttribute("cart", cart);
        }
    }


    public void pay(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            session.setAttribute("pay", cart);
            Cart newCart = new Cart(cart.getUserId());
            session.setAttribute("cart", newCart);
        }
    }
}
