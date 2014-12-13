/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SessionBeans;

import Entities.Comentario;
import Entities.Post;
import Entities.Usuario;
import java.util.List;

/**
 *
 * @author EduardROckerse
 */
public class AdminPageHelper {
    private String adminName = "admin name from session";
    private int searchOption;
    private List<Usuario> userList;
    private List<Post> postList;
    private List<Comentario> comentList;

    public AdminPageHelper() {
    }
    
    
    
    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public int getSearchOption() {
        return searchOption;
    }

    public void setSearchOption(int searchOption) {
        this.searchOption = searchOption;
    }

    public List<Usuario> getUserList() {
        return userList;
    }

    public void setUserList(List<Usuario> userList) {
        this.userList = userList;
    }

    public List<Post> getPostList() {
        return postList;
    }

    public void setPostList(List<Post> postList) {
        this.postList = postList;
    }

    public List<Comentario> getComentList() {
        return comentList;
    }

    public void setComentList(List<Comentario> comentList) {
        this.comentList = comentList;
    }
    
    
    
}
