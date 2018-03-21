<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <title>MODIFICADO</title>
  </head>
  <body>
      <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">B E A U T Y </a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">INICIO</a></li>
                <li><a href="cliente.jsp">CLIENTES</a></li>
                <li><a href="productos.jsp">PRODUCTOS</a></li>
            </ul>
        </div>
    </nav>
      <div class="container">
            <div class="page-header">
                <div class="well"><h1>M O D I F I C A R  </h1></div>
            </div>
        </div>
      
      <%int id = Integer.valueOf(request.getParameter("CODCLI"));
      
      %>
    <% request.setCharacterEncoding("UTF-8"); %>
   
          <form  class="navbar-form navbar-left" method="get" action="grabamodificado.jsp" style="margin-left: 90px">
            <div class="form-group">
            <label>&nbsp;&nbsp;Nombre:&nbsp;</label><input type="text" size="35" name="NOMCLI" >
            <input  type="int" size="35" name="CODCLI" hidden="hidden" value="<% out.print(id); %>" required="">
            </div>
            <div class="form-group">
             <label>&nbsp;&nbsp;Apellidos:&nbsp;</label><input type="text" size="5" name="APECLI" required="">
             <label>&nbsp;&nbsp;DNI:&nbsp;</label><input type="text" size="5" name="DNICLI"  required="" pattern="(([X-Z]{1})([-]?)(\d{7})([-]?)([A-Z]{1}))|((\d{8})([-]?)([A-Z]{1}))" >
            </div>
            <div class="form-group">
             <label>&nbsp;&nbsp;TLF:&nbsp;</label><input type="text" name="TLFCLI" size="20" required="" pattern="[6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]">
            </div>
            <hr>
            &nbsp;&nbsp;<a href="index.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
            <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button><br><br>
          </form>

      </div>
      
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
