package modelo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

public class CostoDAO {
    PreparedStatement ps;
    ResultSet rs;
    Conexion c=new Conexion();
    ConexionM mongo = new ConexionM();
    Connection con;
      
    public List Monto(int ced){
        List<Orden>listaMonto=new ArrayList<>();
        String sql="select o.subtotal,o.total,o.descuento from Orden o\n" +
                    "where o.Cedula="+ced;      
        try {
            con=(Connection) c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Orden o=new Orden();
                o.setSubtotal(rs.getInt(1));
                o.setTotal(rs.getInt(2));
                o.setDescuento(rs.getInt(3));
                listaMonto.add(o);
            }
        } catch (Exception e){
            
        }
        return listaMonto;   
    }
}
