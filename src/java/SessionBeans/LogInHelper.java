/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SessionBeans;

/**
 *
 * @author inftel13
 */
public class LogInHelper {
    private boolean userexists;
    private boolean wrongpassword;
    
    public LogInHelper(){
        
    }

    public boolean isUserexists() {
        return userexists;
    }

    public void setUserexists(boolean userexists) {
        this.userexists = userexists;
    }

    public boolean isWrongpassword() {
        return wrongpassword;
    }

    public void setWrongpassword(boolean wrongpassword) {
        this.wrongpassword = wrongpassword;
    }
    
    
    
}
