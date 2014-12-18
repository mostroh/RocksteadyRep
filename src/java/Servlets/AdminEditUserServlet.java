/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.Usuario;
import SessionBeans.AdminActionPerformedHelper;
import SessionBeans.UsuarioFacade;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author inftel13
 */
@WebServlet(name = "AdminEditUserServlet", urlPatterns = {"/AdminEditUserServlet"})
public class AdminEditUserServlet extends HttpServlet {
    @EJB
    private UsuarioFacade usuarioFacade;

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
        String option = request.getParameter("userEdit").replaceAll("[^a-zA-Z]","");
        int userID = Integer.parseInt(request.getParameter("userEdit").replaceAll("[a-zA-Z]",""));
        AdminActionPerformedHelper adminActionData = new AdminActionPerformedHelper();
        adminActionData.setOption(option);
        
        Usuario u = usuarioFacade.find(new BigDecimal(userID));
        adminActionData.setUsername(u.getUsername());
        switch (option) {
            case "setAdmin":
                u.setUserType(BigInteger.valueOf(1));
                usuarioFacade.edit(u);
                break;
            case "setWriter":
                u.setUserType(BigInteger.valueOf(2));
                usuarioFacade.edit(u);
                break;
            case "setRegistered":
                u.setUserType(BigInteger.valueOf(3));
                usuarioFacade.edit(u);
                break;
            case "deleteUser":
                usuarioFacade.remove(usuarioFacade.find(new BigDecimal(userID)));
                break;
            default:
                //error, no deberiamos llegar nunca aquí.
                break;
        }
        
        request.setAttribute("adminActionData",adminActionData);
        RequestDispatcher rd= getServletContext().getRequestDispatcher("/admin_ok.jsp");
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
