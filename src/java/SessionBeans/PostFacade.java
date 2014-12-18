/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SessionBeans;

import Entities.Post;
import Entities.Usuario;
import java.math.BigDecimal;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author EduardROckerse
 */
@Stateless
public class PostFacade extends AbstractFacade<Post> {
    @PersistenceContext(unitName = "RocksteadyBlogPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PostFacade() {
        super(Post.class);
    }
    
    public List<Post> getPostsByUser(Usuario u){
        return em.createQuery("SELECT p FROM Post p WHERE p.postedBy = :postedBy")
                .setParameter("postedBy", u)
                .getResultList();
    }
    
    public List <Post> getRecentPost(){
        return em.createQuery("SELECT p FROM Post p ORDER BY p.postDate DESC")
                .setMaxResults(10)
                .getResultList();
    }
    
}
