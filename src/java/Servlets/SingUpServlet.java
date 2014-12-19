package Servlets;

import Entities.Usuario;
import SessionBeans.UsuarioFacade;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author inftel13
 */
@MultipartConfig
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
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion = request.getSession();

        int userType = 3;
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmPassword");
        if (password.equals(confirmpassword)) {
            String nombreUsuario = request.getParameter("username");
            Usuario antiguoUsuario = usuarioFacade.getUsuarioByUserName(nombreUsuario);
            if (antiguoUsuario == null) {
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellido");
                String email = request.getParameter("email");
                String description = request.getParameter("descriptionSingUp");
                String twitter = request.getParameter("twitterSingUp");
                String facebook = request.getParameter("facebookSingUp");
                String instagram = request.getParameter("instagramSingUp");
                String linkedin = request.getParameter("linkedinSingUp");
                
                Part filePart = request.getPart("image");
                InputStream f = filePart.getInputStream();
                byte[] perfil = IOUtils.toByteArray(f);
                
                Usuario nuevoUsuario = new Usuario();
                nuevoUsuario.setUserType(BigInteger.valueOf(userType));
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
                nuevoUsuario.setImg(perfil);

                usuarioFacade.create(nuevoUsuario);

                sesion.setAttribute("usuario", nuevoUsuario);            
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/IndexServlet");
                rd.forward(request, response);

            } else {
                request.setAttribute("errorMessage", "This username has already been used");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/IndexServlet");
                rd.forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Passwords do not match");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/IndexServlet");
            rd.forward(request, response);
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
