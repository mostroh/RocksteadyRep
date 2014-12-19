/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.Post;
import SessionBeans.PostFacade;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Blackproxy
 */
@WebServlet(name = "PostServlet", urlPatterns = {"/PostServlet"})
public class PostServlet extends HttpServlet {

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
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
        String dateFromStr = request.getParameter("dateFrom");
        String dateToStr = request.getParameter("dateTo");
        Date dateFrom = null;
        Date dateTo = null;
        List<Post> postList = null;
        GregorianCalendar cal = new GregorianCalendar();
        if ((dateFromStr != null) && (dateToStr != null)) {
            if (dateFromStr.equals("")) {
                cal.setTime(new Date(Long.MIN_VALUE));
                dateFrom = cal.getTime();
            }
            else{
                try {
                    dateFrom = formatoDelTexto.parse(dateFromStr);
                } catch (ParseException ex) {
                    Logger.getLogger(PostServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (dateToStr.equals("")) {
                dateTo = Calendar.getInstance().getTime();
            }
            else{
                try {
                    dateTo = formatoDelTexto.parse(dateToStr);
                } catch (ParseException ex) {
                    Logger.getLogger(PostServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            postList = postFacade.getFilteredPost(dateFrom, dateTo);
        } else {
            postList = postFacade.getRecentPost();
        }
        request.setAttribute("postList", postList);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/blog.jsp");
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
