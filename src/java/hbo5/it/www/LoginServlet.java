/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hbo5.it.www;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import hbo5.it.www.beans.Persoon;
import hbo5.it.www.dataaccess.DAPersoon;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author steve
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"}, 
    initParams = {
    @WebInitParam(name = "url", value = "jdbc:oracle:thin:@ti-oracledb06.thomasmore.be:1521:XE"),
    @WebInitParam(name = "login", value = "c1035462"),
    @WebInitParam(name = "password", value = "7086"),
    @WebInitParam(name = "driver", value = "oracle.jdbc.driver.OracleDriver")})






public class LoginServlet extends HttpServlet {

        private DAPersoon dapersoon = null;
    @Override
    public void init() throws ServletException {
        try {
            String url = getInitParameter("url");
            String password = getInitParameter("password");
            String login = getInitParameter("login");
            String driver = getInitParameter("driver");
            if (dapersoon == null) {
                dapersoon = new DAPersoon(url, login, password, driver);
            }
        }catch (ClassNotFoundException | SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void destroy() {
        try {
            if ( dapersoon != null) {
                dapersoon.close();
            }
        } catch (SQLException e) {
        }}
    
    
    RequestDispatcher rd;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
      
            /* TODO output your page here. You may use following sample code. */
            if (request.getParameter("login") != null){
                
                String naam = request.getParameter("Username");
                String Pas = request.getParameter("Paswoord");
                
                 
                Integer result = dapersoon.CheckLogin(naam, Pas);
                 
                
                if (result == 1){
                    rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
               
               
           }
                else {
                    rd = request.getRequestDispatcher("LoginPage.jsp");
                    rd.forward(request, response);
           }
           
   
}
           
            
       else if (request.getParameter("registreer")!= null){
        rd = request.getRequestDispatcher("register.jsp");
        rd.forward(request, response);
                 
       }}
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
