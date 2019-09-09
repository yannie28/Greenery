<%-- 
    Document   : displayRecord
    Created on : Sep 8, 2017, 10:59:12 PM
    Author     : Arianne
--%>
<%@page import = "java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html>
<html>
    <head>
	<title>Inventory</title>

	<script src="Bootstrap/js/jquery.js"></script>
	<script src="Bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" href="Bootstrap/css/bootstrap.css">
        
        <script>
            function confirmDelete() {
                if (confirm('Are you sure you want to delete this item?')) {
                    form.submit();
                }
                else{
                    return false;
                }
            } 
        </script>
        
        <style>

            body,
            html {
                height: 100%;
                margin: 0;
                font-size: 16px;
                font-family: Champagne;
                background-color: #F2F2F2;
            }
            
            h2,h3,h4{
		color: #B97F6D;
                font-family: CodeBold;
                letter-spacing: 5px;
            }

            h5 {
                color: red;
            }

            input {
    		background: transparent;
    		border: 0;
  		outline: 0;
  		color: black;
                word-wrap:break-word;
            }
            
            table{
                border-collapse: collapse;
                width: 95%;
                border-color: white;
                table-layout:fixed;
            }
            
            tr{
                color: black;
            }
            
            td{
                padding: 5px;
            }
            
            .button{
                width: 80px;
                background: white;
            }
            
            textarea{
                border: 0px;
                outline: none;
                background-color: #F2F2F2;
            }
            
            ::-webkit-input-placeholder { /* Chrome/Opera/Safari */
                color: black;
            }
            
            @font-face {
                font-family: Champagne;
                src: url(Fonts/Champagne.ttf);
            }
            
            @font-face {
                font-family: CodeBold;
                src: url(Fonts/Code-Bold.otf);
            }
            
            aside {
                background: #093C33;
                height: 100%;
                left: 0;
                position: fixed;
                top: 0;
                width: 200px;
                margin-left: -40px;
            }
            
            ul {
                list-style: none;
                margin-top:40px;
            }
            
            header {
                font-family: Champagne;
                background: #093C33;
                height: 30px;
                left: 0;
                position: fixed;
                top: 0;
                width: 100%;
                z-index: 99;
            }
            
            .section {
                left: 0;
                margin-left: 160px;
                min-height: 100%;
                position: relative;
                width: 89.60%;
            }
            
            li a,
            li a:visited{
                display: block;
                padding: 2px 16px;
                text-decoration: none;
                color: white;
            }
            
            li a:hover:not(.focus){
                background-color: #000;
                color: #ffffff;
                text-decoration: none;
            }
            
            li a:focus { 
                background-color: #228B22;
                color: #ffffff;
                text-decoration: none;
            }
            
            li a:active{
                background-color: #228B22;
                color: #ffffff;
                text-decoration: none;
            }
            
            .icons-nav{
                height: 35px;
                width: 35px;
                padding: 5px;
                margin-right:2px;
            }
            
            .icons-header{
                padding: 5px;
                height: 35px;
                width: 35px;
                margin: 3px;
            }
            
            header a{
                text-decoration: none;
                color: white;
            }
            
            header a:hover{
                text-decoration: none;
                color: white;
            }
            
            header a:focus{
                text-decoration: none;
                color: white;
                float:right;
            }
            
            button{
                border: transparent;
                background-color: transparent;
                margin-left: -5px;
                outline: none;
            }
            
            .title{
                margin: 50px 2px 2px 35px;
                font-family: CodeBold;
                color: #B97F6D;
            }
            
            select{
                border-color: transparent;
                background-color: transparent;
                outline: none;
            }
            
            .logout{
                float: right;
                padding: 5px;
                margin-top: -43px;
                margin-right: 10px;
                color: #fff
            }
            
        </style>
    </head>
        
    <body>
       <aside>
            <nav>
              <ul>
                  <li><a href="admin.jsp"><img src="Images/icons_admin/dashboard.png" class="icons-nav">Dashboard</a></li>
                  <li>
                      <form action="ViewUsers">
                        <a>
                            <button type="submit" name="button" value="users"><img src="Images/icons_admin/user.png" class="icons-nav">
                                Users
                            </button>
                        </a>
                      </form>
                  </li>
                  <li style="background-color: #228B22; color: #ffffff; text-decoration: none;">
                      <form action="ViewInventory" method="post" name="inventory">
                        <a>
                            <button type="submit" name="button" value="inventory"><img src="Images/icons_admin/inventory.png" class="icons-nav">
                                Inventory
                            </button>
                        </a>
                      </form>
                  </li>
                  <li>
                      <form action="AdminServlet" method="post" name="transactions">
                            <a href="#">
                                <img src="Images/icons_admin/transaction.png" class="icons-nav">
                                Transactions
                            </a>
                      </form>
                  </li>
              </ul>
            </nav>
        </aside>
        <header>
            <a href="index.jsp"><img src="Images/icons_admin/logo.png" class="icons-header">Greenery</a>
            <form action="Signout">
                <div class="logout">
                    <button type="submit" name="button" value="logout">Logout</button>
                </div>
            </form>
        </header>
        
        <div class="section">
            <div class="title">
                    <h2>Inventory</h2>
            </div>
            <div style="margin-left: 35px;">
                <a href="insertItems.jsp">
                    <button class="btn btn-default btn-sm button">
                        Add New
                    </button>
                </a>
            </div>
            <center>
                <h5><b>
                            
                    <%--<c:set var="name" value='${requestScope["message1"]}' />--%>
                    <s:property value = "message"/>

                </b></h5>
            </center>
            <br>
            
            <div class="row">
                <div class="col-sm-1">
                    
                </div>
                <div class="col-sm-10">
                    <div class="row" style="background: #B97F6D">
                        <div class="col-sm-1">
                            <b>ID
                        </div>
                        <div class="col-sm-2">
                            <b>Description
                        </div>
                        <div class="col-sm-2">
                            <b>Category
                        </div>
                        <div class="col-sm-2">
                            <b>Quantity
                        </div>
                        <div class="col-sm-1">
                            <b>Price
                        </div>
                        <div class="col-sm-2">
                            <b>Filename
                        </div>
                        <div class="col-sm-1">
                            
                        </div>
                        <div class="col-sm-1">
                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-1">
                    
                </div>
            </div>
            
            <div class="row">
                <div class="col-sm-1">
                    
                </div>
                <div class="col-sm-10">
                    <c:forEach items="${list}" var="item" varStatus="counter">
                        <form action="InventoryAdmin"> 
                            <div class="row">
                                <div class="col-sm-1">
                                    <textarea cols="13" rows="2" type="text" readonly><c:out value="${item.getId()}"/></textarea>
                                </div>
                                <div class="col-sm-2">
                                    <textarea cols="13" rows="2" type="text" name="description" value = "${item.getDescription()}" onfocus="(this.value == '${item.getDescription()}') && (this.value = '')" onblur="(this.value == '') && (this.value = '${item.getDescription()}')"><c:out value="${item.getDescription()}"/></textarea>
                                </div>
                                <div class="col-sm-2">
                                    <textarea cols="13" rows="2" type="text" name="category" value = "${item.getCategory()}" onfocus="(this.value == '${item.getCategory()}') && (this.value = '')" onblur="(this.value == '') && (this.value = '${item.getCategory()}')"><c:out value="${item.getCategory()}"/></textarea>
                                </div>
                                <div class="col-sm-2">
                                    <textarea cols="13" rows="2" name="quantity" value = "${item.getQuantity()}" onfocus="(this.value == '${item.getQuantity()}') && (this.value = '')" onblur="(this.value == '') && (this.value = '${item.getQuantity()}')"><c:out value="${item.getQuantity()}"/></textarea>
                                </div>
                                <div class="col-sm-1">
                                    <textarea cols="13" rows="2" name="price" value = "${item.getPrice()}" onfocus="(this.value == '${item.getPrice()}') && (this.value = '')" onblur="(this.value == '') && (this.value = '${item.getPrice()}')"><c:out value="${item.getPrice()}"/></textarea>
                                </div>
                                <div class="col-sm-2">
                                    <textarea cols="20" rows="2" type="text" name="filename" value = "${item.getFilename()}" onfocus="(this.value == '${item.getFilename()}') && (this.value = '')" onblur="(this.value == '') && (this.value = '${item.getFilename()}')"><c:out value="${item.getFilename()}"/></textarea>
                                </div>
                                <div class="col-sm-1">
                                    <center>
                                        <button type="submit" name="update" value= "${item.getId()}" class="btn btn-default btn-sm button">
                                           Update
                                        </button>
                                    </center>
                                </div>
                                <div class="col-sm-1">
                                    <center>
                                        <c:if test="${type != 'Main'}">
                                            <button type="submit" name="delete" value= "${item.getId()}" class="btn btn-default btn-sm button" onclick = "return confirmDelete()">
                                                Delete
                                            </button>
                                        </c:if>
                                        <c:if test="${type == 'Main'}">
                                            Cannot be deleted
                                        </c:if>
                                     </center>
                                </div>
                            </div>
                        </form>
                    </c:forEach>  
                </div>
                <div class="col-sm-1">
                    
                </div>
            </div>
                <%--<div style="margin: 5px 2px 2px 35px; font-size: 14px">
                    <c:set var="numberUsers" value='${requestScope["numberUser"]}' />
                    <c:set var="numberAdmins" value='${requestScope["numberAdmin"]}' />
                    All(<c:out value="${numberUsers}"/>) | Administrator(<c:out value="${numberAdmins}"/>)
                </div>--%>
                <%--<form action="InventoryAdmin"> 
                    <table align = "center">
                        <tr style="background-color: #B97F6D">
                            <td><b>ID</td>
                            <td><b>Description</td>
                            <td><b>Category</td>
                            <td><b>Quantity</td>
                            <td><b>Price</td>
                            <td><b>Filename</td>
                            <td colspan = "2"></td>

                        </tr>
                        <%--<c:set var="list" value='${requestScope["message"]}' />    
                        <tr>
                            <c:set var="id" value = "1"/>
                            <c:set var="description" value = "2"/>
                            <c:set var="category" value = "3"/>
                            <c:set var="quantity" value = "4"/>
                            <c:set var="price" value = "5"/>
                            <c:set var="filename" value = "6"/>
                            <%--<c:set var="status" value = "7"/>

                            <c:forEach items="${list}" var="item" varStatus="counter">

                                <c:if test="${counter.count == id}">
                                    <c:set var="s" value = "${item}"/>
                                    <c:set var="id" value = "${id+6}"/>
                                    <td><textarea cols="13" rows="2" type="text" readonly><c:out value="${item}"/></textarea></td>
                                </c:if>

                                <c:if test="${counter.count == description}">
                                    <td><textarea cols="13" rows="2" type="text" name="description${s}" value = "${item}" onfocus="(this.value == '${item}') && (this.value = '')" onblur="(this.value == '') && (this.value = '${item}')"><c:out value="${item}"/></textarea></td>
                                    <c:set var="description" value = "${description+6}"/>
                                </c:if>

                                <c:if test="${counter.count == category}">
                                    <td><textarea cols="13" rows="2" type="text" name="category${s}" value = "${item}" onfocus="(this.value == '${item}') && (this.value = '')" onblur="(this.value == '') && (this.value = '${item}')"><c:out value="${item}"/></textarea></td>
                                    <c:set var="category" value = "${category+6}"/>
                                </c:if>

                                <c:if test="${counter.count == quantity}">
                                    <td><textarea cols="13" rows="2" name="quantity${s}" value = "${item}" onfocus="(this.value == '${item}') && (this.value = '')" onblur="(this.value == '') && (this.value = '${item}')"><c:out value="${item}"/></textarea></td>
                                    <c:set var="quantity" value = "${quantity+6}"/>
                                </c:if>
                                    
                                <c:if test="${counter.count == price}">
                                    <td><textarea cols="13" rows="2" name="price${s}" value = "${item}" onfocus="(this.value == '${item}') && (this.value = '')" onblur="(this.value == '') && (this.value = '${item}')"><c:out value="${item}"/></textarea></td>
                                    <c:set var="price" value = "${price+6}"/>
                                </c:if>

                                <c:if test="${counter.count == filename}">
                                    <td><textarea cols="20" rows="2" type="text" name="filename${s}" value = "${item}" onfocus="(this.value == '${item}') && (this.value = '')" onblur="(this.value == '') && (this.value = '${item}')"><c:out value="${item}"/></textarea></td>
                                    <c:set var="filename" value = "${filename+6}"/>
                                </c:if>

                                <c:if test="${counter.count % 6 == 0}">                     
                                    <td width = "50px">
                                            <center>
                                                <button type="submit" name="update" value= "${s}" class="btn btn-default btn-sm button">
                                                    Update
                                                </button>
                                            </center>
                                    </td>
                                    <td width = "50px">
                                            <center>
                                                <c:if test="${type != 'Main'}">
                                                <button type="submit" name="delete" value= "${s}" class="btn btn-default btn-sm button" onclick = "return confirmDelete()">
                                                    Delete
                                                </button>
                                                </c:if>
                                                <c:if test="${type == 'Main'}">
                                                    Cannot be deleted
                                                </c:if>
                                            </center>
                                    </td> 
                                    </tr><tr>        
                                </c:if>
                            </c:forEach>           
                    </table>
                </form>--%>   
                
               
                            
        </div>
    <body>   
</html>
