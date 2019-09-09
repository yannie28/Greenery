<%-- 
    Document   : admin
    Created on : Sep 30, 2017, 7:08:04 PM
    Author     : Arianne
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        
        <script src="Bootstrap/js/jquery.js"></script>
	<script src="Bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" href="Bootstrap/css/bootstrap.css">
        
        <style>
            
            @font-face {
                font-family: Champagne;
                src: url(Fonts/Champagne.ttf);
            }
            
            body,
            html {
                height: 100%;
                margin: 0;
                font-size: 16px;
                font-family: Champagne;
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
                      <form action="ViewInventory">
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
            <form action="Signout" method="post">
                <div class="logout">
                    <button type="submit" name="button" value="logout">Logout</button>
                </div>
            </form>
        </header>
        <div class="container">
            <section>
                <div style="font-size: 100px">
                    WELCOME ADMIN :)
                </div>
            </section>
        </div>
    </body>
</html>
