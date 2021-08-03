/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import Object.Current;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author E6440
 */
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Email = request.getParameter("email");
        String Password = request.getParameter("password");
        
        
        request.setAttribute("errMsg","");

        
        //Validate User Information
        try {
            int result = Validate.checkUser(Email, Password);
            
            if (result == 1) {
                request.setAttribute("user",Current.user);
                request.setAttribute("profile",Current.user.getProfile());
                RequestDispatcher rs = request.getRequestDispatcher("userHome.jsp");
                rs.include(request, response);

            } else if (result == 0) {
                request.setAttribute("email", Email);
                request.setAttribute("errMsg", "<div class=\"form-group\"><p id=\"form-pass-mismatch\" style=\"margin-bottom: 10px;\"> Incorrect Cridentials </p></div>");
                RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
                rs.include(request, response);
            } else if (result == -1) {
                request.setAttribute("errMsg", "<div class=\"form-group\"><p id=\"form-pass-mismatch\" style=\"margin: 0 10px 20px 0; display: inline;\"> Email not registered! <div class=\"btn btn-info\" onClick=\"newAccount();\"> Sign Up Now</div> </p></div>");
                RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
                rs.include(request, response);
            }
        } catch (Exception e) {
            RequestDispatcher rd = request.getRequestDispatcher("InvalidInput.html");
            rd.forward(request, response);
            e.printStackTrace();
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
