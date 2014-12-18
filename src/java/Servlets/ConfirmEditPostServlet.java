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
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Enumeration;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
@WebServlet(name = "ConfirmEditPostServlet", urlPatterns = {"/ConfirmEditPostServlet"})
public class ConfirmEditPostServlet extends HttpServlet {
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
        
        String postTitle = request.getParameter("editTitle");
                            
        String postContent = request.getParameter("editContent")
                             ;
        String postGps = request.getParameter("editLat")
                            
                            +","+
                            request.getParameter("editLong")
                            ;
        

        
        Post antiguoPost = postFacade.find(new BigDecimal(Integer.parseInt(request.getParameter("postId"))));
        
        //Part filePart = request.getPart("editImage");
        //if(filePart.getSubmittedFileName() !=null || !filePart.getSubmittedFileName().isEmpty()){
        //    InputStream f = filePart.getInputStream();
        //    byte[] img = IOUtils.toByteArray(f);
        //    antiguoPost.setHeaderImage(img);
        //}
        antiguoPost.setPostDate(Calendar.getInstance().getTime());
        antiguoPost.setPostGps(postGps);
        antiguoPost.setTitle(postTitle);
        antiguoPost.setPostContent(postContent);
        postFacade.edit(antiguoPost);
        
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
