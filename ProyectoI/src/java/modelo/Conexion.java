/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Mariá José
 */
public class Conexion {
    Connection con;
    String url="jdbc:oracle:thin:@DESKTOP-NPIP3UF:1522:XE";
    String user="maria";
    String pass="mariaubp";
    
    public Connection conectar(){
         
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection(url,user,pass);
        } catch (Exception e) {
            
        }
        return con;
    }
}
