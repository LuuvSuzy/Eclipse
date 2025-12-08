package model;

public class Product {
    private String id;
    private String name;
    private int price;
    private String image;

    public Product(String id, String name, int price, String image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public int getPrice() { return price; }
    public String getPriceString() { return String.format("%,d円", price); }
    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
}
