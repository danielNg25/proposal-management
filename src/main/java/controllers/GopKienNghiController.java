/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.KienNghiGop;
import services.GopKienNghiService;

/**
 *
 * @author 11
 */
public class GopKienNghiController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String[] selectedIds = request.getParameterValues("selectedKN");
            String tieuDeGop = request.getParameter("tieuDeGop");
            String noiDungGop = request.getParameter("noiDungGop");

            if (selectedIds == null) {
                response.sendRedirect("/QuanLyKienNghi/quanly?err=1");
            } else {
                int soLanPA = selectedIds.length;
                KienNghiGop kienNghiGop = new KienNghiGop(tieuDeGop, noiDungGop, soLanPA);
                int kienNghiGopId = GopKienNghiService.themKienNghiGop(kienNghiGop);
                for (String strid: selectedIds) {
                    int kienNghiId = Integer.parseInt(strid);  
                    GopKienNghiService.updateKienNghiGopID(kienNghiGopId, kienNghiId);
                }
                response.sendRedirect("/QuanLyKienNghi/quanly?mes=success");
            }
        } catch (SQLException ex) {
            Logger.getLogger(GopKienNghiController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GopKienNghiController.class.getName()).log(Level.SEVERE, null, ex);
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
