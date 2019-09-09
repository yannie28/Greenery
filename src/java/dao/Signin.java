package dao;

import model.*;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
//import static org.apache.coyote.http11.Constants.*;
/**
 *
 * @author Arianne
 */
public class Signin extends ActionSupport implements SessionAware {
    private String username;
    private String password;
    private String button;
    private String message;
    private static SessionFactory sessionFactory;
    private static Map<String, Object> sessionMap;
    String result = null; 
    
    public String execute() throws Exception {
        sessionFactory = new Configuration().configure().buildSessionFactory();
        
        switch (button){
            case "login":
                result = login();
        }
        return result;
    }
    
    /*private static Connection connect(){
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
    
    //check if username and password pertains to one user
    public String login(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            List accounts = session.createQuery("FROM UserModel").list();
            
            for (Iterator iterator = accounts.iterator(); iterator.hasNext();){
                UserModel users = (UserModel) iterator.next(); 
                if(username.equals(users.getUsername()) && password.equals(users.getPassword()));
                    return loginStatus();
            }
            
            tx.commit();
            
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace(); 
        }finally {
            session.close(); 
        }
        
        message = "Unable to login. Please try again.";
        return "Failed";
        
                
        //String sql = "SELECT username,password FROM Users_2";
        //String loginStatus;
        //Connection con = connect();

        
        /*try{
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            while(rs.next()){
                if(username.equals(rs.getString("username")) && password.equals(rs.getString("password")))
                    return loginStatus();
            }
            
            rs.close();
            state.close();
            
        }
        catch(Exception ex){
            
        }*/
        

    }
    
    public String loginStatus(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        String status = null;
        String answer = null;
        
        try {
            tx = session.beginTransaction();
            List accounts = session.createQuery("FROM UserModel WHERE username = '" + username + "'").list();
            
            for (Iterator iterator = accounts.iterator(); iterator.hasNext();){
                UserModel users = (UserModel) iterator.next(); 
                    status = users.getStatus();
            }
            
            tx.commit();
            
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace(); 
        }finally {
            session.close(); 
        }
        
        if(status.equals("Active")){
            answer = loginUsertype();
        }else{
            message = "Your account has been deactivated";
            answer = "Inactive";
        }
        
        return answer;
        
        
        /*String sql = "SELECT status FROM Users_2 WHERE username = '" + username + "'";
        Connection con = connect();
        String status = null;
        String answer = null;
        
        try{
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            while(rs.next()){
                status = rs.getString(1);
            }
        }catch(Exception ex){
            
        }
        if(status.equals("Active")){
            answer = loginUsertype();
        }else{
            message = "Your account has been deactivated";
            answer = "Inactive";
        }
        
        return answer;*/
    }
    
    public String loginUsertype(){
        Session session =  sessionFactory.openSession();
        Transaction tx = null;
        String usertype = null;
        //String answer = null;
        
        try {
            tx = session.beginTransaction();
            List accounts = session.createQuery("FROM UserModel WHERE username = '" + username + "'").list();
            
            for (Iterator iterator = accounts.iterator(); iterator.hasNext();){
                UserModel users = (UserModel) iterator.next(); 
                    usertype = users.getUsertype();
            }
            
            tx.commit();
            
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace(); 
        }finally {
            session.close(); 
        }
        
        sessionMap.put("clock", "up");
        sessionMap.put("user", username);
        
        return usertype;
        
        /*String sql = "SELECT usertype FROM Users_2 WHERE username = '" + username + "'";
        Connection con = connect();
        String usertype = null;
        try{
            Statement state = con.createStatement();
            ResultSet rs = state.executeQuery(sql);
            
            while(rs.next()){
                usertype = rs.getString(1);
            }
        }catch(Exception ex){
            
        }
        
        sessionMap.put("clock", "up");
        sessionMap.put("user", username);
        
        return usertype;*/
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

    public String getButton() {
        return button;
    }

    public void setButton(String button) {
        this.button = button;
    }
    
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public void setSession(Map<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }
    
}

