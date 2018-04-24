/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import cart.cart;
import database.DB_Conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chirag
 */
@WebServlet(name = "kaufServlet", urlPatterns = {"/kaufServlet"})
public class kaufServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addUserDetalsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addUserDetalsServlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        doPost(request, response);
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
            try {
                
                //processRequest(request, response);
                Connection c = new DB_Conn().getConnection();
                
                Statement st = c.createStatement();
              
                ResultSet rs;
                user User;
                HttpSession session = request.getSession();
                User = (user) session.getAttribute("user");
                String to, username, newOrder, total;
                username = User.getUsername();
                newOrder = request.getParameter("order");
                total = request.getParameter("betrag");
                to = User.getUserEmail();

                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();

                //out.println(" "+username+" "+age+" "+gender+" "+address+" ");
                // UPDATE THE USER DETAILS TABLE AND SESSION and
                // 2. FETCH THE VALUES
                // 3. IF USER FILLED IN DETAILS EARLIER?
                // 4. UPDATE ON EXISTING ONES
                // 5. ELSE INSERT FRESHLY
                 
                String subject="Vielen Dank für Ihren Einkauf bei MyCom24!";
                String msg="Sehr geehrte/r "+username+",\n"
                        + "\n"
                        + "vielen Dank für Ihren Einkauf bei MyCom24!\n"
                        + "Sie haben Vorkasse als Bezahlmethode ausgewählt. Sie können jederzeit die Details Ihrer\n"
                        + "Bestellung sehen, wenn Sie sich Einloggen und unter Ihrem Benutzerprofil nachsehen. \n"
                        + "\n"
                        + "Ihre Bestellnummer / Verwendungszweck: "+newOrder+"\n"
                        + "Geamtbetrag: "+total+"0 Euro\n"
                        + "\n"
                        + "Bankverbindung: \n"
                        + "Nassauische Sparkasse\n"
                        + "IBAN: DE28 5105 0015 0159 0391 22\n"
                        + "BIC: Nassde55xxx\n"
                        + ""
                        + "Bitte geben Sie als Verwendungszweck die Bestell Nr. an und überweisen Sie den Gesamtbetrag innerhalb\n"
                        + " der nächsten 3 Werktage.\n"     
                        + "\n"
                        + "Mit freundlichen Grüßen\n"
                        + "\n"
                        + "Ihr MyCom24 Team\n"
                        + "Email: mycom@hotmail.de\n"
                        + "Lärchen Str.99\n"
                        + "65933 Frankfurt";
                
                
                Mailer.send(to, subject, msg);
                
                
                
                try {
                    //SESSION IS SET EARLIER
                    
                    
                    
                    
                    //No INSERTION EARLIER FRESH Det.
                    
                    
                    
                    out.println ("done!");
                    User.setUserEmail(User.getUserEmail());
                    response.sendRedirect(request.getContextPath()+"/index.jsp");
                    
                    
                    
                    
                } catch (SQLException ex) {
                    Logger.getLogger(addUserDetalsServlet1.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(addUserDetalsServlet1.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                
                
            } catch (SQLException ex) {
            Logger.getLogger(kaufServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(kaufServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
                        
                
                     
    }
} 
           

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    
