/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entidades.libro;
import Model.libroModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import com.google.gson.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author programar
 */
public class nuevo extends HttpServlet {

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
            
            String var=request.getParameter("action");
            switch (var) {
                case "cargar":
                    cargar(request,response);
                    break;
                case "buscar":
                     buscar(request,response);
                    break;
                 case "libro":
                     traerLibro(request,response);
                  break;
                 case "CrearEjemplar":
                     CrearejEjemplar(request,response);
                default:
                    throw new AssertionError();
            }
            
            
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

    private void cargar(HttpServletRequest request, HttpServletResponse response) {
         
        try {
            //To change body of generated methods, choose Tools | Templates.
          
            PrintWriter out = response.getWriter();
            JSONObject o =new JSONObject ();
            List <libro> l=new ArrayList<libro>();
            libroModel t=new libroModel();
            l=t.listarLibros();
            
            Gson n=new Gson();
            out.println(n.toJson(l));
            out.flush();
           
            
        } catch (IOException ex) {
            Logger.getLogger(nuevo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(nuevo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(nuevo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
     private void buscar(HttpServletRequest request, HttpServletResponse response) {
         String pro =request.getParameter("id");
         
        try {
           
            PrintWriter out = response.getWriter();
            
            List <libro> l=new ArrayList<libro>();
            libroModel t=new libroModel();
            l=t.buscarLibro(pro);
            
            Gson n=new Gson();
            out.println(n.toJson(l));
            out.flush();
           
            
        } catch (IOException ex) {
            Logger.getLogger(nuevo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(nuevo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(nuevo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    private void traerLibro(HttpServletRequest request, HttpServletResponse response) {
       String pro =request.getParameter("isbn");
        try{
            PrintWriter out = response.getWriter();
            libro l=new libro();
            libroModel t=new libroModel();
            l=t.verLibro(pro);
            Gson n=new Gson();
           
            out.println(n.toJson(l));
            out.flush();
        
        
        
        }catch(Exception e){}

    }

    private void CrearejEjemplar(HttpServletRequest request, HttpServletResponse response) {
            String ubicacion=request.getParameter("ubicacion");
            String id_ejemplar=request.getParameter("id_isbn");
        
        try {
            libroModel t=new libroModel();
            libro l=new libro();
            
            int id=Integer.parseInt(id_ejemplar);
            l.setUbicacion(ubicacion);
            l.setId_ejemplar(id);
            t.nuevoTipoCliente(l);
        
        }catch(Exception e){}
    }

}
