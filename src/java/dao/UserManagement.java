package dao;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import model.*;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;

/**
 * <code>Set welcome message.</code>
 */
public class UserManagement extends ActionSupport implements SessionAware {

    private String button;
    private String delete;
    private String update;
    private Map<String, Object> sessionMap;
    private static SessionFactory sessionFactory;
    private String firstname;
    private String lastname;
    private String username;
    private String password;
    private String message;
    private String usertype;
    private String status;
    private List list;
    private int numberOfUsers;
    private int numberOfAdmins;
    
    public String execute() throws Exception {
        sessionFactory = new Configuration().configure().buildSessionFactory();
        String result = null;
        
        if(delete != null){
            message = "Account successfully deleted!";
            result = delete();
            numberOfUsers();
            numberOfAdmins();
            view();
        }
        else if(update != null){
            result = checkIdUser();
            numberOfUsers();
            numberOfAdmins();
            view();
        }
        else{
            switch(button){
                case "signupFromUser":
                case "signupFromAdmin":
                    result = username();
                    break;
                case "users":
                    numberOfUsers();
                    numberOfAdmins();
                    result = view();
                    break;
                case "viewAccount":
                    result = showSingleRecord();
                    break;
                case "updateAccount":
                    result = checkIdUser();
                    showSingleRecord();
                    break;
            }
        }
       
         return result;
    }
    
