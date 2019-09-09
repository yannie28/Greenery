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
	<title>Accounts</title>

	<script src="Bootstrap/js/jquery.js"></script>
	<script src="Bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" href="Bootstrap/css/bootstrap.css">
        
        <script>
            function confirmDelete() {
                if (confirm('Are you sure you want to delete this user?')) {
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
            
            .row{
                width: 108%;
                margin-left: -52px;
            }
            
        </style>
    </head>
        
    <body>
       <aside>
            <nav>
              <ul>
                  <li><a href="admin.jsp"><img src="Images/icons_admin/dashboard.png" class="icons-nav">Dashboard</a></li>
                  <li style="background-color: #228B22; color: #ffffff; text-decoration: none;">
                      <form action="UserManagement" method="post">
                          <a>
                            <button type="submit" name="button" value="users"><img src="Images/icons_admin/user.png" class="icons-nav">
                                Users
                            </button>
                          </a>
                      </form>
                  </li>
                  <li><form action="ViewInventory">
                          <a>
                            <button type="submit" name="button" value="inventory"><img src="Images/icons_admin/inventory.png" class="icons-nav">
                                Inventory
                            </button>
                          </a>
                      </form>
                  </li>
                  <li>
                      <form action="ViewInventory">
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
                    <h2>User Account Database</h2>
            </div>
            <div style="margin-left: 35px;">
                <a href="create.jsp">
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
                <div style="margin: 5px 2px 2px 35px; font-size: 14px">
                    <%--<c:set var="numberUsers" value='${requestScope["numberUser"]}' />
                    <c:set var="numberAdmins" value='${requestScope["numberAdmin"]}' />--%>
                    All(<s:property value="numberOfUsers"/>) | Administrator(<s:property value="numberOfAdmins"/>)
                </div>
                <%--<form action="UserManagement" method="post">--%> 
                <div class="row">
                    <div class ="col-sm-1">
                        
                    </div>
                    <div class ="col-sm-10">
                        <div class="row" style="background: #B97F6D">
                            <div class="col-xs-1">
                                <b>ID
                            </div>
                            <div class="col-sm-2">
                                <b>Last Name
                            </div>
                            <div class="col-sm-2">
                                <b>First Name
                            </div>
                            <div class="col-sm-2">
                                <b>Username
                            </div>
                            <div class="col-sm-1">
                                <b>Password
                            </div>
                            <div class="col-sm-1">
                                <b>User Type
                            </div>
                            <div class="col-sm-1">
                                <b>Status
                            </div>
                            <div class="col-sm-1">
                                <b>Update
                            </div>
                            <div class="col-sm-1">
                                <b>Delete
                            </div>
                        </div>
                    </div>
                    <div class ="col-sm-1">
                        
                    </div> 
                </div>
                
                <div class="row">
                    <div class ="col-sm-1">
                        
                    </div>
                    <div class ="col-sm-10">
                        <c:forEach items="${list}" var="item" varStatus="counter">
                            <form action="UserManagement">
                                <div class="row">
                                    <div class="col-xs-1">
                                            <textarea cols="13" rows="2" type="text" readonly><c:out value="${item.getId()}"/></textarea>
                                    </div>
                                    <div class="col-sm-2">
                                            <textarea cols="25" rows="2" type="text" name="lastname" value = "${item.getLastname()}" onfocus="(this.value == '${item.getLastname()}') && (this.value = '')" onblur="(this.value == '') && (this.value = '${item.getLastname()}')"><c:out value="${item.getLastname()}"/></textarea>
                                    </div>
                                        
                                    <div class="col-sm-2">
                                        <textarea cols="25" rows="2" type="text" name="firstname" value = "${item.getFirstname()}" onfocus="(this.value == '${item.getFirstname()}') && (this.value = '')" onblur="(this.value == '') && (this.value = '${item.getFirstname()}')"><c:out value="${item.getFirstname()}"/></textarea>
                                    </div>

                                    <div class="col-sm-2">
                                        <textarea cols="25" rows="2" name="username" value = "${item.getUsername()}" onfocus="(this.value == '${item.getUsername()}') && (this.value = '')" onblur="(this.value == '') && (this.value = '${item.getUsername()}')"><c:out value="${item.getUsername()}"/></textarea>
                                    </div>
                                        
                                    <div class="col-sm-1">
                                        <textarea cols="13" rows="2" type="text" name="password" value = "${item.getPassword()}" onfocus="(this.value == '${item.getPassword()}') && (this.value = '')" onblur="(this.value == '') m}&& (this.value = '${item.getPassword()}')"><c:out value="${item.getPassword()}"/></textarea>
                                    </div>
                                        
                                        <c:set var="type" value="${item.getUsertype()}"/>
                                        <div class="col-sm-1">
                                        <select name = "usertype">
                                            <option selected = "selected">
                                                <c:out value="${type}"/>
                                            </option>
                                            <c:if test="${type == 'Admin'}">
                                                <option value="Customer">
                                                    <h4>Customer</h4>
                                                </option>
                                            </c:if>
                                            <c:if test="${type == 'Customer'}">
                                                <option value="Admin">
                                                    <h4>Admin</h4>
                                                </option>
                                            </c:if>
                                        </select>
                                        </div>
                                        
                                        <c:set var="stat" value="${item.getStatus()}"/>
                                        <div class="col-sm-1">
                                        <select name = "status">
                                            <option selected = "selected">
                                                <c:out value="${stat}"/>
                                            </option>
                                            <c:if test="${stat == 'Active' && type == 'Customer'}">
                                                <option value="Inactive">
                                                    <h4>Inactive</h4>
                                                </option>
                                            </c:if>
                                            <c:if test="${stat == 'Inactive'}">
                                                <option value="Active">
                                                    <h4>Active</h4>
                                                </option>
                                            </c:if>
                                        </select>
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
                    <div class ="col-sm-1">
                        
                    </div> 
                </div>
        </div>
    <body>   
</html>
