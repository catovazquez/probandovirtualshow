<%@page import="java.sql.ResultSet"%>
<%@page import="DBConnection.ConexionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>

      
        <h1>Ingrese Usuario y Clave</h1>
        <form >
            <br><br><input name="campoUsuario" type="text" placeholder="Usuario" value="prueba">
            <br><br><input name="campoClave" type="password" placeholder="Clave" value="">
            <br><br><input type="submit" value="Enviar">
        </form>

        <%
            ConexionDB con = new ConexionDB("root", "root", "jdbc:mysql://localhost:3306/virtualshow", "org.gjt.mm.mysql.Driver");
            con.conectar();
         
           String usuario = request.getParameter("campoUsuario");
           String clave = request.getParameter("campoClave");
           String insert = String.format("insert into usuarios values ('%s','%s')", usuario, clave);
           con.insertar(insert);
           String consultaPrueba = "select * from usuarios";
           ResultSet respuesta = con.consultar(consultaPrueba);

            //boolean usuarioValido = respuesta.next();
            //boolean noNulo = (request.getParameter("campoUsuario") != null && request.getParameter("campoClave") != null);
            //String mensaje = (usuarioValido) ? "Bienvenido" : "Usuario o clave incorrecto";
while (respuesta.next()){
%>
<h1><%= respuesta.getString(1)%></h1>
<h1><%= respuesta.getString(2)%></h1>
<% ; }
%>
            
       

   
    </body>
</html>