    //checker if username and password exist
    public String username(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        String exists = "Success";
        
        try {
            tx = session.beginTransaction();
            List accounts = session.createQuery("FROM UserModel").list();
            
            for (Iterator iterator = accounts.iterator(); iterator.hasNext();){
                UserModel users = (UserModel) iterator.next(); 
                if(username.equals(users.getUsername())){
                    message = "Username already exist";
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
            if(button.equals("signupFromUser"))
                return create();
            else
                return create_admin();
        }
        
        /*String sql = "SELECT username FROM Users_2";
        String exists = "Success";
        Connection con = connect();
        
        try{
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            while(rs.next()){
                if(username.equals(rs.getString("username"))){
                    message = "Username already exist";
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
            if(button.equals("signupFromUser"))
                return create();
            else
                return create_admin();
        }*/
        
        
    }
    
    //checker if username and id exist for update
    public String checkIdUser(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        String exists = "Success";
        
        try {
            tx = session.beginTransaction();
            List accounts = session.createQuery("FROM UserModel").list();
            
            for (Iterator iterator = accounts.iterator(); iterator.hasNext();){
                UserModel users = (UserModel) iterator.next(); 
                if(username.equals(users.getUsername()) && !update.equals(users.getId())){
                    message = "Username already exist";
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
        String sql = "SELECT id,username FROM Users_2";
        
        try{
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            while(rs.next()){
                if(username.equals(rs.getString("username")) && !update.equals(rs.getString("id"))){
                    message = "Username already exist";
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
    
    //viewing single record
    public String showSingleRecord(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        ArrayList<ModelMVC> a = new ArrayList<ModelMVC>();
        ModelMVC record;

        try {
            tx = session.beginTransaction();
            List accounts = session.createQuery("FROM UserModel WHERE Username = '" + sessionMap.get("user") + "'").list();
            
            for (Iterator iterator = accounts.iterator(); iterator.hasNext();){
                UserModel users = (UserModel) iterator.next(); 
                record = new ModelMVC();
                record.setId(users.getId());
                record.setLastname(users.getLastname());
                record.setFirstname(users.getFirstname());
                record.setUsername(users.getUsername());
                record.setPassword(users.getPassword());
                record.setUsertype(users.getUsertype());
                record.setStatus(users.getStatus());
                    
                a.add(record);
            }
            
            tx.commit();
            
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace(); 
        }finally {
            session.close(); 
        }
        
        setList(a);
        return "Success";
        
        /*String sql = "SELECT * FROM Users_2 WHERE Username = '" + sessionMap.get("user") + "'";  
        Connection con = connect();
        ArrayList<ModelMVC> users = new ArrayList<ModelMVC>();
        ModelMVC record;
        //System.out.print(sessionMap.get("user"));
        try{
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            while(rs.next()){
                record = new ModelMVC();
                record.setId(rs.getString(1));
                record.setLastname(rs.getString(2));
                record.setFirstname(rs.getString(3));
                record.setUsername(rs.getString(4));
                record.setPassword(rs.getString(5));
                record.setUsertype(rs.getString(6));
                record.setStatus(rs.getString(7));
                
                users.add(record);
            }
            
            rs.close();
            state.close();
            
        }catch(Exception ex){
            System.out.println("\nEmpty Database");
        }
        setList(users);
        return "Success";*/ 
    }
    
    //update data
    public String update(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            UserModel users = (UserModel) session.get(UserModel.class, update);
            
            users.setLastname(lastname);
            users.setFirstname(firstname);
            users.setUsername(username);
            users.setPassword(password);
            users.setUsertype(usertype);
            users.setStatus(status);

            tx.commit();

        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace(); 
        }finally {
            session.close(); 
        }
                    
        message = "Account successfully updated!";
        return "SuccessUpdate";
        
        /*int i = 0;
        Connection con = connect();
        String sql = "UPDATE Users_2 SET LastName = ?, FirstName = ?, Username = ?, Password = ?, UserType = ?, Status = ? WHERE id =? ;";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            
            //System.out.println(lastname);
            //System.out.print(firstname);
            
            ps.setString(1, lastname);
            ps.setString(2, firstname);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setString(5, usertype);
            ps.setString(6, status);
            ps.setInt(7, Integer.parseInt(update));
            
            i = ps.executeUpdate();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
      
        if(i != 0){
            message = "Account successfully updated!";
            return "SuccessUpdate";
        }
        message = "Cannot be updated!";    
        return "Failed";*/
    }
    
    
    //delete data
    public String delete(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        
        tx = session.beginTransaction();
        UserModel users = (UserModel) session.get(UserModel.class, delete);
        session.delete(users);
        tx.commit();
        
        return "SuccessDelete";
        
        /*String sql = "DELETE FROM Users_2 WHERE Id = ?";
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
    
    //view all data
    public String view(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        ArrayList<ModelMVC> a = new ArrayList<ModelMVC>();
        ModelMVC record;
        List accounts;
        String temp_usertype = null;

        try {
            tx = session.beginTransaction();
            
            List temp = session.createQuery("FROM UserModel WHERE Username = '" + sessionMap.get("user") + "'").list();
            
            for (Iterator iterator = temp.iterator(); iterator.hasNext();){
                UserModel users = (UserModel) iterator.next();
                temp_usertype = users.getUsertype();
            }
            
            
            if(temp_usertype.equals("Main"))
                accounts = session.createQuery("FROM UserModel").list();
            else
                accounts = session.createQuery("FROM UserModel WHERE Usertype = 'Admin' OR Usertype = 'Customer'").list();
            
            for (Iterator iterator = accounts.iterator(); iterator.hasNext();){
                UserModel users = (UserModel) iterator.next(); 
                record = new ModelMVC();
                record.setId(users.getId());
                record.setLastname(users.getLastname());
                record.setFirstname(users.getFirstname());
                record.setUsername(users.getUsername());
                record.setPassword(users.getPassword());
                record.setUsertype(users.getUsertype());
                record.setStatus(users.getStatus());
                    
                a.add(record);
            }
            
            tx.commit();
            
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace(); 
        }finally {
            session.close(); 
        }
        
        setList(a);
        return "Success";
        
        /*String sql = "SELECT * FROM Users_2";
        Connection con = connect();
        ArrayList<ModelMVC> users = new ArrayList<ModelMVC>();
        ModelMVC record;
        try{
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            while(rs.next()){
                record = new ModelMVC();           
                record.setId(rs.getString(1));
                record.setLastname(rs.getString(2));
                record.setFirstname(rs.getString(3));
                record.setUsername(rs.getString(4));
                record.setPassword(rs.getString(5));
                record.setUsertype(rs.getString(6));
                record.setStatus(rs.getString(7));

                users.add(record);
            }
            rs.close();
            state.close();
            
        }catch(Exception ex){
            System.out.println("\nEmpty Database");
        }
        setList(users);
        return "Success";*/
    }
    
    //display number of Users
    public int numberOfUsers(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        int users = 0;
        try {
            tx = session.beginTransaction();
            users = session.createQuery("FROM UserModel").list().size();
            
            tx.commit();
            
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace(); 
        }finally {
            session.close(); 
        }
        
        numberOfUsers = users;
        return numberOfUsers;
        
        /*String sql="SELECT id FROM Users_2";
        Connection con = connect();
        int users = 0;
        try{
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            while(rs.next()){
               users++; 
            }
            
        }catch(Exception ex){
            
        }
        numberOfUsers = users;
        return numberOfUsers;*/
    }
    
    //display number of Admins
    public int numberOfAdmins(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        int admins = 0;
        
        try {
            tx = session.beginTransaction();
            List accounts = session.createQuery("FROM UserModel").list();
            
            for (Iterator iterator = accounts.iterator(); iterator.hasNext();){
                UserModel users = (UserModel) iterator.next();
                if(users.getUsertype().equals("Admin") || users.getUsertype().equals("Main"))
                   admins++; 
            }    
            
            tx.commit();
            
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace(); 
        }finally {
            session.close(); 
        }
        
        /*String sql="SELECT usertype FROM Users_2";
        Connection con = connect();
        int admins = 0;
        try{
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            while(rs.next()){
               if(rs.getString(1).equals("Admin") || rs.getString(1).equals("Main"))
                   admins++; 
            }
            
        }catch(Exception ex){
            
        }*/
        numberOfAdmins = admins;
        return numberOfAdmins;
    }
    
    private static Connection connect(){
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
    }
    
    //create new user admin
    public String create_admin(){
        int i = 0;
        String sql = "INSERT INTO Users_2 (lastname,firstname,username,password,usertype) VALUES (?,?,?,?,?)";
        Connection con = connect();
        
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, lastname);
            ps.setString(2, firstname);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setString(5, usertype);
            
            i = ps.executeUpdate();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        if(i != 0){
            message = "Account successfully created!";
            return "Success";
        }
        else{
            message = "Cannot create account";
            return "Failed";
        }
    }
    
    //create new user customer from user side
    public String create(){
        int i = 0;
        String sql = "INSERT INTO Users_2 (lastname,firstname,username,password) VALUES (?,?,?,?)";
        Connection con = connect();
        
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, lastname);
            ps.setString(2, firstname);
            ps.setString(3, username);
            ps.setString(4, password);
            //ps.setString(5, m.getUsertype());
            
            i = ps.executeUpdate();
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        if(i != 0){
            message = "Account successfully created!";
            return "Success";
        }
        else{
            message = "Cannot create account";
            return "Failed";
        }
    }
    
    @Override
    public void setSession(Map<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }
    
    
    public int getNumberOfUsers() {
        return numberOfUsers;
    }

    public void setNumberOfUsers(int numberOfUsers) {
        this.numberOfUsers = numberOfUsers;
    }

    public int getNumberOfAdmins() {
        return numberOfAdmins;
    }

    public void setNumberOfAdmins(int numberofAdmins) {
        this.numberOfAdmins = numberofAdmins;
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
    
    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
    
    
    
}