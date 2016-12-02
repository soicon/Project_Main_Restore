package com.ServletController;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.dal.BookingContext;
import com.dal.LoginContext;

import com.entities.Booking;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dung nguyen
 */
public class BookingController extends HttpServlet {

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
            throws ServletException, IOException, Exception {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String uid = request.getParameter("uid");
        String pwd = request.getParameter("pwd");
        String fnum = request.getParameter("codeRoute");
        double fare = -1;
        if (request.getParameter("fare") != null) {
            fare = Double.parseDouble(request.getParameter("fare"));

        }

        String date = request.getParameter("date");
        String route = request.getParameter("route");
        String depart = request.getParameter("depart");
        String arrival = request.getParameter("arrival");
        BookingContext pc = new BookingContext();
        LoginContext lc = new LoginContext();
        String action = request.getParameter("btn");

        if (action.equalsIgnoreCase("search")) {

            request.setAttribute("lister", pc.getBookingById(id));
            RequestDispatcher rd = request.getRequestDispatcher("SearchBooking.jsp");
            rd.forward(request, response);

        } else if (action.equalsIgnoreCase("save")) {

            pc.updateBooking(id, fnum, route, 0, fare, depart, arrival);

            request.setAttribute("update", "Updated Successfully");
            RequestDispatcher rd = request.getRequestDispatcher("UpdateBooking.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("delete")) {
            pc.deleteBooking(id);
            request.setAttribute("Delete", "Delete Successfully");
            RequestDispatcher rd = request.getRequestDispatcher("SearchBooking.jsp");
            rd.forward(request, response);

        } else if (action.equalsIgnoreCase("add")) {
            Booking e = new Booking(id, name, fnum, route, date, 0, fare, depart, arrival);
            pc.addBooking(e);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } else if (action.equalsIgnoreCase("register")) {
            int i = lc.isDuplicate(uid);
            if (i == 1) {
                lc.register(uid, pwd, "user");
                request.setAttribute("register", "Register Successfully");
            } else {
                request.setAttribute("error", "This username has been exist");
            }
            RequestDispatcher rd = request.getRequestDispatcher("AddCustomer.jsp");
            rd.forward(request, response);

        } else if (action.equalsIgnoreCase("change")) {
            lc.changePass(uid, pwd);
            request.setAttribute("change", "Password change successfully");
            RequestDispatcher rd = request.getRequestDispatcher("ChangePassword.jsp");
            rd.forward(request, response);
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
        try {
            processRequest(request, response);

        } catch (Exception ex) {
            Logger.getLogger(BookingController.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);

        } catch (Exception ex) {
            Logger.getLogger(BookingController.class
                    .getName()).log(Level.SEVERE, null, ex);
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
