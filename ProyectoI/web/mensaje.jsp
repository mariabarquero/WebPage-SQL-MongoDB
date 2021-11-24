<%-- 
    Document   : mensaje
    Created on : 17/10/2020, 11:25:26 AM
    Author     : Mariá José
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ECOMT</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/mensaje.css">
    </head>
    <body>        
        <header class="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">ECOMT</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                   <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                      <form action="Controlador" method="POST">
                          <input type="submit" name="accion" value="Inicio" class="btn btn-outline-info"><span class="sr-only">(current)</span>
                      </form>
                  </li>
                   <li class="nav-item active">
                      <form action="Controlador" method="POST">
                          <input type="submit" name="accion" value="Experiencia" class="btn btn-outline-info"><span class="sr-only">(current)</span>
                      </form>
                  </li>
                  <li class="nav-item">
                        <form action="Controlador" method="POST">
                         <input  type="submit" name="accion" value="Carrito" class="btn btn-outline-info">
                        </form>
                  </li>
                  
                  <li>
                        <div class="dropdown">
                               <a style="color:white" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Categoría</a>
                               <div class="dropdown-menu text-center">
                                   <div class="dropdown-divider"></div>
                                   <form action="ControladorCategoria" method="POST">
                                       <a href="ControladorCategoria?accion=mascota" type="submit" name="accion" value="mascota" class="btn btn-light">Mascota</a>                                
                                   </form> 
                                   <form action="ControladorCategoria" method="POST">
                                       <a href="ControladorCategoria?accion=hogar" type="submit" name="accion" value="hogar" class="btn btn-light">Hogar</a>                                
                                   </form>    
                                   <form action="ControladorCategoria" method="POST">
                                        <a href="ControladorCategoria?accion=cuidado_personal" type="submit" name="accion" value="cuidado_personal" class="btn btn-light">Cuidado Personal</a>
                                   </form>     
                                   <form action="ControladorCategoria" method="POST">
                                       <a href="ControladorCategoria?accion=nuestros_productos" type="submit" name="accion" value="nuestros_productos" class="btn btn-light">Nuestros Productos</a>                                
                                   </form>                                          
                               </div>
                        </div>  
                     </li>
                 </ul>
                 <div class="dropdown">
                        <a style="color:white" href="#" class="nav-link dropdown-toggle ml-5" data-toggle="dropdown">Sesión</a>
                        <div class="dropdown-menu text-center">
                            <div class="dropdown-divider ml-5">     
                            </div>
                            <c:forEach var="informa" items="${info}">
                                <label>${informa.getCedula()}</label>
                                <label>${informa.getNombre()}</label>
                            </c:forEach>
                            <form action="Controlador" method="POST">
                                 <a href="iniciar.jsp" type="submit" name="accion" value="Iniciar" class="btn btn-light">Iniciar Sesión</a>
                            </form>          
                            <form action="Controlador" method="POST">
                                <a href="ControladorIniciarSalir?accion=Salir" type="submit" name="accion" value="Salir" class="btn btn-light">Salir Sesión</a>                                
                            </form> 
                        </div>
                 </div>                
            </div>
            </nav>
        </header>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
