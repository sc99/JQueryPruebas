<%-- 
    Document   : visualizacion
    Created on : 26/07/2016, 12:12:28 PM
    Author     : Saul
--%>

<%@page import="java.awt.event.ActionEvent"%>
<%@page import="java.awt.event.ActionListener"%>
<%@page import="javax.swing.Timer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int cantidad=0;
    Clases.cAlumnos alumno =new Clases.cAlumnos();
 
  
  /*Timer timer = new Timer (5000,new ActionListener() 
{ 
    public void actionPerformed(ActionEvent e) 
    {        
        alumno.numAlumnos();
    } 
});  

timer.start();*/
    
    
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>
        <script type="text/javascript">

           window.setInterval("carga()",3000);
            function carga(){
                $("#alumnos").ready(
                        $.get("sDatos",function(respuesta){
                          //  $("#alumnos").text(respuesta)
                          alert(respuesta)
                        }
                    )
                  )
            }
        </script>
    </head>
    <body>
        <div id="alumnos">
            <%=alumno.numAlumnos()%>
        </div>
        
    </body>
</html>
