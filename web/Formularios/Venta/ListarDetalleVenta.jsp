<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >

        <!--datables CSS básico-->
        <link rel="stylesheet" type="text/css" href="Estilos/datatables/datatables.min.css"/>
        <!--datables estilo bootstrap 4 CSS-->  
        <link rel="stylesheet"  type="text/css" href="Estilos/datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">

        <!--font awesome con CDN-->  
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">  
        <link href="Estilos/main.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/EstiloTablas.css" rel="stylesheet" type="text/css"/>
        <link href="Estilos/CSS/scrollbarmostrar.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>     
        <form action="ControladorVenta">   
            <div class="card-header" >
                <h2>Detalles Ventas</h2>
            </div>
            <div  class="card d-flex">
                <div class="  form-control">
                    <div class="table-responsive">        
                        <table id="example" class="table "  width="100%">
                            <thead>
                                <tr>
                                    <th class="text-center">Id</th>
                                    <th class="text-center">Número de serie</th>
                                    <th class="text-center">Producto</th>
                                    <th class="text-center">Cantidad</th>          
                                    <th class="text-center">Precio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <jsp:useBean id="vdao" class="ModeloDAO.VentaDAO" scope="page" ></jsp:useBean>
                                <%
                                    int id = Integer.parseInt((String) request.getAttribute("iddven"));
                                    ResultSet rs = vdao.listardetallerv(id);
                                    while (rs.next()) {
                                %>
                                <tr>
                                    <td class="text-center"><%=rs.getInt("id_detalle_venta")%></td>
                                    <td class="text-center"><%=rs.getString("ventas.numero_serie")%></td>
                                    <td class="text-center"><%=rs.getString("producto.Nombre")%></td>
                                    <td class="text-center"><%=rs.getString("Cantidad")%></td>
                                    <td class="text-center"><%=rs.getString("precio")%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </form>
        <script src="Estilos/jquery/jquery-3.3.1.min.js"></script>
        <script src="Estilos/popper/popper.min.js"></script>
        <script src="Estilos/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="Estilos/datatables/datatables.min.js"></script>    
        <script type="text/javascript" src="Estilos/main.js"></script>
    </body>
</html>
