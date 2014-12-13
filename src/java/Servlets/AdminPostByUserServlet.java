/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.Usuario;
import SessionBeans.AdminPageHelper;
import SessionBeans.PostFacade;
import SessionBeans.UsuarioFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import static java.util.Objects.isNull;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author EduardROckerse
 */
@WebServlet(name = "AdminPostByUserServlet", urlPatterns = {"/AdminPostByUserServlet"})
public class AdminPostByUserServlet extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;
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
        AdminPageHelper allData = new AdminPageHelper();
        allData.setSearchOption(2);
        allData.setAdminName("post deleting admin");
        Usuario user;
        List resBusqueda = usuarioFacade.getUserByName(request.getParameter("postsByUserFilter"));
        if(resBusqueda.isEmpty()){
            System.out.println("USER NOT FOUND");
            allData.setPostList(null);
        }else{
            user = (Usuario) resBusqueda.get(0);
            allData.setPostList(postFacade.getPostsByUser(user.getUserId()));
        }
        /*if (user.getUserId().equals(new BigDecimal(0))) {
            System.out.println("USER NOT FOUND");
            allData.setPostList(null);
        } else {
            allData.setPostList(postFacade.getPostsByUser(user.getUserId()));
        }*/
        
        
        request.setAttribute("allData",allData);
        RequestDispatcher rd= getServletContext().getRequestDispatcher("/jsp/admin.jsp");
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
