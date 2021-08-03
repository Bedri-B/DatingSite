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
public class Manage extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        //Clean up
//        request.setAttribute("pass", "");
//        request.setAttribute("npass", "");
//        request.setAttribute("isnew", "");
//        request.setAttribute("errMsg1", "");
//        request.setAttribute("errMsg2", "");
//        request.setAttribute("border1", "");
//        request.setAttribute("border2", "");
//        request.setAttribute("main", "");
//        request.setAttribute("message", "");
//        request.setAttribute("msg", "");
        try {
            if (Current.user == null) {
                request.setAttribute("message", "404 Page not Found");
                request.setAttribute("style", "font-size: 25px; text-align: center;");
                RequestDispatcher rs = request.getRequestDispatcher("Error.jsp");
                rs.include(request, response);
                return;
            }
            if (action.equals("home")) {
                request.setAttribute("user", Current.user);
                request.setAttribute("profile", Current.user.getProfile());
                RequestDispatcher rs = request.getRequestDispatcher("userHome.jsp");
                rs.include(request, response);
            } 
            else if (action.equals("edit")) {
                request.setAttribute("user", Current.user);
                request.setAttribute("profile", Current.user.getProfile());
                RequestDispatcher rs = request.getRequestDispatcher("editProfile.jsp");
                rs.include(request, response);
            } 
            else if (action.equals("editnew")) {
                request.setAttribute("user", Current.user);
                request.setAttribute("profile", Current.user.getProfile());
                request.setAttribute("isnew", "true");
                RequestDispatcher rs = request.getRequestDispatcher("editProfile.jsp");
                rs.include(request, response);
            } 
            else if (action.equals("private")) {
                request.setAttribute("user", Current.user);
                request.setAttribute("profile", Current.user.getProfile());
                RequestDispatcher rs = request.getRequestDispatcher("privateinfo.jsp");
                rs.include(request, response);
            } 
            else if (action.equals("logout")) {
                Current.Logout();
                RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
                rs.include(request, response);

            }
            else if (action.equals("singles")) {
            } 
            else if (action.equals("changepassword")) {
                request.setAttribute("user", Current.user);
                request.setAttribute("profile", Current.user.getProfile());
                RequestDispatcher rs = request.getRequestDispatcher("changepassword.jsp");
                rs.include(request, response);
            } 
            else if (action.equals("changepasswordsubmit")) {
                String oldpass = request.getParameter("oldpass");
                String newpass1 = request.getParameter("newpass1");
                String newpass2 = request.getParameter("newpass2");

                if (Validate.checkPassword(Current.user.getEmail(), oldpass)) {
                    if (newpass1.equals(newpass2)) {
                        Current.user.getDBAccess().changePassword(Current.user.getEmail(), newpass1);
                        Current.Logout();
                        request.setAttribute("msg", "<p style=\"background: #3ee860; padding: 10px; background: \" class=\"btn-info\">Password Changed Successfully!</p>");
                        RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
                        rs.include(request, response);
                    } else {
                        request.setAttribute("user", Current.user);
                        request.setAttribute("profile", Current.user.getProfile());
                        request.setAttribute("errMsg2", "<div class=\"form-group\"><small id=\"form-pass-mismatch\" style=\"margin-bottom: 10px;\"> Password Mismatch </small></div>");
                        request.setAttribute("border2", ".error");
                        request.setAttribute("pass", oldpass);
                        request.setAttribute("npass", newpass1);
                        RequestDispatcher rs = request.getRequestDispatcher("changepassword.jsp");
                        rs.include(request, response);
                    }
                } else {
                    request.setAttribute("user", Current.user);
                    request.setAttribute("profile", Current.user.getProfile());
                    request.setAttribute("errMsg1", "<div class=\"form-group\"><small id=\"form-pass-mismatch\" style=\"margin-bottom: 10px;\"> Incorrect Password </small></div>");
                    request.setAttribute("border1", ".error");
                    RequestDispatcher rs = request.getRequestDispatcher("changepassword.jsp");
                    rs.include(request, response);
                }

            } 
            else if (action.equals("deleteaccount")) {
                request.setAttribute("user", Current.user);
                request.setAttribute("profile", Current.user.getProfile());
                RequestDispatcher rs = request.getRequestDispatcher("deleteaccount.jsp");
                rs.include(request, response);
            } 
            else if (action.equals("deleteaccountsubmit")) {
                String pass1 = request.getParameter("pass1");
                String pass2 = request.getParameter("pass2");

                System.out.println("Delete Account Form");

                if (pass1.equals(pass2)) {
                    if (Validate.checkPassword(Current.user.getEmail(), pass1)) {
                        Current.user.getDBAccess().deleteUserAccount(Current.user.getSSN());
                        Current.Logout();
                        request.setAttribute("msg", "<p style=\"background: #3ee860; padding: 10px; background: \" id=\"msg\" class=\"btn-info\">Account Deleted Successfully!</p>");
                        RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
                        rs.include(request, response);
                    } else {
                        request.setAttribute("user", Current.user);
                        request.setAttribute("profile", Current.user.getProfile());
                        request.setAttribute("errMsg1", "<div class=\"form-group\"><small id=\"form-pass-mismatch\" style=\"margin-bottom: 10px;\"> Incorrect Password </small></div>");
                        request.setAttribute("border1", ".error");
                        request.setAttribute("pass1", pass1);
                        RequestDispatcher rs = request.getRequestDispatcher("deleteaccount.jsp");
                        rs.include(request, response);
                    }
                } else {
                    request.setAttribute("user", Current.user);
                    request.setAttribute("profile", Current.user.getProfile());
                    request.setAttribute("errMsg2", "<div class=\"form-group\"><small id=\"form-pass-mismatch\" style=\"margin-bottom: 10px;\"> Password Mismatch </small></div>");
                    request.setAttribute("border2", ".error");
                    RequestDispatcher rs = request.getRequestDispatcher("deleteaccount.jsp");
                    rs.include(request, response);
                }
            }
        } catch (Exception e) {
            //request.setAttribute("main", e.getMessage());
            request.setAttribute("message", e.getMessage());
            RequestDispatcher rs = request.getRequestDispatcher("Error.jsp");
            rs.include(request, response);
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
