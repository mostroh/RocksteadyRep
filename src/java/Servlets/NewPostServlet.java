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
import java.io.InputStream;
import java.util.Calendar;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Blackproxy
 */
@MultipartConfig
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
        request.setCharacterEncoding("UTF-8");
        String postTitle = request.getParameter("postTitle")
                            .replaceAll("<[^>]*>", "");
        String postContent = request.getParameter("postContent")
                             .replaceAll("<[^>]*>", "");
        Usuario usuLogueado = (Usuario) request.getSession().getAttribute("usuario");
        String postGps = request.getParameter("postLat")
                            .replaceAll("[^-?[0-9]\\d*(\\.\\d+)?]", "")
                            +","+
                            request.getParameter("postLong")
                            .replaceAll("[^-?[0-9]\\d*(\\.\\d+)?]", "");
        
        Post nuevoPost = new Post();
        
        Part filePart = request.getPart("postImage");
        if(filePart.getSubmittedFileName() !=null || !filePart.getSubmittedFileName().isEmpty()){
            InputStream f = filePart.getInputStream();
            byte[] img = IOUtils.toByteArray(f);
            nuevoPost.setHeaderImage(img);
        }
        nuevoPost.setPostDate(Calendar.getInstance().getTime());
        nuevoPost.setMvpost(Character.MIN_VALUE);
        nuevoPost.setPostedBy(usuLogueado);
        nuevoPost.setPostGps(postGps);
        nuevoPost.setTitle(postTitle);
        nuevoPost.setPostContent(postContent);
        postFacade.create(nuevoPost);
        
        RequestDispatcher rd= getServletContext().getRequestDispatcher("/PostServlet");
        rd.forward(request, response); 
        
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
