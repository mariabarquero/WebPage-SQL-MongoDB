/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

public class Experiencia {
    String Cedula;
    String Comentario;
    public Experiencia(){
    }

    public Experiencia(String Cedula, String Comentario) {
        this.Cedula = Cedula;
        this.Comentario = Comentario;
    }

    public String getCedula() {
        return Cedula;
    }

    public String getComentario() {
        return Comentario;
    }

    public void setCedula(String Cedula) {
        this.Cedula = Cedula;
    }

    public void setComentario(String Comentario) {
        this.Comentario = Comentario;
    }


}