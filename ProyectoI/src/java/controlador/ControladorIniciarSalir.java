/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Articulo;
import modelo.Cliente;
import modelo.ClienteDAO;

/**
 *
 * @author Mariá José
 */
public class ControladorIniciarSalir extends HttpServlet {
    int r;
    ClienteDAO daoc=new ClienteDAO();
    Cliente cli=new Cliente();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion=request.getParameter("accion");
        if(accion.equals("Ingresar")){
            String correo=request.getParameter("txtCorreo");
            String contra=request.getParameter("txtCons");      
            cli.setCorreo(correo);
            cli.setContraseña(contra);
            r=daoc.validar(cli);
            System.out.println("CORREO");   
            System.out.println(cli.getCorreo());
            System.out.println("resultado de r");                 
            System.out.println(r);
            if(r==1){
                List<Cliente>info=daoc.Info_Cliente();
                request.setAttribute("info",info);
                daoc.sesion_estado(cli.getCorreo(),cli.getContraseña(),1);              
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }else{
                request.getRequestDispatcher("iniciar.jsp").forward(request,response);
            }
        }else{ /*salir de la sesión */
                System.out.println("SALIR");       
                daoc.sesion_estado(cli.getCorreo(),cli.getContraseña(),2);
                request.getRequestDispatcher("index.jsp").forward(request,response);
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