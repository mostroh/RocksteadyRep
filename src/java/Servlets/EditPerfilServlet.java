/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.Usuario;
import static Entities.Usuario_.userType;
import SessionBeans.UsuarioFacade;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigInteger;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author YSF
 */
public class EditPerfilServlet extends HttpServlet {

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
        HttpSession sesion = request.getSession();

        Usuario user = (Usuario) sesion.getAttribute("usuario");

     
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellido");
        String email = request.getParameter("email");
        String description = request.getParameter("descriptionSingUp");
        String twitter = request.getParameter("twitterSingUp");
        String facebook = request.getParameter("facebookSingUp");
        String instagram = request.getParameter("instagramSingUp");
        String linkedin = request.getParameter("linkedinSingU");
        Part filePart = request.getPart("image");
        InputStream f = filePart.getInputStream();
        byte[] perfil = IOUtils.toByteArray(f);

        Usuario nuevoUsuario = new Usuario();
 

        nuevoUsuario.setName(nombre);
        nuevoUsuario.setLastName(apellidos);

        nuevoUsuario.setDescription(description);
        nuevoUsuario.setTwitter(twitter);
        nuevoUsuario.setFacebook(facebook);
        nuevoUsuario.setInstagram(instagram);
        nuevoUsuario.setLinkedin(linkedin);
        nuevoUsuario.setImg(perfil);

        usuarioFacade.create(nuevoUsuario);

        sesion.setAttribute("usuario", nuevoUsuario);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
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
