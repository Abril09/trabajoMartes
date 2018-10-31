<%-- 
    Document   : index
    Created on : 27-10-2018, 20:26:12
    Author     : programar
--%>

<%@page import="Entidades.libro"%>
<%@page import="Model.libroModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>


    <head>
        <script type="text/javascript" src="folder/scriptprueba.js"></script>
         <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1">
        <LINK REL=StyleSheet HREF="folder/estilo.css" TYPE="text/css" MEDIA=screen>
    </head>
    <body >
        <header>  
            <div class="jumbotron jumbotron-fluid" >
              <div class="container">
                <h1 class="display-3">BiblioNet S.A.</h1>
                <p class="lead">Sistema de busqueda de libros en línea.</p>
              </div>
            </div>
        </header>
        <div class="container" id="content">
            <div class="row" style="margin-top: 30px">
            
              <div class="input-group mb-3">
                  <input type="text" class="form-control" placeholder="Ingrese Isbn del libro u autor" aria-label="Recipient's username" aria-describedby="button-addon2" id="textbuscar">
                  <div class="input-group-append">
                    <button class="btn btn-dark" type="button" id="button-addon2" onclick="buscarLibro()">Buscar</button>
                  </div>
                </div>
          
            
            </div>
            <div class="row">
           
        <table class="table col-md-10 ">
            <thead class="thead-dark">
            <th scope="col">#</th>
            <th scope="col">ISBN</th>
            <th scope="col">titulo</th>
            <th scope="col">Estado</th>
            <th scope="col">Ubicacion</th>
            <th scope="col">Categoria</th>
            <th scope="col">Accion</th>
            </thead>
            <tbody id="tbody">
                
            </tbody>
        </table>
        </div>
            <!-- Modal -->
            <div  class="modal fade" id="ModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="titulo">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="card-deck col-md-12">
                                        <div class="card  border-light mb-3" style="width: 100%;">
                                            <center>
                                                <img class="card-img-top" src="http://books.google.com/books/content? 

                                                     id=h1CJtgAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api" alt="Libro" style="width: 12rem;" id="as">
                                            </center>
                                        </div>
                                        <div class="card-body">

                                            <br /> <p id="isbn" class="card-text"></p>
                                            <p id="dat2" class="card-text"></p>
                                            <p id="dat3"  class="card-text"> </p>
                                            <p class="card-text" id="desc"></p>
                                            <p id="dat" class="card-text"></p>
                                        </div>
                                    </div>
                                </div>



                            </div>
                        </div>
                        <div class="modal-footer">

                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>


        </div >

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script> 
               
            
            $(document).ready(function(){
                cargarPagina('cargar');
                
            });
            
        
             
           function buscarLibro(){
                $("#tbody tr").detach();
                 var t=$("input#textbuscar").val();
                 
                 cargarPagina("buscar&id="+t);
               
           };
           

        </script>
    </body>

</html>
