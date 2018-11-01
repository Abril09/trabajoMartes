 function cargarPagina(action) {
    //metodo para cargar de pagina consulta base de datos
    $.ajax(
            {
                url: "nuevo?action=" + action,
                type: "Get",
                datatype: "json",

                success: function (data) {
                    
                    var obj = $.parseJSON(data);
                    var t = action.split('=');
                    var index=t[1];
                    for (var i = 0; i < obj.length; i++) {
                        if (obj[i].Estado == "baja") {
                            obj[i].ubicacion = "No disponible";
                        }
                        
                        var a = obj[i].isbn;
                        var fila="<tr  id='rw'>";
                        
                        if(index== obj[i].isbn || index== obj[i].id_ejemplar){
                               fila="<tr style='color:red;' id='rw'>"
                               t =  fila+"<th scope='row'>" + obj[i].id_ejemplar + "</td>" +
                                "<td>" + obj[i].isbn + "</td>" +
                                "<td>" + obj[i].titulo + " </td> " +
                                "<td>" + obj[i].Estado + " </td> " +
                                "<td>" + obj[i].ubicacion + " </td> " +
                                "<td>" + obj[i].Categoria + " </td> " +
                                "<td>" +
                                "<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#ModalCenter' onclick='main(" + obj[i].isbn + ")' >detalle</button>"

                                + "</td>" + "</tr>" ;
                        break;
                       } else{
                           t =  fila+"<th scope='row'>" + obj[i].id_ejemplar + "</td>" +
                                "<td>" + obj[i].isbn + "</td>" +
                                "<td>" + obj[i].titulo + " </td> " +
                                "<td>" + obj[i].Estado + " </td> " +
                                "<td>" + obj[i].ubicacion + " </td> " +
                                "<td>" + obj[i].Categoria + " </td> " +
                                "<td>" +
                                "<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#ModalCenter' onclick='main(" + obj[i].isbn + ")' >detalle</button>"

                                + "</td>" + "</tr>"+t ;
                           
                           
                       }                       

                    }
                    $('#tbody').append(t);
                }
            }

    );


}





function main(isb) {
    var isbn = isb;
    data(isbn);

}
//Metodo para buscar info desde API de google
function data(isbn) {
    $.ajax(
            {
                url: "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn,
                datatype: "json",
                type: "get",
                success: (function (data) {
                    try {
                        var libro = {
                            Titulo: data["items"][0]["volumeInfo"]["title"],
                            ISBN: data["items"][0]["volumeInfo"]["industryIdentifiers"][1]["identifier"],
                            Autor: data["items"][0]["volumeInfo"]["authors"],
                            Descripcion: data["items"][0]["volumeInfo"]["description"],
                            Año: data["items"][0]["volumeInfo"]["publishedDate"],
                            Imagen: data["items"][0]["volumeInfo"]["imageLinks"]["smallThumbnail"],
                            Reseña: data["items"][0]["searchInfo"]["textSnippet"]
                        };

                        $("#desc").text("Reseña" + "\n" + libro.Reseña)
                        $("#titulo").text("Titulo:  " + libro.Titulo + "     " + "ISBN: " + libro.ISBN)
                        $("#as").attr("src", libro.Imagen)
                        $("#dat3").text("Autor:  " + libro.Autor)
                        $("#isbn").text("ISBN:   " + libro.ISBN)
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
 function cargarForm(action) {
    var t = action.split('=');
    var index=t[1];
    $.ajax(
            {
                url: "nuevo?action=" + action,
                type: "Get",
                datatype: "json",
                success: function (data) {
                   
                    try {

                        var obj = $.parseJSON(data);
                        alert(obj.id_ejemplar);
                        if (obj.id_ejemplar != 0) {
                            var libro = {
                                id_ejemplar:obj.id_ejemplar,
                                isbn: obj.ISBN,
                                titulo: obj.titulo,
                                                              
                                categoria: obj.Categoria,
                                autor: obj.Autor,
                                editorial:obj.Editorial

                            };
                            if (libro != null) {
                                alert(obj.id_ejemplar + "-" +obj.isbn);
                                $("input#titulo").val(libro.titulo);
                                $("input#estado").val("Disponible");
                                $("#categoria option:selected").text(libro.categoria);
                                $("#autor option:selected").text(libro.autor);
                                 $("#editorial option:selected").text(libro.editorial);
                                 $("#id_isbn").val(obj.id_ejemplar);
                                $('input').prop('readonly', true);
                                $('#ubicacion').prop('readonly', false);
                            }
                        } else {
                            alert(index);

                            $.ajax(
                                    {
                                        url: "https://www.googleapis.com/books/v1/volumes?q=isbn:" + index,
                                        datatype: "json",
                                        type: "get",
                                        success: (function (data) {

                                            var libro = {
                                                titulo: data["items"][0]["volumeInfo"]["title"],
                                                isbn: data["items"][0]["volumeInfo"]["industryIdentifiers"][1]["identifier"],
                                                autor: data["items"][0]["volumeInfo"]["authors"],
                                                editorial: data["items"][0]["volumeInfo"]["publisher"],
                                                
                                            };

                                            alert(libro.editorial);
                                                $("input#isbn").val(libro.isbn);
                                                $("input#titulo").val(libro.titulo);
                                                $("input#estado").val("Disponible");
                                                $("#editorial option:selected").text(libro.editorial);
                                                $("#autor option:selected").text(libro.autor);
                                                $('input').prop('readonly', true);



                                        })

                                    }


                            );
            
            
        }

        }       catch (err){


                }
        } 
}

);


}