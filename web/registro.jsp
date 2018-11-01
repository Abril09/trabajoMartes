<%-- 
    Document   : index
    Created on : 14-09-2018, 1:38:18
    Author     : Gonzalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script type="text/javascript" src="folder/scriptprueba.js"></script>
       
    </head>
    <body>
      
        <div class="container" style="padding:2px">
            <div class="row" style="height: 50px;"></div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-10 ">
                    <form method="post" action="nuevo?action=CrearEjemplar" name="formulario" >
                        <div class="form-row">

                            <div class="form-group col-md-5">
                                <label for="Nombre" class="mr-sm-2">  ISBN  </label>
                                <input type="number" placeholder="Nombre" name="ISBN" class= "form-control form-control-sm" id="isbn" required="True" >

                            </div>
                            <div class="col-md-5" style="margin-top: 31px" >
                                <button type="button" class="btn btn-outline-success" onclick="llamarLibro()">buscar</button>

                            </div>
                            <div class="form-group col-md-5">
                                <label for="Apellido" class="mr-sm-2">  Titulo  </label>
                                <input type="text" placeholder="Apellido" name="Apellido" class= "form-control form-control-sm" id="titulo" required="True">
                            </div>
                            <div class="form-group col-md-5  ">

                            </div>

                            <div class="form-group col-md-5  ">
                                <label for="direcion" class="mr-sm-2">  Estado  </label>
                                <input type="text" placeholder="Estado" name="direccion" class= "form-control form-control-sm" id="estado" >
                            </div>

                            <div class="form-group col-md-5 ">

                            </div>
                            <div class="form-group col-md-5">
                                <label for="Apellido" class="mr-sm-2">  ubicacion  </label>
                                <input type="text" placeholder="Apellido" name="ubicacion" class= "form-control form-control-sm" id="ubicacion" required="True">
                            </div>
                            <div class="form-group col-md-5 ">

                            </div>
                            <div class=" col-md-5  ">
                                <label for="categoria" class="mr-sm-2">  categoria </label>
                                <select class="custom-select custom-select-sm" id="categoria">
                                    <option selected>Categoria</option>

                                </select>
                            </div>
                            <div class="form-group col-md-5 ">
                                <input type="hidden" id="id_isbn" name="id_isbn"/>
                            </div>
                            <div class=" col-md-5  ">
                                <label for="categoria" class="mr-sm-2">  Autor </label>
                                <select class="custom-select custom-select-sm" id="autor">
                                    <option selected>Autor</option>

                                </select>
                            </div>

                            <div class="form-group col-md-5 ">
                            </div> 

                            <div class=" col-md-5  ">
                                <label for="categoria" class="mr-sm-2">  Editorial </label>
                                <select class="custom-select custom-select-sm" id="editorial">
                                    <option selected>Autor</option>

                                </select>
                            </div>



                            <div class="col-md-5" ></div>
                            <div class="form-group col-md-5  " style="margin-top: 50px">
                                <input type="submit" class="btn btn-primary btn-md" value="Enviar">
                            </div>

                        </div>                
                    </form>

                </div>



            </div>

        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <script >
             
               function llamarLibro(){
                   var t=$("#isbn").val();
                   cargarForm("libro&isbn="+t);
                    
               };
        </script>    

    </body>
</html>
