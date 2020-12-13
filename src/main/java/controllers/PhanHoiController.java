/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.KienNghi;
import models.NguoiDan;
import services.NguoiDanService;
import services.PhanHoiService;

/**
 *
 * @author ACER
 */
@WebServlet(name = "PhanHoiController", urlPatterns = {"/phanhoi"})
public class PhanHoiController extends HttpServlet {
    

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
        try {
            HttpSession session = request.getSession();
            int userID = (int)session.getAttribute("userID");
            response.setContentType("text/html;charset=UTF-8");
            List<KienNghi> listKNPhanHoi = PhanHoiService.getKienNghiPhanHoi(userID);
            request.setAttribute("listPH", listKNPhanHoi);
            NguoiDan nd = NguoiDanService.getNguoiDan(userID);
            request.setAttribute("nguoiDan", nd);
            request.setAttribute("hoTen", nd.getHoTen());
            request.setAttribute("diaChi", nd.getDiaChi());
            request.setAttribute("sdt", nd.getSoDienThoai());
            request.setAttribute("email", nd.getEmail());
            request.setAttribute("gioiTinh", nd.getGioiTinh());
            request.setAttribute("cmnd", nd.getCmnd());
            
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            
            request.getRequestDispatcher("phanhoi.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PhanHoiController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PhanHoiController.class.getName()).log(Level.SEVERE, null, ex);
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
