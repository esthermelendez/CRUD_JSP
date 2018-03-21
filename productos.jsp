<%-- 
    Document   : producto
    Created on : 17-mar-2018, 16:53:01
    Author     : meloc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>PRODUCTOS</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">B E A U T Y </a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">INICIO</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">OPCIONES
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="formulariocli.jsp">AÑADIR PERFIL</a></li>
                        <li><a href="borrado.jsp">BORRAR PERFIL</a></li>
                    </ul>
                </li>
                <li><a href="cliente.jsp">CLIENTES</a></li>
                <li><a href="productos.jsp">PRODUCTOS</a></li>
            </ul>
        </div>
    </nav>
        <div class="container">
            <div class="page-header">
                <div class="well"><h1>P R O D U C T O S  <span class="glyphicon glyphicon-scissors"></span></h1></div>
            </div>
        </div>
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Código Producto</th>
                        <th>Nombre</th>
                        <th>Stock</th>
                    </tr>
                </thead>
                <tbody id="tabla">
                    <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","");
                    Statement s = conexion.createStatement();
                    ResultSet listado = s.executeQuery ("SELECT CODPRO, NOMPRO, STOPRO FROM PRODUCTO");
                    while (listado.next()) {
                    %>
                    <tr>
                      <td><%= listado.getString("CODPRO") %></td>
                      <td><%= listado.getString("NOMPRO") %></td>
                      <td><%= listado.getString("STOPRO") %></td>
                    </tr>
                    
                    <%
                    }
                    conexion.close();
                    %>
                </tbody>
        </table>
    </body>
</html>

