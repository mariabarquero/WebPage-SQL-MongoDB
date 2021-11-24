/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mariá José
 */
public class ConexionM {
    DB BaseDatos;
    DBCollection coleccion;
    DBCollection coleccion2;
    BasicDBObject document = new BasicDBObject();
    
    public ConexionM() {
           try { 
           Mongo mongo = new Mongo("LocalHost",27017);
           BaseDatos = mongo.getDB("ecomt");
           coleccion = BaseDatos.getCollection("imagenes");
           coleccion2 = BaseDatos.getCollection("usuarios");
           System.out.println("Conexion exitosa");
        } catch (UnknownHostException ex) {
            Logger.getLogger(ConexionM.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
    public String mostrar(String nombre_articulo){
        document.put("nombre_articulo",nombre_articulo);
        DBCursor cursor = coleccion.find(document);
        
        if(cursor.hasNext()){
              DBObject linea = cursor.next();
              String imagenes = (String)linea.get("imagen");
              return imagenes;
        }else {
            String imagenes = "Error";
            return imagenes;
        } 
    }
    
    public boolean insertar(String cedula,String comentario){
        document.put("cedula",cedula);
        document.put("comentario",comentario);
        coleccion2.insert(document);
        return true;
    }
    
    public boolean actualizar(String cedula,String comentario){
        document.put("cedula",cedula);
        BasicDBObject documentNuevo = new BasicDBObject();
        documentNuevo.put("cedula",cedula);
        documentNuevo.put("comentario",comentario);
        coleccion2.findAndModify(document,documentNuevo);
        return true;
    }   
    
    
    public boolean eliminar(String cedula){
        document.put("cedula",cedula);
        coleccion2.remove(document);
        return true;
    }
}

