/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SessionBeans;

import Entities.Usuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author EduardROckerse
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> {
    @PersistenceContext(unitName = "RocksteadyBlogPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }
    
    public List findByNameContaining(String s) {
        return em.createQuery("SELECT u FROM Usuario u WHERE u.username LIKE :userName")
                .setParameter("userName", "%"+s+"%")
                .getResultList();
    }
    
    
    public List findByNameBegining(String s){
        return em.createQuery("SELECT u FROM Usuario u WHERE u.username LIKE :userName")
                .setParameter("userName", s+"%")
                .getResultList();
    }
    
}
