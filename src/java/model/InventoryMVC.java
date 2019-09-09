package model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Arianne
 */
public class InventoryMVC {
    
    private String id;
    private String description;
    private String category;
    private String quantity;
    private String price;
    private String filename;
    private String path;
    
    public InventoryMVC(){
    
    }
    
    public String getId() {
        return id;
    }
    
    public String getDescription() {
        return description;
    }

    public String getCategory() {
        return category;
    }

    public String getQuantity() {
        return quantity;
    }
    
    public String getPrice() {
        return "P" + price;
    }

    public String getFilename() {
        return filename;
    }

    public String getPath() {
        return path;
    }
    
    public void setId(String id) {
        this.id = id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
    
    public void setPrice(String price) {
        this.price = price;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public void setPath(String path) {
        this.path = path;
    }
    
}
