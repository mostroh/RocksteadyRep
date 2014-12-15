/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SessionBeans;

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

    public List getUserByName(String s) {
        return em.createQuery("SELECT u FROM Usuario u WHERE u.username LIKE :userName")
                .setParameter("userName", s)
                .getResultList();
    }

    public List findByNameContaining(String s) {
        return em.createQuery("SELECT u FROM Usuario u WHERE u.username LIKE :userName")
                .setParameter("userName", "%" + s + "%")
                .getResultList();
    }

    public List findByNameBegining(String s) {
        return em.createQuery("SELECT u FROM Usuario u WHERE u.username LIKE :userName")
                .setParameter("userName", s + "%")
                .getResultList();
    }

    public Usuario getUserByNickname(String nick, String password) {

        List<Usuario> usersList = em.createQuery("SELECT u FROM Usuario u WHERE u.username = :nick and u.password = :password")
                .setParameter("nick", nick)
                .setParameter("password", password)
                .getResultList();

        if (usersList != null && usersList.size() > 0) {
            return usersList.get(0);
        } else {
            return null;
        }

    }

}
