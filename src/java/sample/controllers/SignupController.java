/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.daos.UserDAO;
import sample.dtos.UserDTO;

/**
 *
 * @author HD
 */
public class SignupController extends HttpServlet {

    private final String SUCCESS = "LoginController";
    private final String ERROR = "signup.jsp";

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
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            if (UserDAO.checkValidUserID(userID)) {
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                String confirm = request.getParameter("confirm");
                if (password.equalsIgnoreCase(confirm)) {
                    String email = request.getParameter("email");
                    String roleID = "user";
                    UserDTO dto = new UserDTO(userID, userName, email, password, roleID);
                    if (UserDAO.insertAUser(dto)) {
                        url = SUCCESS;
                    }
                }else{
                    request.setAttribute("ERRORPASSWORDMESSAGE", "PASSWORD AND CONFIRM PASSWORD ARE NOT EQUALS");
                }
            } else {
                request.setAttribute("ERRORUSERIDMESSAGE", "THIS USER ID IS ALREADY USED!!");
            }
        } catch (SQLException ex) {
            log("Error at ViewDetailBillController: " + ex.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
