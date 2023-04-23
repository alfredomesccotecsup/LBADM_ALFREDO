<%-- 
    Document   : resultado
    Created on : 22/04/2023, 06:08:15 PM
    Author     : Alfredo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Resultado</title>
	<link rel="stylesheet" href="ruta-del-archivo-estilos.css">
	<style>
		body {
			background-color: #f2f2f2;
			font-family: Arial, sans-serif;
			font-size: 16px;
			margin: 0;
			padding: 0;
		}
		.container {
			background-color: #fff;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
			margin: 50px auto;
			max-width: 600px;
			padding: 30px;
			text-align: center;
		}
		h1 {
			color: #333;
			font-size: 36px;
			margin-bottom: 20px;
		}
		p {
			color: #555;
			font-size: 24px;
			margin-bottom: 30px;
		}
		.btn {
			background-color: #007bff;
			border: none;
			border-radius: 5px;
			color: #fff;
			cursor: pointer;
			font-size: 20px;
			padding: 10px 20px;
			transition: background-color 0.3s ease;
		}
		.btn:hover {
			background-color: #0069d9;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>Resultado</h1>
		<p>El resultado de la operación es: <%= request.getAttribute("resultado")%></p>
		<a class="btn" href="/WebJava05/FormOperaciones.jsp" role="button">Volver a la calculadora</a>
	</div>
</body>
</html>




