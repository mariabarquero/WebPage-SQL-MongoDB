/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;


/**
 *
 * @author Mariá José
 */
public class ArticuloDAO {
    PreparedStatement ps;
    ResultSet rs;
    Conexion c=new Conexion();
    ConexionM mongo = new ConexionM();
    Connection con;
    
    public List listar(){
        List<Articulo>lista=new ArrayList<>();
        String sql="select * from Articulo";
        try {
            con=(Connection) c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Articulo a=new Articulo();
                a.setId_Articulo(rs.getInt(1));
                a.setNombre_Articulo(rs.getString(2));
                a.setPrecio_unitario(rs.getInt(3));
                a.setCantidad_disponible(rs.getInt(4));
                a.setDescripcion(rs.getString(5));
                a.setImagen(mongo.mostrar(rs.getString(2)));
                System.out.println(rs.getString(2));
                lista.add(a);
            }
        } catch (Exception e){
            
        }
        return lista;    /*Nos va a retornar todos los productos*/
    }
    
    public List listarOrden(int ced){
        List<Orden>listaOrden=new ArrayList<>();
        String sql="select a.Id_articulo,a.Nombre_Articulo,a.Cantidad_disponible, a.descripcion,r.precio_venta,r.cantidad,o.subtotal,o.total,o.impuesto,o.descuento from Orden o\n" +
                    "inner join Registro_Orden r\n" +
                    "on o.Id_orden = r.Id_orden\n" +
                    "inner join Articulo a\n" +
                    "on r.Id_Articulo = a.Id_Articulo\n" +
                    "where o.Cedula="+ced;      
        try {
            con=(Connection) c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Orden o=new Orden();
                o.setId_articulo(rs.getInt(1));
                o.setArticulo(rs.getString(2));
                o.setCant_disponible(rs.getInt(3));
                o.setDescripcion(rs.getString(4));
                o.setPrecio_venta(rs.getInt(5));
                o.setCantidad_Total(rs.getInt(6));
                o.setSubtotal(rs.getInt(7));
                o.setTotal(rs.getInt(8));
                o.setImpuesto(rs.getInt(9));
                o.setDescuento(rs.getInt(10));
                o.setImagen(mongo.mostrar(rs.getString(2)));
                listaOrden.add(o);
            }
        } catch (Exception e){
            
        }
        return listaOrden;    /*Nos va a retornar todas las ordenes*/
    }
    
    
    public Articulo insertRegistro(int id,int cedula){
        Articulo a=new Articulo();
        try {
            con=(Connection) c.conectar();
            CallableStatement ir=con.prepareCall("{call insertar_registro(?,?)}");
            ir.setInt(1,id);
            ir.setInt(2,cedula);
            ir.execute();
           
        } catch (Exception e){
            e.printStackTrace();
          
        }
        return a;   
    }
    
    public Articulo actualizarOrden(int id,int cedula){
        Articulo a=new Articulo();
        try {
            con=(Connection) c.conectar();
            CallableStatement ir=con.prepareCall("{call actualizar_orden(?,?)}");
            ir.setInt(1,id);
            ir.setInt(2,cedula);
            ir.execute();
           
        } catch (Exception e){
            e.printStackTrace();
          
        }
        return a;   
    }
    
     public Articulo eliminar_de_carrito(int id,int cedula){
        Articulo a=new Articulo();
        try {
            con=(Connection) c.conectar();
            CallableStatement ir=con.prepareCall("{call eliminar_de_carrito(?,?)}");
            ir.setInt(1,id);
            ir.setInt(2,cedula);
            ir.execute();
           
        } catch (Exception e){
            e.printStackTrace();
          
        }
        return a;   
    }
     
     
    public Articulo realizar_pago(int cedula){
        Articulo a=new Articulo();
        try {
            con=(Connection) c.conectar();
            CallableStatement ir=con.prepareCall("{call realizar_pago(?)}");
            ir.setInt(1,cedula);
            ir.execute();
           
        } catch (Exception e){
            e.printStackTrace();
          
        }
        return a;   
    }

    public int validar_cantidad_disponible(int id_articulo) {
       int res=0;
       
        try{
            con=c.conectar();
            CallableStatement st=con.prepareCall("{? = call verificar_cantidad(?)}");
            st.setInt(2,id_articulo);
            st.registerOutParameter(1,Types.NUMERIC);  
            st.execute();        
            res=st.getInt(1);     
           
            if(res==1){
             res=1;
            }else{
             res=0;
            }
        }catch (Exception e) {
            e.printStackTrace();
             System.out.println("ERROR");             
        }
        return res;
    }
 
}