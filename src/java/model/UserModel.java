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
@Table(name = "Users_2")
public class UserModel implements Serializable{
    @Id @GeneratedValue
    @Column(name = "Id")
    private String id;
    
    @Column(name = "LastName")
    private String lastname;
    
    @Column(name = "FirstName")
    private String firstname;
    
    @Column(name = "Username")
    private String username;
    
    @Column(name = "Password")
    private String password;
    
    @Column(name = "UserType")
    private String usertype;
    
    @Column(name = "Status")
    private String status;
    
    public UserModel(){
    
    }

    public UserModel(String id, String lastname, String firstname, String username, String password, String usertype, String status) {
        this.id = id;
        this.lastname = lastname;
        this.firstname = firstname;
        this.username = username;
        this.password = password;
        this.usertype = usertype;
        this.status = status;
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
