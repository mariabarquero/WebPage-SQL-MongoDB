/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Set;
import javax.servlet.ServletException;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Articulo;
import modelo.ArticuloDAO;
import modelo.Orden;
import modelo.Cliente;
import modelo.ClienteDAO;
import modelo.Costo;
import modelo.CostoDAO;

/**
 *
 * @author Mariá José
 */
public class Controlador extends HttpServlet {
    ArticuloDAO dao=new ArticuloDAO();
    Articulo a= new Articulo();
    Orden o= new Orden();
    Cliente c=new Cliente();
    ClienteDAO daoc=new ClienteDAO();
    Costo costo=new Costo();
    CostoDAO costodao=new CostoDAO();
    
    /*DAO= Data Access Object*/
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String accion=request.getParameter("accion");
        switch(accion) {
            case "Inicio":     /*Muestra los articulos*/
                List<Articulo>datos=dao.listar();
                request.setAttribute("datos",datos);
                request.getRequestDispatcher("index.jsp").forward(request,response);
                break;
                
            case "Carrito":   /*Lo dirige al Carrito de compras con sus datos*/
                int resultado;
                int ced;
                resultado=daoc.verificar_estado_sesion();
                
                if(resultado==0){
                    request.getRequestDispatcher("iniciar.jsp").forward(request,response);  
                }else{
                    ced=daoc.obtenerCedula();
                    List<Orden>datosorden=dao.listarOrden(ced);
                    List<Orden>monto=costodao.Monto(ced);
                    request.setAttribute("monto",monto);
                    request.setAttribute("datosorden",datosorden);
                    request.getRequestDispatcher("carrito.jsp").forward(request,response);
                }
                break;
                
            case "Agregar a Carrito":     /*Se agrega a la tabla Registro_Orden*/
                /*id es de id_articulo*/
                int r; /*se almacena el resultado de la verificación de sesión*/
                int ced1;
                int res_cant;
                int id=Integer.parseInt(request.getParameter("id")); 
                r=daoc.verificar_estado_sesion();
                res_cant = dao.validar_cantidad_disponible(id);
     
                if(r==0){
                   request.getRequestDispatcher("iniciar.jsp").forward(request,response); 
                }else if(res_cant==0){
                   request.getRequestDispatcher("index.jsp").forward(request,response);
                }else{
                    List<Articulo>cargardatos=dao.listar();
                    request.setAttribute("datos",cargardatos);
                    ced1=daoc.obtenerCedula();
                    System.out.println(ced1);
                    a = dao.insertRegistro(id,ced1);     
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                }
                break;
            
            case "Agregar a Orden":      /*Se agrega a la Orden y actualiza precios*/ 
                int id_articulo=Integer.parseInt(request.getParameter("id_art"));
                int ced2=daoc.obtenerCedula();
                System.out.println(ced2);
                a = dao.actualizarOrden(id_articulo,ced2);  
                List<Orden>datosnuevos=dao.listarOrden(ced2);
                List<Orden>monto=costodao.Monto(ced2);
                request.setAttribute("monto",monto);
                request.setAttribute("datosorden",datosnuevos);
                request.getRequestDispatcher("carrito.jsp").forward(request,response);
                break;
                
            case "Eliminar":
                int id_art=Integer.parseInt(request.getParameter("id_art")); 
                int ced3;
                ced3=daoc.obtenerCedula();
                System.out.println(ced3);
                a = dao.eliminar_de_carrito(id_art,ced3);   
                List<Orden>datosactualizados=dao.listarOrden(ced3);
                List<Orden>monto_nuevo=costodao.Monto(ced3);
                request.setAttribute("monto",monto_nuevo);
                request.setAttribute("datosorden",datosactualizados);
                request.getRequestDispatcher("carrito.jsp").forward(request,response);
                break;
                
            case "Realizar Pago":      
                int ced4=daoc.obtenerCedula();
                System.out.println(ced4);
                a = dao.realizar_pago(ced4); 
                List<Orden>datosnuevos1=dao.listarOrden(ced4);
                List<Orden>monto1=costodao.Monto(ced4);
                request.setAttribute("monto",monto1);
                request.setAttribute("datosorden",datosnuevos1);
                request.getRequestDispatcher("carrito.jsp").forward(request,response);
                break;
                
            case "Experiencia":
                request.getRequestDispatcher("experiencia.jsp").forward(request,response);
                break;
                
            case "Enviar":
                request.getRequestDispatcher("mensaje.jsp").forward(request,response);
                break;
            
           
                
            default:
                throw new AssertionError();
                        
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
