/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.daos.BillDAO;
import sample.daos.HouseDAO;
import sample.daos.ProductsInBillDAO;
import sample.dtos.BillDTO;
import sample.dtos.HouseDTO;
import sample.dtos.ProductsInBillDTO;

/**
 *
 * @author HD
 */
public class DeleteProductInCartController extends HttpServlet {

    private final String SUCCESS = "SearchController";

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
        String url = SUCCESS;
        try {
            HttpSession session = request.getSession();
            String idHouse = request.getParameter("idHouse");
            String idBill = request.getParameter("idBill");
            ProductsInBillDAO.removeAHouseInBill(idHouse, idBill);
            //    HouseDTO houseDTO = HouseDAO.getHouseDTOByHouseID(idHouse);
            BillDTO billDTO = BillDAO.getBillDetailByBillID(idBill);
            float lastTotal = ProductsInBillDAO.getTotalInBill(idBill);
            billDTO.setTotal(lastTotal);
            BillDAO.updateBillDetail(billDTO);
            List<ProductsInBillDTO> listProducts = ProductsInBillDAO.getListProductInBill(idBill);
            if (listProducts != null) {
                for (ProductsInBillDTO x : listProducts) {
                    HouseDTO dtoTmp = HouseDAO.getPicHouseAndDescriptionById(x.getIdHouse());
                    x.setPicHouse(dtoTmp.getPicHouse());
                    x.setDescription(dtoTmp.getDescription());
                }
                session.setAttribute("LISTPRODUCTINBILL", listProducts);
                int numProductInBill = listProducts.size();
                session.setAttribute("NUMPRODUCT", numProductInBill + "");
            } else {
                session.setAttribute("LISTPRODUCTINBILL", null);
                int numProductInBill = 0;
                session.setAttribute("NUMPRODUCT", numProductInBill + "");
            }
            session.setAttribute("BILLDTO", billDTO);
        } catch (Exception ex) {
            log("Error at DeleteProductInCartController: " + ex.toString());
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
