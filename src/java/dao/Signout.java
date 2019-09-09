package dao;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 * <code>Set welcome message.</code>
 */
public class Signout extends ActionSupport implements SessionAware {

    private String button;
    private Map<String, Object> sessionMap;
    
    public String execute() throws Exception {
        
        String result = null;
        
        switch(button){
           case "logout":
               result = logout();
               break;
        }
       
         return result;
    }
    
    //HELPER PARA KAY LOGIN
    public String logout() throws ClassNotFoundException, SQLException{

        sessionMap.remove("user");
        sessionMap.remove("clock");
        
        return "Success"; 
    }
    
    @Override
    public void setSession(Map<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }

    public String getButton() {
        return button;
    }

    public void setButton(String button) {
        this.button = button;
    }
    
}