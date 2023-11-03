/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fall22.pe.model;

/**
 *
 * @author ADMIN
 */
public class tblFoods {
    private String id;
    private String name;
    private String description;
    private float price;
    private int cookingTime;
    private boolean status;

    public tblFoods() {
    }

    public tblFoods(String id, String name, String description, float price, int cookingTime, boolean status) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.cookingTime = cookingTime;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getCookingTime() {
        return cookingTime;
    }

    public void setCookingTime(int cookingTime) {
        this.cookingTime = cookingTime;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "tblFoods{" + "id=" + id + ", name=" + name + ", description=" + description + ", price=" + price + ", cookingTime=" + cookingTime + ", status=" + status + '}';
    }
    
    
}
