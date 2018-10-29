<%-- 
    Document   : index
    Created on : 27-10-2018, 20:26:12
    Author     : programar
--%>

<%@page import="Entidades.libro"%>
<%@page import="Model.libroModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% libroModel l = new libroModel();
    //for (libro elem : l.verLibro()) {
    //out.print("<br />"+elem.getTitulo()+" - "+elem.getEstado()+ " - "+elem.getCategoria() +" - " +elem.getAutor() +" - "+ elem.getId_ejemplar() +" - "+elem.getIsbn());

    // }
    String var = request.getParameter("id");

    for (libro elem : l.buscarLibro(var)) {
        out.print("<br />" + elem.getTitulo() + " - " + elem.getEstado() + " - " + elem.getCategoria() + " - " + elem.getAutor() + " - " + elem.getId_ejemplar() + " - " + elem.getIsbn() + " - " + elem.getUbicacion());

    }
    out.print(l.verLibro().toString());

%>
<html>


    <head>

    </head>
    <body onload="dos()">
        <script type="javascript/text" src="scriptprueba.js"></script>
        <div class="container">
            <div class="row">
           
        <table class="table col-md-10 ">
            <thead>
            <th>ID</th>
            <th>ISBN</th>
            <th>titulo</th>
            </thead>
            <tbody id="tbody">
                
            </tbody>
        </table>
        </div>
            </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script> 
           
            function dos (){
                
                    $.ajax(
                            {
                                url: "nuevo" ,
                                type: "GET" ,
                                datatype: "json" ,
                                data : {titulo:"r"},
                                success: function(data){
                                    
                                   var obj = $.parseJSON(data);
                                    
                                    for(var i=0;i<obj.length;i++){
                                    var t="<tr>"+ "<td>"+ obj[i].id_ejemplar + "</td>"+
                                            "<td>" + obj[i].isbn + "</td>"+
                                            "<td>"+ obj[i].titulo +" </td> "+
                                                
                                                
                                                
                                            "</tr>"
                                        
                                                $('#tbody').append(t);
                                   }
                                   
                                }
                            }
                
                );
                    
                
                }
            
           

        </script>
    </body>

</html>
