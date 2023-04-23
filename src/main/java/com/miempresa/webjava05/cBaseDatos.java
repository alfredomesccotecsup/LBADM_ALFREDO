package com.miempresa.webjava05;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author fredd
 */
public class cBaseDatos {

    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC";
    String usuario = "root";
    String clave = "123456";

    private Connection Conectar() {
        try {
            Class.forName(driver);
            Connection xcon = DriverManager.getConnection(url, usuario, clave);
            return xcon;
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return null;
    }

    public void actualizarDatos(String id, String nombre, String clave, String estado) {

        try {
            Connection conexion = this.Conectar();
            Statement st = conexion.createStatement();
            String user = "nombre='" + nombre + "', clave='" + clave + "', estado='" + estado  +"' ";
            String query = "UPDATE t_usuarios SET " + user +  "WHERE codigo='" + id + "'";
            st.executeUpdate(query);
            System.out.println("Se actualizo");
           
        } catch (Exception e) {
            System.out.println("Error al actualizar los datos: " + e.getMessage());
        } finally {
            try {
                
            } catch (Exception e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }
    
    public void EliminarDatos(String id) {

        try {
            Connection conexion = this.Conectar();
            Statement st = conexion.createStatement();
            String query = "DELETE  FROM t_usuarios WHERE codigo='" + id + "'";
            st.executeUpdate(query);
            System.out.println("Se Elimino");
           
        } catch (Exception e) {
            System.out.println("Error al actualizar los datos: " + e.getMessage());
        } finally {
            try {
                
            } catch (Exception e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }

   /*public static void main(String[] args) {
        cBaseDatos objDB = new cBaseDatos();
        String id = "2";
        objDB.EliminarDatos(id);
    }*/
}