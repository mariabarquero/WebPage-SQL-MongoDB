/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.List;

/**
 *
 * @author Mariá José
 */
public class ExperienciaDAO {
    ConexionM mongo = new ConexionM();
    
    public void insertar_comentario(String cedula, String Comentario){
         mongo.insertar(cedula,Comentario);
         
    }
    
    public void cambiar_comentario(String cedula, String Comentario){
        mongo.actualizar(cedula, Comentario);
        
    }
    
    public void eliminar_comentario(String cedula){
        mongo.eliminar(cedula);
        
    }
    
}
