<%-- 
    Document   : editar_sql
    Created on : 22/04/2023, 09:20:59 PM
    Author     : Alfredo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min.css" type="text/css" />
        <style>
            body {
                background-color: #f2f2f2;
                font-family: Arial, sans-serif;
            }
            h1 {
                font-size: 36px;
                font-weight: bold;
                margin: 50px 0;
            }
            table {
                margin: 0 auto;
                width: 90%;
                border-collapse: collapse;
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
                background-color: #fff;
            }
            th, td {
                padding: 10px;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #007bff;
                color: #fff;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-control {
                width: 80%;
                margin-left: 10px;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ddd;
            }
            select.form-control {
                width: auto;
            }
            .btn {
                padding: 10px 20px;
                border-radius: 5px;
                border: none;
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
                transition: all 0.3s;
            }
            .btn:hover {
                background-color: #0062cc;
            }
        </style>
    </head>
    <body>
        <sql:setDataSource var="xcon" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost/test?useSSL=false&serverTimezone=UTC"
                           user="root"
                           password="123456"/>

        <sql:query dataSource="${xcon}"
                   sql="select * from t_usuarios where codigo = ${param.codigo}"
                   var="result"/>

        <div style="width: 800px; text-align: center; margin: 50px auto;">
            <h1 class="display-8">Listado de Usuario</h1>
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
                    <form method="post" action="/WebJava05/ControladorSql">
                        <input type="hidden" name="codigo" value="<c:out value="${row.codigo}"/>">
                        <td><c:out value="${row.codigo}"/></td>
                        <td><input type="text" name="nombre" value="<c:out value="${row.nombre}"/>"></td>
                        <td><input type="text" name="clave" value="<c:out value="${row.clave}"/>"></td>
                        <td>
                            <select name="estado">
                                <option value="A" <c:if test="${row.estado eq 'A'}">selected</c:if>>Activo</option>
                                <option value="X" <c:if test="${row.estado eq 'X'}">selected</c:if>>Inactivo</option>
                                </select>
                            </td>
                            <td nowrap>
                                <button type="submit" class="btn btn-primary">Guardar</button>
                            </td>
                        </form>
                        </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </body>

</html>