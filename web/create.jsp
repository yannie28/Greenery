<%-- 
    Document   : admin
    Created on : Sep 30, 2017, 7:08:04 PM
    Author     : Arianne
--%>

<%@page import = "java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
        
        <script src="Bootstrap/js/jquery.js"></script>
	<script src="Bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" href="Bootstrap/css/bootstrap.css">
        
        <style>
            
            @font-face {
                font-family: Champagne;
                src: url(Fonts/Champagne.ttf);
            }
            
            @font-face {
                font-family: CodeBold;
                src: url(Fonts/Code-Bold.otf);
            }
            
            body,
            html {
                height: 100%;
                margin: 0;
                font-size: 16px;
                font-family: Champagne;
            }
            
            h2,h3,h4{
		color: #B97F6D;
                font-family: CodeBold;
                letter-spacing: 5px;
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
            
            section {
                background: #FFF;
                height: 100%;
                margin-top: 50px;
                background-color: #F2F2F2;
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
            
            .container {
                left: 0;
                margin-left: 160px;
                min-height: 100%;
                position: relative;
                width: 89.60%;
                background-color: #F2F2F2;
            }
            
            li a,
            li a:visited{
                display: block;
                padding: 2px 16px;
                text-decoration: none;
                color: white;
            }
            
            li a:hover:not(.active){
                background-color: #000;
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
            
            input{
    		background: #fff;
    		border: 0;
  		outline: 0;
                border: transparent;
  		width: 400px;
  		color: #000;
  		text-align: left;
  		font-size: 20px;
  		font-family: Champagne;
                height: 30px;
                margin-left: 50px;
                margin-bottom: 40px;
            }
            
            .radiobutton{
  		background: #fff;
                width: 400px;
    		border: 0;
  		outline: 0;
                border: transparent;
                color: #000;
  		font-size: 20px;
  		font-family: Champagne;
                margin-left: 50px;
            }
            
            .radioelement{
                color: black;
  		font-size: 20px;
  		font-family: Champagne;
            }
            
            ::-webkit-input-placeholder {
                color: #B97F6D;
            }
            
            input:focus::-webkit-input-placeholder { 
                color:transparent; 
            }
            
            .title{
                margin: 50px 2px 2px 35px;
                font-family: CodeBold;
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
                  <li style="background-color: #228B22; color: #ffffff; text-decoration: none;"><a href="admin.jsp"><img src="Images/icons_admin/dashboard.png" class="icons-nav">Dashboard</a></li>
                  <li>
                    <form action="ViewUsers">
                        <a>
                            <button type="submit" name="button" value="users"><img src="Images/icons_admin/user.png" class="icons-nav">
                                Users
                            </button>
                        </a>
                    </form>
                  </li>
                  <li>
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
                        <a href="#"><img src="Images/icons_admin/transaction.png" class="icons-nav">
                            Transactions
                        </a>
                      </form>
                  </li>
              </ul>
            </nav>
        </aside>
        <header>
            <a href="index.jsp"><img src="Images/icons_admin/logo.png" class="icons-header">Greenery</a>
            <form action="SignoutServlet" method="post">
                <div class="logout">
                    <button type="submit" name="users" value="users">Logout</button>
                </div>
            </form>
        </header>
        <div class="container">
            <div class="section">
                <div class="title">
                    <h2>ADD NEW USER</h2>
                </div>
                <div style="margin-left: 35px">
                    Create a new user as customer or admin
                    <br><br>
                    <%--<c:set var="name" value='${requestScope["successCreate"]}' />--%>
                    <div style="color: red"><s:property value="message"/></div>
                    <br>
                </div>
                <form action="CreateUsers" style="margin-left: 35px">
                    <table width="70%">
                        <tr>
                            <td><div style="margin-bottom: 40px; font-size: 20px;">First Name</div></td>
                            <td><input type="text" name="firstname" required></td>
                        </tr>
                        
                        <tr>
                            <td><div style="margin-bottom: 40px; font-size: 20px;">Last Name</div></td>
                            <td><input type="text" name="lastname" required></td>
                        </tr>
                        
                        <tr>
                            <td><div style="margin-bottom: 40px; font-size: 20px;">Username</div></td>
                            <td><input type="text" name="username" required></td>
                        </tr>
                        
                        <tr>
                            <td><div style="margin-bottom: 40px; font-size: 20px;">Password</div></td>
                            <td><input type="text" name="password" required></td>
                        </tr>
                        
                        <tr>
                            <td><div style="margin-bottom: 5px; font-size: 20px;">Usertype</div></td>
                            <td>
                                <select name = "usertype" class="radiobutton">
                                    <option value selected disabled class="radioelement" style="color:grey !important">
                                        <h4>
                                            Usertype
                                        </h4>
                                    </option>
                                    <option value="Admin" class="radioelement" selected = "selected">
                                        <h4>
                                            Admin
                                        </h4>
                                    </option>
                                    <option value="Student" class="radioelement">
                                        <h4>
                                            Customer
                                        </h4>
                                    </option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <!--
                    First Name<input type="text" name="firstname" required><br>
                    Last Name<input type="text" name="lastname" required><br>
                    Username<input type="text" name="username" required><br>
                    Password<input type="password" name="password" required><br><br><br>
                    Usertype<select name = "usertype" class="radiobutton">
                        <option value selected disabled class="radioelement" style="color:grey !important">
                            <h4>
                                Usertype
                            </h4>
                        </option>
                        <option value="Admin" class="radioelement" selected = "selected">
                            <h4>
                                Admin
                            </h4>
                        </option>
                        <option value="Student" class="radioelement">
                            <h4>
                                Student
                            </h4>
                        </option>
                    </select>-->
                    <br>
                        <button type="submit" name = "button" value="signupFromAdmin" class="btn btn-default btn-lg" style="width: 120px; margin-top: 20px; background-color: #B97F6D;">
                            <div style="font-size: 16px">Create New</div>
                        </button>
                </form>            
            </div>
        </div>
    </body>
</html>
