/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SessionBeans;

/**
 *
 * @author EduardROckerse
 */
public class AdminActionPerformedHelper {
    
    private String option;
    private String username;
    private int iDtoEdit;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    
    public AdminActionPerformedHelper(){
        
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public int getiDtoEdit() {
        return iDtoEdit;
    }

    public void setiDtoEdit(int iDtoEdit) {
        this.iDtoEdit = iDtoEdit;
    }

   
    
    
}
