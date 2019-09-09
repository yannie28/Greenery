package dao;

import model.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;

/**
 * <code>Set welcome message.</code>
 */
public class InventoryAdmin extends ActionSupport implements SessionAware {

    private String button;
    private String delete;
    private String update;
    private Map<String, Object> sessionMap;
    private static SessionFactory sessionFactory;
    private List list;
    private String id;
    private String description;
    private String category;
    private String quantity;
    private String price;
    private String filename;
    private String path;
    private String message;
    
    public String execute() throws Exception {
        sessionFactory = new Configuration().configure().buildSessionFactory();
        String result = null;
        
        if(delete != null){
            message = "Item successfully deleted!";
            result = delete();
            view();
        }
        else if(update != null){
            result = itemIdDescription();
            view();
        }
        else{
            switch(button){
                case "inventory":
                   result = view();
                   break;
                case "create":
                    configImage();
                    result = description();
                    break;
            }
        }
        return result;
    }
    
    //delete data
    public String delete(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        
        tx = session.beginTransaction();
        InventoryModel inventory = (InventoryModel) session.get(InventoryModel.class, delete);
        session.delete(inventory);
        tx.commit();
        
        return "SuccessDelete";
        
        /*String sql = "DELETE FROM Inventory WHERE Id = ?";
        int i = 0;
        Connection con = connect();
        
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(delete));
            i = ps.executeUpdate();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return "SuccessDelete";*/
    }
    
    //view all items
    public String view(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        ArrayList<InventoryMVC> admins = new ArrayList<InventoryMVC>();
        InventoryMVC record;
        
        try {
            tx = session.beginTransaction();
            List a = session.createQuery("FROM InventoryModel").list();
            
            for (Iterator iterator = a.iterator(); iterator.hasNext();){
                InventoryModel items = (InventoryModel) iterator.next(); 
                    record = new InventoryMVC();
                    record.setId(items.getId());
                    record.setDescription(items.getDescription());
                    record.setCategory(items.getCategory());
                    record.setQuantity(items.getQuantity());
                    record.setPrice(items.getPrice());
                    record.setFilename(items.getFilename());
                    
                    admins.add(record);
            }

            tx.commit();
            
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace(); 
        }finally {
            session.close(); 
        }
        
                    
        setList(admins);
        return "Success";
        /*String sql = "SELECT * FROM Inventory";
        Connection con = connect();
        ArrayList<InventoryAdmin> admins = new ArrayList<InventoryAdmin>();
        InventoryAdmin record;
        
        try{
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            while(rs.next()){
                record = new InventoryAdmin();
                record.setId(rs.getString(1));
                record.setDescription(rs.getString(2));
                record.setCategory(rs.getString(3));
                record.setQuantity(rs.getString(4));
                record.setPrice(rs.getString(5));
                record.setFilename(rs.getString(6));
                
                admins.add(record);
            }
            rs.close();
            state.close();
            
        }catch(Exception ex){
            System.out.println("\nEmpty Database");
        }
        setList(admins);
        return "Success";*/
    }
    
    //check if description exist for update
    public String itemIdDescription(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        String exists = "Success";
        
        try {
            tx = session.beginTransaction();
            List a = session.createQuery("FROM InventoryModel").list();
            
            for (Iterator iterator = a.iterator(); iterator.hasNext();){
                InventoryModel items = (InventoryModel) iterator.next(); 
                    if(description.equalsIgnoreCase(items.getDescription()) && !update.equals(items.getId())){
                        message = "Item already exist";
                        exists = "Failed";
                    }
            }
            
            tx.commit();
            
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace(); 
        }finally {
            
            session.close(); 
        }
        
        if(exists.equals("Failed"))
            return exists;
        else{
            return update();
        }
        
        /*String exists = "Success";
        Connection con = connect();
        String sql = "SELECT id,description FROM Inventory";
        try{
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            while(rs.next()){
                if(description.equalsIgnoreCase(rs.getString("description")) && !id.equals(rs.getString("id"))){
                    message = "Item already exist";
                    exists = "Failed";
                }
            }
            rs.close();
            state.close();
        }
        catch(Exception ex){
            
        }
        if(exists.equals("Failed"))
            return exists;
        else{
            return update();
        }*/
    }
    
