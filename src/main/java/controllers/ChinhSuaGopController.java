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
import services.GopKienNghiService;
import static services.GopKienNghiService.getKienNghiGop;
import services.KienNghiService;

/**
 *
 * @author Acer
 */
public class ChinhSuaGopController extends HttpServlet {

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
      int kngID = Integer.parseInt(request.getParameter("kngID"));
      int soLanPA = GopKienNghiService.getKienNghiGop(kngID).getSoLanPA();
      if (request.getParameter("xoaTP") != null) {
        String[] deleteKNTP = request.getParameterValues("deleteKNTP");
        if (deleteKNTP == null) {
          response.sendRedirect("modify.jsp?kngID=" + kngID + "&err=1");
        } else {
          // xoa
          for (String strid : deleteKNTP) {
            int kienNghiId = Integer.parseInt(strid);
            GopKienNghiService.xoaKienNghiThanhPhan(kienNghiId, kngID);
          }
          GopKienNghiService.updateSoLanPA(kngID, soLanPA - deleteKNTP.length);
          response.sendRedirect("modify.jsp?kngID=" + kngID);
        }
      }
      if (request.getParameter("themTP") != null) {
        String[] insertKNTP = request.getParameterValues("insertKNTP");
        if (insertKNTP == null) {
          response.sendRedirect("modify.jsp?kngID=" + kngID + "&err=2");
        } else {
          // them
          for (String strid : insertKNTP) {
            int kienNghiId = Integer.parseInt(strid);
            GopKienNghiService.updateKienNghiGopID(kienNghiId, kngID);
          }
          GopKienNghiService.updateSoLanPA(kngID, soLanPA + insertKNTP.length);
          response.sendRedirect("modify.jsp?kngID=" + kngID);
        }
      }
      if (request.getParameter("thayDoi") != null) {
        String tieuDeGopMoi = request.getParameter("tieuDeGopMoi");
        String noiDungGopMoi = request.getParameter("noiDungGopMoi");
        if ("".equals(tieuDeGopMoi) || "".equals(noiDungGopMoi)) {
          response.sendRedirect("modify.jsp?kngID=" + kngID + "&err=3");
        } else {
          // sua
          GopKienNghiService.suaKienNghiGop(kngID, tieuDeGopMoi, noiDungGopMoi);
          response.sendRedirect("modify.jsp?kngID=" + kngID);
        }
      }
      if (request.getParameter("xoaKNG") != null) {
        GopKienNghiService.xoaKienNghiGop(kngID);
        response.sendRedirect("/QuanLyKienNghi/quanly");
      }
    } catch (SQLException ex) {
      Logger.getLogger(ChinhSuaGopController.class.getName()).log(Level.SEVERE, null, ex);
    } catch (ClassNotFoundException ex) {
      Logger.getLogger(ChinhSuaGopController.class.getName()).log(Level.SEVERE, null, ex);
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
