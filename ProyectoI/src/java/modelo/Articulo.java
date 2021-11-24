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
public class Articulo {
    int Id_Articulo;
    String Nombre_Articulo;
    int Precio_unitario;
    int Cantidad_disponible;
    String Descripcion;
    String Imagen;
    
    public Articulo(){
        
    }
    
    public Articulo(int Id_Articulo,String Nombre_Articulo,int Precio_unitario, int Cantidad_disponible,String Descripcion,String Imagen){
        this.Id_Articulo= Id_Articulo;
        this.Nombre_Articulo= Nombre_Articulo;
        this.Precio_unitario= Precio_unitario;
        this.Cantidad_disponible= Cantidad_disponible;
        this.Descripcion = Descripcion;
        this.Imagen = Imagen;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }

    public int getId_Articulo() {
        return Id_Articulo;
    }

    public void setId_Articulo(int Id_Articulo) {
        this.Id_Articulo = Id_Articulo;
    }

    public String getNombre_Articulo() {
        return Nombre_Articulo;
    }

    public void setNombre_Articulo(String Nombre_Articulo) {
        this.Nombre_Articulo = Nombre_Articulo;
    }

    public double getPrecio_unitario() {
        return Precio_unitario;
    }

    public void setPrecio_unitario(int Precio_unitario) {
        this.Precio_unitario = Precio_unitario;
    }

    public int getCantidad_disponible() {
        return Cantidad_disponible;
    }

    public void setCantidad_disponible(int Cantidad_disponible) {
        this.Cantidad_disponible = Cantidad_disponible;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    
          
}