    public String update(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            InventoryModel inventory = (InventoryModel) session.get(InventoryModel.class, update);
            
            inventory.setDescription(description);
            inventory.setCategory(category);
            inventory.setQuantity(quantity);
            inventory.setFilename(filename);
            
            tx.commit();

        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace(); 
        }finally {
            session.close(); 
        }
                    
        message = "Item successfully updated!";
        return "SuccessUpdate";
        
        /*int i = 0;
        Connection con = connect();
        String sql = "UPDATE Inventory SET description = ?, category = ?, quantity = ?, filename = ? WHERE id =? ;";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, description);
            ps.setString(2, category);
            ps.setString(3, quantity);
            ps.setString(4, filename);
            ps.setInt(5, Integer.parseInt(update));
            
            i = ps.executeUpdate();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        if(i != 0){
            message = "Item successfully updated!";
            return "SuccessUpdate";
        }
        message = "Cannot be updated!";    
        return "Failed";*/
    }
    
    //check if description exits
    public String description(){
        
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        String exists = "Success";
        
        try {
            tx = session.beginTransaction();
            List a = session.createQuery("FROM InventoryModel").list();
            
            for (Iterator iterator = a.iterator(); iterator.hasNext();){
                InventoryModel items = (InventoryModel) iterator.next(); 
                    if(description.equalsIgnoreCase(items.getDescription())){
                        message = "Item already exist";
                        exists = "Failed";
                    }
            }
            
            tx.commit();
            
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace(); 
        }finally {
            session.close(); 
        }
        
        if(exists.equals("Failed"))
            return exists;
        else{
            return create();
        }
        
        /*String sql = "SELECT description FROM Inventory";
        String exists = "Success";
        Connection con = connect();
        
        try{
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            while(rs.next()){
                if(description.equalsIgnoreCase(rs.getString("description"))){
                    message = "Item already exist";
                    exists = "Failed";
                }
            }
            rs.close();
            state.close();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        if(exists.equals("Failed"))
            return exists;
        else{
            return create();
        }*/
    }
    
    /*private Connection connect(){
        Connection conn = null;
        
        try{
            String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            Class.forName(dbDriver);
            
            String dbUrl = "jdbc:sqlserver://localhost:1433;databaseName=ICS114";
            conn = DriverManager.getConnection(dbUrl,"sa","Arianne328");
            
        }catch(Exception ex){
            System.out.print("Unable to connect to database");
        }
        
        return conn;
    }*/
    
    //insert new item
    public String create(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            InventoryModel inventory = new InventoryModel();
            inventory.setDescription(description);
            inventory.setCategory(category);
            inventory.setQuantity(quantity);
            inventory.setPrice(price);
            inventory.setFilename(filename);
            inventory.setPath(path);
            
            session.save(inventory);
            
            tx.commit();
            
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();

        }finally {
            //session.flush();
            session.close(); 
        }
        
        message = "Item successfully added!";
        return "Success";
        
        /*int i = 0;
        String sql = "INSERT INTO Inventory (description,category,quantity,price,filename,path) VALUES (?,?,?,?,?,?)";
        Connection con = connect();
        
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, description);
            ps.setString(2, category);
            ps.setString(3, quantity);
            ps.setString(4, price);
            ps.setString(5, filename);
            ps.setString(6, path);
            
            i = ps.executeUpdate();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        if(i != 0){
            message = "Item successfully added!";
            return "Success";
        }
        else{
            message = "Cannot add a new item";
            return "Failed";
        }*/
    }
    
    //getting the path of the image
    public void configImage(){
        path = "C:\\Users\\Arianne\\Documents\\NetBeansProjects\\ICS114_LabExer5\\web\\items\\" + filename;
    }
    
    @Override
    public void setSession(Map<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public String getButton() {
        return button;
    }

    public void setButton(String button) {
        this.button = button;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getDelete() {
        return delete;
    }

    public void setDelete(String delete) {
        this.delete = delete;
    }

    public String getUpdate() {
        return update;
    }

    public void setUpdate(String update) {
        this.update = update;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    

}