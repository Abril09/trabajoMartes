
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: #B78479">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<header style="background-color: #007; text-align: center; padding: 50px; color: white">
    <h1>Formulario.</h1>
</header>

<div class="row" style="margin-top: 80px; border-color: #000;background-size: cover;  background-image: url(https://www.editorialsananda.es/wp-content/uploads/2016/06/Convierte-tu-pasion-en-un-libro-real_2.jpg); display: block; padding: 20px">
    <div class="col-md-1" ></div>
    <center><div class="col-md-10">
    Isbn:<br/><input type="text" minlength="10" maxlength="13" name="txtIsbn" value="" size="40">
    <input class="btn btn-warning" type="submit" value="Aceptar" id="ocul">
    <div id="ocultar">
        Titulo:<br/><input type="text" name="txtTitulo" value="" size="40"></br></br>
        Estado:<br/><input type="text" name="txtEstado" value="" size="40"> </br></br>
        Categoria:<br/><select> 
            <option value="" name="leng[]">Hola</option>
            <option value="" name="leng[]">Hola</option>
            <option value="" name="leng[]" >Hola</option>
            <option value="" name="leng[]" >Hola</option>
            <option value="" name="leng[]">Hola</option>
            <option value="" name="leng[]" >Hola</option>
            <option value="" name="leng[]">Hola</option>
        </select></br></br>
        Autor:<br/><select> 
            <option value="1" >Hola</option>
            <option value="1" >Hola</option>
            <option value="1" >Hola</option>
            <option value="1" >Hola</option>
            <option value="1" >Hola</option>
            <option value="1" >Hola</option>
            <option value="1" >Hola</option>
        </select></br></br>
        Editorial:<br/><select> 
            <option value="1" >Hola</option>
            <option value="1" >Hola</option>
            <option value="1" >Hola</option>
            <option value="1" >Hola</option>
            <option value="1" >Hola</option>
            <option value="1" >Hola</option>
            <option value="1" >Hola</option>
        </select></br></br>
        Ubicacion:<br/><input type="text" name="txtUbicacion" value="" size="40"></br></br>
        <input class="btn btn-warning" type="submit" value="Aceptar">
           <input  class="btn btn-danger" type="reset" value="Borrar">
           </div>
     </div>
<div class="col-md-1"></div>         
<script>
    $(document).ready(function(){
        $("ocul").click(function(){
            $('#ocular').hide();
            alert("hola");
        });
        
        
        
    }
    );
</script>
    
    </body>
    
</html>
