package model;

import java.util.ArrayList;
import java.util.Iterator;

public class Cart {
    private String userId;
    private ArrayList<CartItem> items;

    public Cart(String userId) {
        this.userId = userId;
        this.items = new ArrayList<>();
    }

    public String getUserId() { return userId; }
    public ArrayList<CartItem> getItems() { return items; }

    public void add(Product product) {
        for (CartItem item : items) {
            if (item.getProduct().getId().equals(product.getId())) {
                item.incrementQuantity();
                return;
            }
        }
        items.add(new CartItem(product));
    }

    public void removeProduct(String productId) {
        Iterator<CartItem> iter = items.iterator();
        while (iter.hasNext()) {
            CartItem item = iter.next();
            if (item.getProduct().getId().equals(productId)) {
                iter.remove();
                return;
            }
        }
    }

    public void updateQuantity(String productId, int delta) {
        for (CartItem item : items) {
            if (item.getProduct().getId().equals(productId)) {
                int newQty = item.getQuantity() + delta;
                if (newQty <= 0) removeProduct(productId);
                else item.setQuantity(newQty);
                return;
            }
        }
    }

    public int getQuantity(String productId) {
        for (CartItem item : items) {
            if (item.getProduct().getId().equals(productId)) return item.getQuantity();
        }
        return 0;
    }

    public int getTotalItems() {
        int total = 0;
        for (CartItem item : items) total += item.getQuantity();
        return total;
    }

    public int getTotalPrice() {
        int total = 0;
        for (CartItem item : items) total += item.getProduct().getPrice() * item.getQuantity();
        return total;
    }
}
