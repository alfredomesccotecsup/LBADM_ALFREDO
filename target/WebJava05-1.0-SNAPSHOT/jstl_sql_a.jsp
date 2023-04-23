<%-- 
    Document   : jstl_sql_a
    Created on : 22/04/2023, 05:50:21 PM
    Author     : Alfredo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Listado de Usuarios</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f5f5f5;
            }

            .container {
                margin-top: 50px;
            }

            h1 {
                font-size: 3rem;
                font-weight: bold;
                text-align: center;
            }

            table {
                margin-top: 30px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            }

            th {
                background-color: #f8f9fa;
            }

            td,
            th {
                text-align: center;
                vertical-align: middle !important;
            }

            .btn-editar {
                background-color: #007bff;
                color: white;
            }

            .btn-eliminar {
                background-color: #dc3545;
                color: white;
            }

            .btn-editar:hover,
            .btn-eliminar:hover {
                color: white;
            }
        </style>
    </head>
    <body>
        <sql:setDataSource var="xcon" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost/test?useSSL=false&serverTimezone=UTC"
                           user="root"
                           password="123456"/>

        <sql:query dataSource="${xcon}"
                   sql="select * from t_usuarios"
                   var="result"/>

        <div style="width: 450px; text-align: center; margin: 50px auto;">
            <h1 class="display-8">Listado de Usuarios</h1>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Codigo</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Clave</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Opciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${result.rows}">
                        <tr>
                            <th scope="row"><c:out value="${row.codigo}"/></th>
                            <td><c:out value="${row.nombre}"/></td>
                            <td><c:out value="${row.clave}"/></td>
                            <td><c:out value="${row.estado}"/></td>
                            <td nowrap>
                                <a class="btn btn-primary" href="editar_sql.jsp?codigo=<c:out value='${row.codigo}'/>">Editar</a>
                                <a class="btn btn-danger" href="ControladorSql?accion=eliminar&codigo=<c:out value='${row.codigo}'/>">Eliminar</a>                             
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="index.html" class="btn btn-primary">INICIO</a>
        </div>
    </body>
</html>

