/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Experiencia;
import modelo.ExperienciaDAO;

/**
 *
 * @author Mariá José
 */
public class ControladorOpinion extends HttpServlet {
    Experiencia exp=new Experiencia();
    ExperienciaDAO expdao=new ExperienciaDAO();
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
        String accion=request.getParameter("accion");
        switch(accion) {
            case "Enviar":
                System.out.println("Enviar");
                String cedula=request.getParameter("textCedula"); 
                System.out.println(cedula); 
                String comentario=request.getParameter("descripcion");
                System.out.println(comentario); 
                expdao.insertar_comentario(cedula,comentario);
                request.getRequestDispatcher("mensaje.jsp").forward(request,response);
                break;
            case "Actualizar":
                System.out.println("Actualizar");
                String acedula=request.getParameter("textCedula"); 
                System.out.println(acedula); 
                String acomentario=request.getParameter("descripcion");
                System.out.println(acomentario); 
                expdao.cambiar_comentario(acedula,acomentario);
                request.getRequestDispatcher("mensaje.jsp").forward(request,response);
                break;
            case "Eliminar":
                System.out.println("Eliminar");
                String ecedula=request.getParameter("textCedula"); 
                System.out.println(ecedula);
                expdao.eliminar_comentario(ecedula);
                request.getRequestDispatcher("mensaje.jsp").forward(request,response);
                break;
                
                  
            default:
                throw new AssertionError();
            
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
