/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.Post;
import SessionBeans.PostDataHelper;
import SessionBeans.PostFacade;
import java.io.IOException;
import java.math.BigDecimal;
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
@WebServlet(name = "EditPostServlet", urlPatterns = {"/EditPostServlet"})
public class EditPostServlet extends HttpServlet {
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
        PostDataHelper pdh = new PostDataHelper();
        request.setCharacterEncoding("UTF-8");
        
        Post postAEditar = postFacade.find(new BigDecimal(Integer.parseInt(request.getParameter("PostToEdit"))));
        String[] latLong= postAEditar.getPostGps().split(",");
        pdh.setP(postAEditar);
        if(latLong.length!=0){
            pdh.setLat(latLong[0].replaceAll("[^-?[0-9]\\d*(\\.\\d+)?]", ""));
            pdh.setLon(latLong[1].replaceAll("[^-?[0-9]\\d*(\\.\\d+)?]", ""));
        }
        else{
            pdh.setLat("");
            pdh.setLon("");
        }
        request.setAttribute("pdh", pdh);
        request.getServletContext().getRequestDispatcher("/editPost.jsp").forward(request, response);
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
