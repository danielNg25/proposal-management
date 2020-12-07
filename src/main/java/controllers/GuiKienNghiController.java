/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.SQLException;
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
import services.KienNghiService;
import services.NguoiDanService;

/**
 *
 * @author VietAnh
 */
@WebServlet(name = "GuiKienNghiController", urlPatterns = {"/guikn"})
public class GuiKienNghiController extends HttpServlet {

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
            response.setContentType("text/html;charset=UTF-8");
            HttpSession session = request.getSession();
            String tieuDe = request.getParameter("tieuDe");
            int nguoigui_id = (int) session.getAttribute("userID");
            long millis = System.currentTimeMillis();
            java.sql.Date ngayPhanAnh = new java.sql.Date(millis);
            String noiDung = request.getParameter("noiDung");
            String trangThai = "chưa trả lời";
            String phanLoai = request.getParameter("phanLoai");

            NguoiDan nd = NguoiDanService.getNguoiDan(nguoigui_id);
            request.setAttribute("nguoiDan", nd);
            request.setAttribute("hoTen", nd.getHoTen());
            request.setAttribute("diaChi", nd.getDiaChi());
            request.setAttribute("sdt", nd.getSoDienThoai());
            request.setAttribute("email", nd.getEmail());
            request.setAttribute("gioiTinh", nd.getGioiTinh());
            request.setAttribute("cmnd", nd.getCmnd());

            if ("".equals(tieuDe) || "".equals(noiDung)) {
                request.getRequestDispatcher("userpage.jsp?err=1").forward(request, response);
            } else {
                KienNghi kn = new KienNghi();
                kn.setTieuDe(tieuDe);
                kn.setNguoigui_id(nguoigui_id);
                kn.setNoiDung(noiDung);
                kn.setNgayPhanAnh(ngayPhanAnh);
                kn.setTrangThai(trangThai);
                kn.setPhanLoai(phanLoai);
                KienNghiService.GuiKienNghi(kn);
            }
            request.getRequestDispatcher("userpage.jsp?mes=success").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(GuiKienNghiController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GuiKienNghiController.class.getName()).log(Level.SEVERE, null, ex);
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
