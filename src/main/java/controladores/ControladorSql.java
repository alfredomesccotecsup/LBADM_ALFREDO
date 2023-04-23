/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alfredo
 */
@WebServlet(name = "ControladorSql", urlPatterns = {"/ControladorSql"})
public class ControladorSql extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los datos del formulario
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        String clave = request.getParameter("clave");
        String estado = request.getParameter("estado");

        // Actualizar los datos en la base de datos
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost/test?useSSL=false&serverTimezone=UTC", "root", "123456");
            String query = "UPDATE t_usuarios SET nombre=?, clave=?, estado=? WHERE codigo=?";
            ps = con.prepareStatement(query);
            ps.setString(1, nombre);
            ps.setString(2, clave);
            ps.setString(3, estado);
            ps.setString(4, codigo);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null)
                    ps.close();
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        String accion = request.getParameter("accion");

        if ("eliminar".equals(accion)) {
            // Obtener el código del usuario a eliminar

            // Eliminar el usuario de la base de datos
            try {
                con = DriverManager.getConnection("jdbc:mysql://localhost/test?useSSL=false&serverTimezone=UTC", "root", "");
                String deleteQuery = "DELETE FROM t_usuarios WHERE codigo=?";
                ps = con.prepareStatement(deleteQuery);
                ps.setString(1, codigo);
                ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (ps != null)
                        ps.close();
                    if (con != null)
                        con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        // Redireccionar al usuario a la página principal
        response.sendRedirect("jstl_sql_a.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
