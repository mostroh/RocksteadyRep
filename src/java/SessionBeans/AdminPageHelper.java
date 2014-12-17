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
    private int searchOption;
    private List<Usuario> userList;
    private List<Post> postList;
    private List<Comentario> commentList;

    /**
     *
     */
    public AdminPageHelper() {
    }

    /**
     *
     * @return
     */
    public int getSearchOption() {
        return searchOption;
    }

    /**
     *
     * @param searchOption 
     * 1 = Edit users  
     * 2 = Delete Post 
     * 3 =  Delete Comment
     */
    public void setSearchOption(int searchOption) {
        this.searchOption = searchOption;
    }

    /**
     *
     * @return
     */
    public List<Usuario> getUserList() {
        return userList;
    }

    /**
     *
     * @param userList
     */
    public void setUserList(List<Usuario> userList) {
        this.userList = userList;
    }

    /**
     *
     * @return
     */
    public List<Post> getPostList() {
        return postList;
    }

    /**
     *
     * @param postList
     */
    public void setPostList(List<Post> postList) {
        this.postList = postList;
    }

    /**
     *
     * @return
     */
    public List<Comentario> getCommentList() {
        return commentList;
    }

    /**
     *
     * @param comentList
     */
    public void setCommentList(List<Comentario> comentList) {
        this.commentList = comentList;
    } 
    
}
