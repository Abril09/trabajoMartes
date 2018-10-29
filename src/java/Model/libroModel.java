/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entidades.libro;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author programar
 */
public class libroModel {
     public libro verLibro() throws ClassNotFoundException, SQLException {
          libro cl = new libro();
           
        try {
            String Query = "SELECT * FROM librosBiblioteca where id_ejemplar=1";

            Statement st = Conexion.obtener().createStatement();
            ResultSet rs = st.executeQuery(Query);
         
            while (rs.next()) {
                
                cl.setId_ejemplar(rs.getInt("id_ejemplar"));
                cl.setIsbn(rs.getInt("ISBN"));
                cl.setTitulo(rs.getString("titulo"));
                cl.setEstado(rs.getString("Estado"));
                cl.setCategoria(rs.getString("Categoria"));
                cl.setAutor(rs.getString("Autor"));
                cl.setEditorial(rs.getString("Editorial"));
                cl.setUbicacion(rs.getString("ubicacion"));
                
             

                
            }
        } catch (Exception e) {
            //colcoar exepcion//

        } finally {
            Conexion.cerrar();

        }

           
    return cl;
    }
     //metodo filtra por titulo de libro con like//
   public List<libro> buscarLibro(String busqueda) throws ClassNotFoundException, SQLException {
        List<libro> list = new ArrayList();
        try {
            String Query = "select * from librosBiblioteca where  titulo like '%"+busqueda+"%'"+" or autor like '%"+busqueda+"%'"+" or Estado like '%"+busqueda+"%'"+" or ISBN like '%"+busqueda+"%'"+" or id_ejemplar like '%"+busqueda+"%'"+" or Categoria like '%"+busqueda+"%'"+" or ubicacion like '%"+busqueda+"%'";

            Statement st = Conexion.obtener().createStatement();
            ResultSet rs = st.executeQuery(Query);

            while (rs.next()) {
                libro cl = new libro();
                cl.setId_ejemplar(rs.getInt("id_ejemplar"));
                cl.setIsbn(rs.getInt("ISBN"));
                cl.setTitulo(rs.getString("titulo"));
                cl.setEstado(rs.getString("Estado"));
                cl.setCategoria(rs.getString("Categoria"));
                cl.setAutor(rs.getString("Autor"));
                cl.setEditorial(rs.getString("Editorial"));
              cl.setUbicacion(rs.getString("ubicacion"));

                list.add(cl);
            }
        } catch (Exception e) {
            //colcoar exepcion//

        } finally {
            Conexion.cerrar();
            

        }

           
    return list;
    }
     public List<libro> listarLibros() throws ClassNotFoundException, SQLException {
        List<libro> list = new ArrayList();
        try {
            String Query = "select * from librosBiblioteca ";

            Statement st = Conexion.obtener().createStatement();
            ResultSet rs = st.executeQuery(Query);

            while (rs.next()) {
                libro cl = new libro();
                cl.setId_ejemplar(rs.getInt("id_ejemplar"));
                cl.setIsbn(rs.getInt("ISBN"));
                cl.setTitulo(rs.getString("titulo"));
                cl.setEstado(rs.getString("Estado"));
                cl.setCategoria(rs.getString("Categoria"));
                cl.setAutor(rs.getString("Autor"));
                cl.setEditorial(rs.getString("Editorial"));
              cl.setUbicacion(rs.getString("ubicacion"));

                list.add(cl);
            }
        } catch (Exception e) {
            //colcoar exepcion//

        } finally {
            Conexion.cerrar();
            

        }

           
    return list;
    }
}
