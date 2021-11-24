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
public class Orden {
    int Id_articulo;
    String Articulo;
    int Cant_disponible;
    String Descripcion;
    int Id_Orden;
    int Cantidad_Total;
    int Subtotal;
    int Total;
    int Impuesto;
    int Descuento;
    int Precio_venta;
    String Imagen;
    
    public Orden(){
        
    }

    public Orden(int Id_articulo,String Articulo, int Cant_disponible, String Descripcion, int Id_Orden, int Cantidad_Total, int Subtotal, int Total, int Impuesto, int Descuento, int Precio_venta,String Imagen) {
        this.Id_articulo = Id_articulo;
        this.Articulo = Articulo;
        this.Cant_disponible = Cant_disponible;
        this.Descripcion = Descripcion;
        this.Id_Orden = Id_Orden;
        this.Cantidad_Total = Cantidad_Total;
        this.Subtotal = Subtotal;
        this.Total = Total;
        this.Impuesto = Impuesto;
        this.Descuento = Descuento;
        this.Precio_venta = Precio_venta;
        this.Imagen = Imagen;
    }

    public int getId_articulo() {
        return Id_articulo;
    }

    public void setId_articulo(int Id_articulo) {
        this.Id_articulo = Id_articulo;
    }

    public String getArticulo() {
        return Articulo;
    }

    public void setArticulo(String Articulo) {
        this.Articulo = Articulo;
    }

    public int getCant_disponible() {
        return Cant_disponible;
    }

    public void setCant_disponible(int Cant_disponible) {
        this.Cant_disponible = Cant_disponible;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public int getId_Orden() {
        return Id_Orden;
    }

    public void setId_Orden(int Id_Orden) {
        this.Id_Orden = Id_Orden;
    }

    public int getCantidad_Total() {
        return Cantidad_Total;
    }

    public void setCantidad_Total(int Cantidad_Total) {
        this.Cantidad_Total = Cantidad_Total;
    }

    public int getSubtotal() {
        return Subtotal;
    }

    public void setSubtotal(int Subtotal) {
        this.Subtotal = Subtotal;
    }

    public int getTotal() {
        return Total;
    }

    public void setTotal(int Total) {
        this.Total = Total;
    }

    public int getImpuesto() {
        return Impuesto;
    }

    public void setImpuesto(int Impuesto) {
        this.Impuesto = Impuesto;
    }

    public int getDescuento() {
        return Descuento;
    }

    public void setDescuento(int Descuento) {
        this.Descuento = Descuento;
    }

    public int getPrecio_venta() {
        return Precio_venta;
    }

    public void setPrecio_venta(int Precio_venta) {
        this.Precio_venta = Precio_venta;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }
   
}