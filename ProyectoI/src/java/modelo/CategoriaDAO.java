package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {
    PreparedStatement ps;
    ResultSet rs;
    Conexion c=new Conexion();
    ConexionM mongo = new ConexionM();
    Connection con;
    public List listar_categoria(int id_categoria){
        List<Articulo>lista_cat=new ArrayList<>();
        String sql="select a.Id_Articulo,a.Nombre_Articulo,a.Precio_Unitario,Cantidad_Disponible,a.Descripcion from Articulo a\n" +
                    "inner join Articulo_Categoria ac\n" +
                    "on ac.Id_Articulo = a.Id_Articulo\n" +
                    "where ac.Id_Categoria="+id_categoria;
        
         System.out.println(id_categoria); 
         
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
                System.out.println(a.getDescripcion()); 
                lista_cat.add(a);
            }
        } catch (Exception e){
           
        }        
        return lista_cat;
    }
}
