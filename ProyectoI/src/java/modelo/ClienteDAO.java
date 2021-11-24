package modelo;

import java.sql.CallableStatement;
import modelo.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ClienteDAO implements Validar {
    PreparedStatement ps;
    ResultSet rs;
    Conexion c=new Conexion();
    ConexionM mongo = new ConexionM();
    
    Connection con;

    @Override
    public int validar(Cliente cl) {
       int res=0;
       
        try{
            con=c.conectar();
            CallableStatement st=con.prepareCall("{? = call verificar_cuenta(?,?)}");
            st.setString(2,cl.getCorreo());
            st.setString(3,cl.getContraseña());
            st.registerOutParameter(1,Types.NUMERIC);  
            st.execute();
            System.out.println(cl.getContraseña());          
            res=st.getInt(1);     
            System.out.println(res);  
           
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

    public Cliente sesion_estado(String correo,String contraseña,int estado){
        Cliente client=new Cliente();
        try {
            con=(Connection) c.conectar();
            CallableStatement s=con.prepareCall("{call estado_sesion(?,?,?)}");
            s.setString(1,correo);
            s.setString(2,contraseña);
            s.setInt(3,estado);
            s.execute();
           
        } catch (Exception e){
            e.printStackTrace();
          
        }
        return client;   
    }
    
    public List Info_Cliente(){
        List<Cliente>info_cliente= new ArrayList<>();
        String sql="select * from Cliente_Estado"; 
        try {
            con=(Connection) c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Cliente inf=new Cliente();
                inf.setCedula(rs.getInt(1));
                System.out.println(inf.getCedula());    
                inf.setNombre(rs.getString(2));
                info_cliente.add(inf);     
            }
        }catch (Exception e){
                e.printStackTrace();          
        }
        return info_cliente;
    }  
    
    public int verificar_estado_sesion(){
        int res=0;
        try{
            con=c.conectar();
            CallableStatement st=con.prepareCall("{? = call verificar_estado}");  
            st.registerOutParameter(1,Types.NUMERIC);    
            st.execute();
            res=st.getInt(1);
            if(res==1){
             res=1;
            }else{
             res=0;
            }
        }catch (Exception e){
                e.printStackTrace();     
                System.out.println("ERROR DE VERIFICACIÓN"); 
        }
            return res;
    }    

        public int obtenerCedula(){
        int ced=0;
        String sql="select Cedula from Cliente_Estado"; 
        try {
            con=(Connection) c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Cliente inf=new Cliente();
                inf.setCedula(rs.getInt(1));
                ced =inf.getCedula();
                System.out.println(inf.getCedula());    
            }
        }catch (Exception e){
                e.printStackTrace();          
        }
        return ced;
    }  
}
