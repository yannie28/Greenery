package model;
import javax.persistence.*;
import java.io.Serializable;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Arianne
 */
@Entity
@Table(name = "Inventory")
public class InventoryModel implements Serializable{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private String id;
    
    @Column(name = "description")
    private String description;
    
    @Column(name = "category")
    private String category;
    
    @Column(name = "quantity")
    private String quantity;
    
    @Column(name = "price")
    private String price;
    
    @Column(name = "filename")
    private String filename;
    
    @Column(name = "path")
    private String path;
    
    public InventoryModel(){
    
    }

    public InventoryModel(String description, String category, String quantity, String price, String filename, String path) {
        this.description = description;
        this.category = category;
        this.quantity = quantity;
        this.price = price;
        this.filename = filename;
        this.path = path;
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
