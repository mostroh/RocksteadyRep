/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.Usuario;
import SessionBeans.UsuarioFacade;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author YSF
 */
public class SingUpServlet extends HttpServlet {
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
        
        
         // Part file = request.getPart("image");
        //InputStream inputStream = filePart.getInputStream();
        //byte[] av = IOUtils.toByteArray(inputStream);
        
        String password = request.getAttribute("password").toString();
        String confirmpassword = request.getAttribute("confirmPassword").toString();
        if (password.equals(confirmpassword)) {
            String nombreUsuario = request.getAttribute("username").toString();
            Usuario antiguoUsuario = usuarioFacade.getUsuarioByUserName(nombreUsuario);
            if (antiguoUsuario == null) {
                String nombre = request.getAttribute("nombre").toString();
                String apellidos = request.getAttribute("apellido").toString();
                String email = request.getAttribute("email").toString();
                String description = request.getAttribute("descriptionSingUp").toString();
                String twitter = request.getAttribute("twitterSingUp").toString();
                String facebook = request.getAttribute("facebookSingUp").toString();
                String instagram = request.getAttribute("instagramSingUp").toString();
                String linkedin = request.getAttribute("linkedinSingU").toString();
//                
                
                Usuario nuevoUsuario = new Usuario(); // esto es solo de momento
                nuevoUsuario.setUsername(nombreUsuario);
                nuevoUsuario.setName(nombre);
                nuevoUsuario.setLastName(apellidos);
                nuevoUsuario.setEmail(email);
                nuevoUsuario.setPassword(password);
                nuevoUsuario.setDescription(description);
                nuevoUsuario.setTwitter(twitter);
                nuevoUsuario.setFacebook(facebook);
                nuevoUsuario.setInstagram(instagram);
                nuevoUsuario.setLinkedin(linkedin);
                
                usuarioFacade.create(nuevoUsuario);
                
           

            //Redireccionar a la pagina de login y dar mensaje que se ha registrado bien
            //request.getServletContext().getRequestDispatcher("/jsp/loquesea.jsp").forward(request, response);
            } else {
                
            PrintWriter out=response.getWriter();
            out.println("Error, ya existe usuario con ese nombre de usuario.");
                
            // Dar mensaje que ya existe usuario con ese nombre de usuario y redireccionar a mi mismo
            response.sendRedirect("singup.jsp");
            }
        }
        else{
            PrintWriter out=response.getWriter();
            out.println("Error, las contraseñas no son iguales.");
            response.sendRedirect("singup.jsp");
            //las ocntraseñas no coinciden redireccionar a mi mismo
        }

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
