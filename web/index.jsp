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

    </head>
    <body onload="cargarPagina('cargar')">
        <script type="javascript/text" src="scriptprueba.js"></script>
        <div class="container">
            <div class="row" style="margin-top: 30px">
            <div class="input-group input-group-sm mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-sm">Small</span>
                </div>
                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" id="in">
            </div>
            </div>
            <div class="row">
           
        <table class="table col-md-10 ">
            <thead>
            <th>ID</th>
            <th>ISBN</th>
            <th>titulo</th>
            <th>Estado</th>
            <th>Ubicacion</th>
            </thead>
            <tbody id="tbody">
                
            </tbody>
        </table>
        </div>
            <!-- Modal -->
            <div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="titulo">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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


        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script> 
           
               $( "#in" ).keydown(function() {
                       $("#tbody tr").detach();
                        var t=$("input#in").val();
                        cargarPagina("buscar&id="+t);
                    });
               
           
            function cargarPagina (action){
                
                    $.ajax(
                            {
                                url: "nuevo?action="+action ,
                                type: "Get" ,
                                datatype: "json" ,
                                
                                success: function(data){
                                    
                                   var obj = $.parseJSON(data);
                                   
                                    for(var i=0;i<obj.length;i++){
                                        if(obj[i].Estado =="baja"){
                                            obj[i].ubicacion="No disponible"
                                        }
                                      var a=obj[i].isbn;

                                    var t="<tr>"+ "<td>"+ obj[i].id_ejemplar + "</td>"+
                                            "<td>" + obj[i].isbn + "</td>"+
                                            "<td>"+ obj[i].titulo +" </td> "+
                                            "<td>"+ obj[i].Estado +" </td> "+
                                             "<td>"+ obj[i].ubicacion +" </td> "+   
                                              "<td>"+ 
                                               "<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#ModalCenter' onclick='main(" + obj[i].isbn + ")' >detalle</button>"
        
                                            +"</td>"      
                                                        
                                            "</tr>"
                                        
                                                $('#tbody').append(t);
                                   }
                                   
                                }
                            }
                
                );
                    
                
                }
            
           

       
                   function traer() {
                       var vals = $("input#te").val();
                       return vals;

                   }
                   function main(isb) {
                       var isbn=isb;
                       data(isbn);
                       
                   }

                   function data(isbn) {
                       $.ajax(
                           {
                               url: "https://www.googleapis.com/books/v1/volumes?q=isbn:"+isbn ,
                               datatype: "json",
                               type: "get",
                               success: (function (data) {
       try{
                    var libro={
                    Titulo :  data["items"][0]["volumeInfo"]["title"] ,
                    ISBN : data["items"][0]["volumeInfo"]["industryIdentifiers"][1]["identifier"] ,
                    Autor : data["items"][0]["volumeInfo"]["authors"],
                    Descripcion : data["items"][0]["volumeInfo"]["description"] ,
                    Año: data["items"][0]["volumeInfo"]["publishedDate"],
                    Imagen : data["items"][0]["volumeInfo"]["imageLinks"]["smallThumbnail"],
                    Reseña: data["items"][0]["searchInfo"]["textSnippet"]
                    };

                                   $("#desc").text("Reseña"+ "\n"  +libro.Reseña)
                                   $("#titulo").text("Titulo:  " + libro.Titulo + "     "+     "ISBN: " + libro.ISBN)
                                   $("#as").attr("src",libro.Imagen)
                                   $("#dat3").text("Autor:  " + libro.Autor)
                                   $("#isbn").text("ISBN13:   " + libro.ISBN)
                                   $("#dat2").text("Año:   " + libro.Año)


                                    if (libro.Descripcion != null) {
                                        $("#dat").text("Descripcion:  " + libro.Descripcion);

                                    } else {
                                        $("#dat").hide();
                                    }
                                } catch (err) {
                                    $("#titulo").text("Error ")
                                    $("#as").attr("src", "descarga.jpg")
                                    $("#desc").text("")

                                    $("#dat").text("");
                                    $("#dat3").text("")
                                    $("#isbn").text("")
                                    $("#dat2").text("")
                                }



                            })

                        }


                );
            }

        </script>
    </body>

</html>
