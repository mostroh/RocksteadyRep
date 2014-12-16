/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.Post;
import Entities.Usuario;
import SessionBeans.PostFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.Calendar;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Blackproxy
 */
@WebServlet(name = "NewPostServlet", urlPatterns = {"/NewPostServlet"})
public class NewPostServlet extends HttpServlet {
    @EJB
    private PostFacade postFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String postTitle = (String) request.getParameter("postTitle");
        String postContent = (String) request.getParameter("postContent");
        //Serializable postImage = (Serializable) request.getAttribute("postImage");
        Usuario usuLogueado = (Usuario) request.getSession().getAttribute("usuario");
        String postGps = (String)request.getParameter("postLat")+","+(String)request.getParameter("postLong");
        Post nuevoPost = new Post();
        nuevoPost.setPostDate(Calendar.getInstance().getTime());
        //nuevoPost.setHeaderImage(nuevoPost);
        nuevoPost.setMvpost(Character.MIN_VALUE);
        nuevoPost.setPostedBy(usuLogueado);
        nuevoPost.setPostGps(postGps);
        nuevoPost.setTitle(postTitle);
        nuevoPost.setPostContent(postContent);
        postFacade.create(nuevoPost);
        request.getServletContext().getRequestDispatcher("/PostServlet").forward(request, response);
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
