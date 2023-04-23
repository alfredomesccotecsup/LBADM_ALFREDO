<%-- 
    Document   : FormOperaciones
    Created on : 22/04/2023, 06:02:31 PM
    Author     : Alfredo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Calculadora</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            body {
                background-color: #F5F5F5;
                font-family: Arial, sans-serif;
                font-size: 16px;
                line-height: 1.5;
                color: #333;
                margin: 0;
                padding: 0;
            }

            .container {
                margin-top: 30px;
            }

            h1 {
                text-align: center;
                margin-bottom: 30px;
            }

            form {
                background-color: #FFFFFF;
                border-radius: 10px;
                box-shadow: 0px 0px 10px #999999;
                padding: 20px;
            }

            label {
                font-weight: bold;
                margin-bottom: 10px;
            }

            select, input[type="number"] {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 5px;
                background-color: #F0F0F0;
                margin-bottom: 20px;
            }

            input[type="submit"] {
                background-color: #FFA500;
                border: none;
                color: #FFFFFF;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #FF8C00;
            }

            a.btn {
                margin-top: 20px;
                display: inline-block;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>CALCULADORA</h1>
            <form action="Controlador" method="post">
                <label for="numero1">Primer número:</label>
                <input type="number" name="numero1" id="numero1">

                <label for="numero2">Segundo número:</label>
                <input type="number" name="numero2" id="numero2">

                <label for="operacion">Operación:</label>
                <select name="operacion" id="operacion">
                    <option value="suma">Suma</option>
                    <option value="resta">Resta</option>
                    <option value="multiplicacion">Multiplicación</option>
                    <option value="division">División</option>
                </select>

                <input type="submit" value="Calcular">

            </form>
            <a href="index.html" class="btn btn-primary">INICIO</a>
        </div>
    </body>
</html>

