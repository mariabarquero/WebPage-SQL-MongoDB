/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

public class Cliente {
    int Cedula;
    int Provincia;
    String Nombre;
    String Primer_Apellido;
    String Segundo_Apellido;
    String Correo;
    String Contraseña;
    public Cliente(){
    }

    public Cliente(int Cedula, int Provincia, String Nombre, String Primer_Apellido, String Segundo_Apellido, String Correo, String Contraseña) {
        this.Cedula = Cedula;
        this.Provincia = Provincia;
        this.Nombre = Nombre;
        this.Primer_Apellido = Primer_Apellido;
        this.Segundo_Apellido = Segundo_Apellido;
        this.Correo = Correo;
        this.Contraseña = Contraseña;
    }

    public int getCedula() {
        return Cedula;
    }

    public int getProvincia() {
        return Provincia;
    }

    public String getNombre() {
        return Nombre;
    }

    public String getPrimer_Apellido() {
        return Primer_Apellido;
    }

    public String getSegundo_Apellido() {
        return Segundo_Apellido;
    }

    public String getCorreo() {
        return Correo;
    }

    public String getContraseña() {
        return Contraseña;
    }
    
    public void setCedula(int Cedula) {
        this.Cedula = Cedula;
    }

    public void setProvincia(int Provincia) {
        this.Provincia = Provincia;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public void setPrimer_Apellido(String Primer_Apellido) {
        this.Primer_Apellido = Primer_Apellido;
    }

    public void setSegundo_Apellido(String Segundo_Apellido) {
        this.Segundo_Apellido = Segundo_Apellido;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public void setContraseña(String Contraseña){
        this.Contraseña = Contraseña;
    }
}
