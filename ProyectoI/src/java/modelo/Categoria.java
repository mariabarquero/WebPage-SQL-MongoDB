/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Mariá José
 */
public class Categoria {
    int Id_Categoria;
    String Nombre_Categoria;
    String Imagen;
    public Categoria(){
    
    }
    
    public Categoria(int Id_Categoria, String Nombre_Categoria,String Imagen) {
        this.Id_Categoria = Id_Categoria;
        this.Nombre_Categoria = Nombre_Categoria;
        this.Imagen = Imagen;
    }
    
    public int getId_Categoria() {
        return Id_Categoria;
    }

    public String getNombre_Categoria() {
        return Nombre_Categoria;
    }

    public void setId_Categoria(int Id_Categoria) {
        this.Id_Categoria = Id_Categoria;
    }

    public void setNombre_Categoria(String Nombre_Categoria) {
        this.Nombre_Categoria = Nombre_Categoria;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }
    
}
