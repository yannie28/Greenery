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
public class ModelMVC {
    private String id;
    private String lastname;
    private String firstname;
    private String username;
    private String password;
    private String usertype;
    private String status;
    
    public ModelMVC(){
    
    }
    
    public String getId() {
        return id;
    }
    
    public String getLastname() {
        return lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getUsertype() {
        return usertype;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setId(String id) {
        this.id = id;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
}
