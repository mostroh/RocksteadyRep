/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.Post;
import SessionBeans.AdminActionPerformedHelper;
import SessionBeans.PostFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
@WebServlet(name = "AdminNewMVPostServlet", urlPatterns = {"/AdminNewMVPostServlet"})
public class AdminNewMVPostServlet extends HttpServlet {

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
        Post p;
        List<Post> old_mvp;
        old_mvp = postFacade.getMVPost();
        AdminActionPerformedHelper aad = new AdminActionPerformedHelper();
        aad.setOption("mvp");
        if (!old_mvp.isEmpty()) {
            p = old_mvp.get(0);
            p.setMvpost('N');
            postFacade.edit(p);
        }

        p = postFacade.find(new BigDecimal(Integer.parseInt(request.getParameter("postIDtomakeMVP"))));
        if (!isNull(p)) {
            p.setMvpost('Y');
            postFacade.edit(p);
        }
        
        request.setAttribute("adminActionData", aad);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin_ok.jsp");
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