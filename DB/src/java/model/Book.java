package model;



/**
 *
 * @author ADMIN
 */

public class Book {
    private int id;
    private String name;
    private String description;
    private String author;
    private float price;
    private int quantity;
    private String image;
    private int categoryId;

    public Book() {
    }

    public Book(int id, String name, String description, String author, float price, int quantity, String image, int categoryId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.author = author;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.categoryId = categoryId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Book{" + "id=" + id + ", name=" + name + ", description=" + description + ", author=" + author + ", price=" + price + ", quantity=" + quantity + ", image=" + image + ", categoryId=" + categoryId + '}';
    }
    
    
}
