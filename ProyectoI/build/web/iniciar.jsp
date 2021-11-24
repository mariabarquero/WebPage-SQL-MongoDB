<%-- 
    Document   : iniciar
    Created on : 14/10/2020, 10:56:13 AM
    Author     : Mariá José
--%>

<link href="css/estilos.css" rel="stylesheet" type="text/css"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">        
        <title>Iniciar Sesión</title>
        <link rel="stylesheet" href="css/inicio.css">
    </head>
    <body>
        <header class="header">
        <div class="container col-lg-3">            
            <form action="ControladorIniciarSalir">
                <div class="form-group text-center">
                    <img src="img/icono_login.png">
                    <p><strong>Ingresar</strong></p>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" name="txtCorreo" placeholder="example@gmail.com" class="form-control">
                </div>         
                <div class="form-group">
                    <label>Contraseña:</label>
                    <input type="password" name="txtCons" placeholder="Ingrese tu contraseña" class="form-control" >       
                </div>
                 <input class="btn btn-danger btn-block" type="submit" name="accion" value="Ingresar">                                 
            </form>
        </div>
        </header>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>