/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import loginRegister.*;
import database.DB_Conn;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import helpers.*;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import user.user;

/**
 *
 * @author chirag
 */
public class registerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        String message, messageDetail;
        message = null;
        messageDetail = null;
        String email, pass, passAgain;
        boolean isRegistered = false;

        String messageUrl = "/message.jsp";
        RequestDispatcher dispatchMessage =
                request.getServletContext().getRequestDispatcher(messageUrl);

        email = request.getParameter("email");
        pass = request.getParameter("pass");
        passAgain = request.getParameter("passAgain");
        EmailValidator validator = new EmailValidator();
        boolean isEmailValid = validator.validate(email);

        String ipAdd = request.getRemoteAddr();

        PrintWriter out = response.getWriter();

        HttpSession userSession = request.getSession();

        try {
            DB_Conn con = new DB_Conn();
            Connection c = con.getConnection();
            if ((request.getParameter("email") != null) || (request.getParameter("email") != null)){
                if (isEmailValid) {
                    if (pass.length() > 7) {
                        if (pass.equals(passAgain)) {
                            // then the user is registered and a session is 

                            String sql = "INSERT INTO  `163_mycom`.`user` "
                                    + "(`user_id` ,`email` ,`pass` ,`registeredOn`) "
                                    + "VALUES (NULL ,  ?, SHA1(  ? ) , NOW( )); ";

                            PreparedStatement psmt = c.prepareStatement(sql);

                            psmt.setString(1, email);

                            psmt.setString(2, pass);

                            int i = psmt.executeUpdate();

                            if (i == 1) {
                                isRegistered = true;
                                out.println("You are registered ");
                                user User = new user();
                                User.setUserEmail(email);
                                userSession.setAttribute("user", User);
                                response.sendRedirect("/mycom24/index.jsp");
                            } else {
                                isRegistered = false;
                                out.println("Sie sind nicht registriert!");
                            }

                        } //Else both passwords do not match
                        else {
                            isRegistered = false;
                            message = "Passworter stimmen nicht überein!";
                            messageDetail = "Bitte übereinstimmende Passwörter verwenden!";
                            out.print("Beide Passwörter stimmen nicht!");

                        }
                    } //or the paasword length is less than 7
                    else {
                       isRegistered = false;
                        message = "Passwort muss mindestens 7 Stellig sein!";
                        messageDetail = "Bitte ein 7 stelliges Passwort bestehend aus Buchstaben und Zahlen wählen!";
                        out.print("Passwort ist zu kurz!");
                    }
                } //or email is wrong
                else {
                      isRegistered = false;
                    message = "Emailadresse stimmt nicht!";
                    messageDetail = "Bitte eine gültige Emailadresse angeben!";
                    out.print("Email ungültig!");
                }
            }
            else {
                 isRegistered = false;
                message = "Bitte machen sie eine eingabe!";
                messageDetail = "Bitte geben Sie eine gültige Emailadresse an!";
            }
            
            if (isRegistered == false) {
                request.setAttribute("message", message);
                request.setAttribute("messageDetail", messageDetail);
                dispatchMessage.forward(request, response);
            }

            //try ends here
        } catch (SQLIntegrityConstraintViolationException ex) {
            // user exsts but wrong passwotd ask to CHANGE THE PASSWORD
            messageDetail = ex.getMessage();
            message = "Sie sind bereits registriert! Bitte melden Sie sich an!";
            out.print(" nOT Success!!" + ex);
            request.setAttribute("message", message);
            request.setAttribute("messageDetail", messageDetail);
            dispatchMessage.forward(request, response);
        } catch (Exception ex) {
            messageDetail = ex.getMessage();
            message = "Es gab ein technisches Problem bei der Registrierung, bitteveersuchen Sie es später erneut!";
            out.print(" nOT Success!!" + ex);
            request.setAttribute("message", message);
            request.setAttribute("messageDetail", messageDetail);
            dispatchMessage.forward(request, response);
            response.sendError(404);
        }
    
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
