<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>INICIO</title>
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
                <div class="well"><h1>I N I C I O <span class="glyphicon glyphicon-home"></span></h1></div>
            </div>
        </div>
        <div class="container">
            <table class="table table-bordered">
                 <thead>
                        <tr>
                            <th>Código cliente</th>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            </tr>
                     </thead>
                <tbody id="tabla">
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root", "");
                        Statement s = conexion.createStatement();
                        ResultSet listado = s.executeQuery ("SELECT CODCLI, NOMCLI, APECLI FROM CLIENTE");
                        while (listado.next()) {
                    %>

                    <tr>
                        <td><%= listado.getString("CODCLI") %></td>
                        <td><%= listado.getString("NOMCLI") %></td>
                        <td><%= listado.getString("APECLI") %></td>
                    </tr>
                    <%
                        }
                        conexion.close();
                    %>
                </tbody>
            </table>
    </body>
</html>
