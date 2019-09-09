<%-- 
    Document   : index
    Created on : Sep 30, 2017, 6:47:09 PM
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
        <title>Greenery</title>
        <script src="Bootstrap/js/jquery.js"></script>
	<script src="Bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" href="Bootstrap/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="Parallax/parallax.js"></script>
        
        <style>
            
            @font-face {
                font-family: Champagne;
                src: url(Fonts/Champagne.ttf);
            }
            
            @font-face {
                font-family: CodeBold;
                src: url(Fonts/Code-Bold.otf);
            }
            
            @font-face {
                font-family: ChampagneRegular;
                src: url(Fonts/Champagne-Regular.ttf);
            }
            
            html,body{
                font-family: Champagne;
                transition: background-color .5s;
            }
            .container-fluid{
                max-width: 100%;
                margin: 0 auto;
                background: #F2F2F2;
                padding: 50px;
                
            }
            
            .parallax{
                min-height: 900px;
                background: transparent;
                
            }
            
            .title{
                z-index: 2;
                position: relative;
                padding: 100px;
                color: #FFF;
                font-size: 20px;
                letter-spacing: 5px;
                font-family: ChampagneRegular;
                
            }
            
            .navbar {
                overflow: hidden;
                background-color: #F2F2F2;
                position: fixed;
                width:100%;
                top: 0;
                z-index:5;
                padding-left: 50px;
            }

            .navbar a {
                float: left;
                display: block;
                color: #B97F6D;
                text-align: center;
                padding: 14px 25px;
                text-decoration: none;
                font-size: 14px;
                letter-spacing: 3px;
            }
            
            .navbar a:hover {  
                color: #093C33;
            }
            
            .company{
                font-family: CodeBold;
                font-size: 150px;
            }
            
            
            .title-category{
                font-size: 20px;
                color: #B97F6D;
            }
            
            .about{
                background-color: white;
                margin-left: 15px;
                padding: 70px 100px;
                font-size: 20px;
                color: #B97F6D;
                letter-spacing: 3px;
            }
            
            p{
                font-size: 14px;
                font-family: ChampagneRegular;
            }
            
            .buy-now{
                background-color: #093C33;
                font-size: 80px;
                font-family: CodeBold;
                padding: 10px 100px;
                letter-spacing: 3px;
                color: #B97F6D;
                line-height: 90px;
            }
            
            .contact{
                z-index: 2;
                position: relative;
                padding: 130px;
                color: #B97F6D;
                font-size: 20px;
                letter-spacing: 3px;
            }
            
            input{
                border-color: transparent;
                outline: none;
                font-size: 14px;
                font-family: ChampagneRegular;
                padding: 2px;
                width: 500px;
                color: #B97F6D;
                margin: 10px;
            }
            
            ::-webkit-input-placeholder { /* Chrome/Opera/Safari */
                color: #B97F6D;
            }
            
            textarea{
                border-color: transparent;
                outline: none;
                font-size: 14px;
                font-family: ChampagneRegular;
                padding: 2px;
                color: #B97F6D;
                margin: 10px;
                width: 500px;
                height: 200px;
            }
            
            .submit-contact{
                width: 500px;
                color: white;
                background-color: #B97F6D;
                font-size: 14px;
                font-family: ChampagneRegular;
                padding: 5px;
                border-color: transparent;
                outline: none;
            }
            
            .footer{
                color: #B97F6D;
                background-color: #093C33;
                padding: 100px;
                padding-bottom: 80px;
            }
            
            .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                right: 0;
                background-color: #093C33;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 15px;
                z-index: 5;
                font-family: ChampagneRegular;
                font-size: 15px;
                color: #B97F6D;
            }

            .sidenav a {
                padding: 0px 5px 8px 32px;
                text-decoration: none;
                font-size: 20px;
                display: block;
                transition: 0.3s;
                color: #B97F6D;
                
            }
            
            .products{
                padding: 8px 5px 8px 32px;
            }

            .sidenav a:hover {
                color: #F2F2F2;
            }

            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

            #main {
                margin-right: 10px;
                padding-right: 10px;
                float: right;
                margin-top: -52px;
            }

            @media screen and (max-height: 450px) {
              .sidenav {padding-top: 15px;}
              .sidenav a {font-size: 18px;}
            }
            
            .right-icon{
                height: 23px;
                weigh: 23px;
                padding-right: 10px;
            }
            
            p a, p a:hover{
                color: #B97F6D;
            }
            
            .social-icon{
                height: 30px;
                weigh: 30px;
                padding-right: 10px;
            }
            
            button{
                border: transparent;
                background-color: transparent;
                outline: none;
            }
        </style>
        
        <script>
            $(function() {
                $('a[href*=#]:not([href=#])').click(function() {
                    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                        var target = $(this.hash);
                        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                        if (target.length) {
                            $('html,body').animate({
                                scrollTop: target.offset().top
                            }, 1000);
                            return false;
                        }
                    }
                });
            });
            
            function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
                document.getElementById("main").style.marginLeft = "250px";
                document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
                document.getElementById("main").style.marginLeft= "0";
                document.body.style.backgroundColor = "white";
            }
            
        </script>
    </head>
    
    <c:if test="${sessionScope.clock == null}">
    <body>
            <div class="navbar">
                <a href="#home">Home</a>
                <a href="#about">About</a>
                <a href="faq.jsp">FAQ</a>
                <a href="#contact">Contact</a>
                <form action="InventoryUser">
                    <button name="button" value="shop"><a>Shop</a></button>                     
                </form>
                
                <div id="main">
                    <a href="login.jsp" style="padding-right: 5px">Sign in</a>
                    <a href="register.jsp">Register</a>
                    <span style="cursor:pointer" onclick="openNav()">
                        <img src="Images/index/basket.png" class="right-icon" style="margin-left: 15px; margin-top:12px; margin-right: 40px;">
                    </span>
                </div>

            </div>
        
            <div id="mySidenav" class="sidenav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <a href="#">ITEMS</a>
                <hr>
                <div class="products">
                    This is a product<br>
                    P20.00
                </div>

            </div>
               
            <div class="container-fluid">
                
                <div id = "home" class="parallax" data-parallax="scroll" data-z-index="1" data-image-src="Images/index/header.png">
                    <div class="title">
                        <center>
                            ESTB <img src="Images/index/header-icon.png" style="height: 100px; width: 80px"> 2017
                            <br>
                            <div class="company">THE GREENERY</div>
                            THE BOUTIQUE STORE FOR PLANTS
                        </center>
                    </div>
                </div>
                
                <div id="shop" style="margin-top: 50px;" class="row">
                    <div class="title-category col-lg-4">
                        <img src="Images/index/plant.png" style="width: 450px;">
                        <div style="top: 50px; left:210px; position: absolute; letter-spacing: 3px;">Plants</div><br>
                        <div style="top: 70px; left:230px; position: absolute;">__</div>
                        <div style="top: 110px; left:157px; position: absolute; letter-spacing: 3px;">Shop Collection</div>
                    </div>
                    <div class="title-category col-lg-4">
                        <img src="Images/index/cacti.png" style="width: 450px;">
                        <div style="top: 50px; left:210px; position: absolute; letter-spacing: 3px;">Cacti</div><br>
                        <div style="top: 70px; left:230px; position: absolute;">__</div>
                        <div style="top: 110px; left:157px; position: absolute; letter-spacing: 3px;">Shop Collection</div>
                    </div>
                    <div class="title-category col-lg-4">
                        <img src="Images/index/succulent.png" style="width: 450px;">
                        <div style="top: 50px; left:190px; position: absolute; letter-spacing: 3px;">Succulents</div><br>
                        <div style="top: 70px; left:230px; position: absolute;">__</div>
                        <div style="top: 110px; left:157px; position: absolute; letter-spacing: 3px;">Shop Collection</div>
                    </div>
                </div>
                
                <table id="about" class="row" style="margin: 50px 0px 0px 0px;">
                    <tr>
                        <td class="about">
                            <center>
                                About us
                                <br><br>
                                <p>
                                    Lorem ipsum dolor sit amet, ius habeo prompta id. Pri id exerci nostrud fierent, ex quando commodo detraxit nam. 
                                    Duo suas novum ornatus an. At mea nobis congue debitis, affert complectitur at eos, et pro mollis vivendo omittam.
                                    Virtute lobortis liberavisse vix an. In sale legere periculis per, quaeque constituto disputationi usu ei. At mel tale intellegam. 
                                    Ei deleniti lucilius his. Adhuc rationibus dissentias id sea, cu qui persius docendi, et ius nibh mucius tamquam.
                                    Ad stet civibus mei. Qui vide tamquam explicari in. Lorem libris accusamus eum ea, appareat lobortis atomorum quo te. Vero elit invidunt per et, mea an ludus viderer, at quas delectus eos.
                                    Sit cu sanctus repudiandae, sed corpora accusata necessitatibus ea. Sed ea wisi saperet verterem. Ne pri tale impetus reformidans. 

                                </p>
                            </center>
                        </td>
                        <td>
                            <img src="Images/index/index_bot4.jpg" style="width: 350px; height: 500px;">
                        </td>
                        <td>
                            <img src="Images/index/index_bot2.jpg" style="width: 350px; height: 500px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="Images/index/index_bot3.jpg" style="width: 720px; height: 500px">
                        </td>
                        <td colspan="2" class="buy-now">
                            <center>BUY ONLINE NOW & GET 20% OFF!</center>
                        </td>
                    </tr>
                </table>
                
                <div id = "contact" class="parallax" data-parallax="scroll" data-z-index="1" data-image-src="Images/index/index_bot.png">
                    <div class="contact">
                        <center>
                            For Special Requests and Orders
                            <div style="margin-top:40px">
                                <input type="text" placeholder="Name"><br>
                                <input type="text" placeholder="Email"><br>
                                <input type="text" placeholder="Subject"><br>
                                <textarea  type="text" placeholder="Message"></textarea>
                            </div>
                            <button class="submit-contact">Submit</button>
                        </center>
                    </div>
                </div>
                
                <footer>
                    <div class="col-lg-4 footer">
                        <center>
                            <div class="title-category" style="letter-spacing: 3px;">
                                Our Store<br><br>
                                <p>
                                    Address: 10 N. Domingo Street Barangay Valencia Quezon City<br>
                                    Phone: 9450150<br>
                                    Email: greenery@domain.com
                                </p>
                            </div>
                        </center>
                    </div>
                    <div class="col-lg-4 footer">
                        <center>
                            <div class="title-category" style="letter-spacing: 3px;">
                                Opening Hours<br><br>
                                <p>
                                    Monday-Friday: 7:00-17:00<br>
                                    Saturday: 10:00-20:00<br>
                                    Sunday: 8:00-12:00<br><br>
                                </p>
                            </div>
                        </center>
                    </div>
                    <div class="col-lg-4 footer">
                        <center>
                            <div class="title-category" style="letter-spacing: 3px;">
                                Help<br><br>
                                <p>
                                    <a href="shipping.jsp">Shipping & Returns</a><br>
                                    <a href="privacy.jsp">Privacy Policy</a><br>
                                    <a href="faq.jsp">FAQ</a><br><br>
                                </p>
                            </div>
                        </center>
                    </div>
                    <div class="footer">
                        <center>
                            FOLLOW US AND GET THE LATEST UPDATE!<br><br>
                            <a href="http://www.facebook.com" target="_blank"><img src="Images/social_icons/facebook.png" class="social-icon"></a>
                            <a href="http://www.twitter.com" target="_blank"><img src="Images/social_icons/twitter.png" class="social-icon"></a>
                            <a href="http://www.instagram.com" target="_blank"><img src="Images/social_icons/instagram.png" class="social-icon"></a>
                        </center>
                    <div>
                </footer>
               
                <div style="color: #B97F6D; padding-top: 50px;">
                    <center>The Greenery &#169; 2017 </center>
                </div>
            </div>
    </body>
    </c:if>
    
    
    <c:if test="${sessionScope.clock != null}">
        <body>
            
            <div class="navbar">
                <table>
                    <tr>
                        <td><a href="#home">Home</a></td>
                        <td><a href="#about">About</a></td>
                        <td>
                            <form action="ReturnServlet" method="post">
                                <input type="hidden" name="loginId" value="${id}">
                                <button name="button" value="faq"><a>FAQ</a></button>                     
                            </form>
                        </td>
                        <td><a href="#contact">Contact</a></td>
                        <td>
                            <form action="InventoryUser">
                                <%--<input type="hidden" name="loginId" value="${id}">--%>
                                <button name="button" value="shop"><a>Shop</a></button>                     
                            </form>
                        </td>
                    </tr>
                </table>
                
                <div id="main">
                    <table>
                        <tr>
                            <td>
                                <form action="Signout">
                                    <button name="button" value="logout"><a>Logout</a></button>
                                </form>
                            </td>
                            <td>
                                <form action="ViewAccount" method="post">
                                    <div>
                                        <button name="button" value="viewAccount"><a>Manage Account</a></button>
                                    </div>
                                </form>
                            </td>
                            <td>
                                <span style="cursor:pointer" onclick="openNav()">
                                    <img src="Images/index/basket.png" class="right-icon" style="margin-left: 15px; margin-top:0px; margin-right: 60px;">
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>

            </div>
            
            <c:set var="description" value = "1"/>
            <c:set var="price" value = "2"/>
            <div id="mySidenav" class="sidenav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <a href="#">ITEMS</a>
                <hr>
                <div class="products">
                    This is a product<br>
                    P20.00
                </div>
            </div>
               
            <div class="container-fluid">
                
                <div id = "home" class="parallax" data-parallax="scroll" data-z-index="1" data-image-src="Images/index/header.png">
                    <div class="title">
                        <center>
                            ESTB <img src="Images/index/header-icon.png" style="height: 100px; width: 80px"> 2017
                            <br>
                            <div class="company">THE GREENERY</div>
                            THE BOUTIQUE STORE FOR PLANTS
                        </center>
                    </div>
                </div>
                
                <div id="shop" style="margin-top: 50px;" class="row">
                    <div class="title-category col-lg-4">
                        <img src="Images/index/plant.png" style="width: 450px;">
                        <div style="top: 50px; left:210px; position: absolute; letter-spacing: 3px;">Plants</div><br>
                        <div style="top: 70px; left:230px; position: absolute;">__</div>
                        <div style="top: 110px; left:157px; position: absolute; letter-spacing: 3px;">Shop Collection</div>
                    </div>
                    <div class="title-category col-lg-4">
                        <img src="Images/index/cacti.png" style="width: 450px;">
                        <div style="top: 50px; left:210px; position: absolute; letter-spacing: 3px;">Cacti</div><br>
                        <div style="top: 70px; left:230px; position: absolute;">__</div>
                        <div style="top: 110px; left:157px; position: absolute; letter-spacing: 3px;">Shop Collection</div>
                    </div>
                    <div class="title-category col-lg-4">
                        <img src="Images/index/succulent.png" style="width: 450px;">
                        <div style="top: 50px; left:190px; position: absolute; letter-spacing: 3px;">Succulents</div><br>
                        <div style="top: 70px; left:230px; position: absolute;">__</div>
                        <div style="top: 110px; left:157px; position: absolute; letter-spacing: 3px;">Shop Collection</div>
                    </div>
                </div>
                
                <table id="about" class="row" style="margin: 50px 0px 0px 0px;">
                    <tr>
                        <td class="about">
                            <center>
                                About us
                                <br><br>
                                <p>
                                    Lorem ipsum dolor sit amet, ius habeo prompta id. Pri id exerci nostrud fierent, ex quando commodo detraxit nam. 
                                    Duo suas novum ornatus an. At mea nobis congue debitis, affert complectitur at eos, et pro mollis vivendo omittam.
                                    Virtute lobortis liberavisse vix an. In sale legere periculis per, quaeque constituto disputationi usu ei. At mel tale intellegam. 
                                    Ei deleniti lucilius his. Adhuc rationibus dissentias id sea, cu qui persius docendi, et ius nibh mucius tamquam.
                                    Ad stet civibus mei. Qui vide tamquam explicari in. Lorem libris accusamus eum ea, appareat lobortis atomorum quo te. Vero elit invidunt per et, mea an ludus viderer, at quas delectus eos.
                                    Sit cu sanctus repudiandae, sed corpora accusata necessitatibus ea. Sed ea wisi saperet verterem. Ne pri tale impetus reformidans. 

                                </p>
                            </center>
                        </td>
                        <td>
                            <img src="Images/index/index_bot4.jpg" style="width: 350px; height: 500px;">
                        </td>
                        <td>
                            <img src="Images/index/index_bot2.jpg" style="width: 350px; height: 500px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="Images/index/index_bot3.jpg" style="width: 720px; height: 500px">
                        </td>
                        <td colspan="2" class="buy-now">
                            <center>BUY ONLINE NOW & GET 20% OFF!</center>
                        </td>
                    </tr>
                </table>
                
                <div id = "contact" class="parallax" data-parallax="scroll" data-z-index="1" data-image-src="Images/index/index_bot.png">
                    <div class="contact">
                        <center>
                            For Special Requests and Orders
                            <div style="margin-top:40px">
                                <input type="text" placeholder="Name"><br>
                                <input type="text" placeholder="Email"><br>
                                <input type="text" placeholder="Subject"><br>
                                <textarea  type="text" placeholder="Message"></textarea>
                            </div>
                            <button class="submit-contact">Submit</button>
                        </center>
                    </div>
                </div>
                
                <footer>
                    <div class="col-lg-4 footer">
                        <center>
                            <div class="title-category" style="letter-spacing: 3px;">
                                Our Store<br><br>
                                <p>
                                    Address: 10 N. Domingo Street Barangay Valencia Quezon City<br>
                                    Phone: 9450150<br>
                                    Email: greenery@domain.com
                                    <br><br><br><br><br><br><br>
                                </p>
                            </div>
                        </center>
                    </div>
                    <div class="col-lg-4 footer">
                        <center>
                            <div class="title-category" style="letter-spacing: 3px;">
                                Opening Hours<br><br>
                                <p>
                                    Monday-Friday: 7:00-17:00<br>
                                    Saturday: 10:00-20:00<br>
                                    Sunday: 8:00-12:00<br><br>
                                </p>
                            </div>
                            <br><br>
                            <div style="margin-top: 9.5px">
                            FOLLOW US AND GET THE LATEST UPDATE!<br><br>
                            <a href="http://www.facebook.com" target="_blank"><img src="Images/social_icons/facebook.png" class="social-icon"></a>
                            <a href="http://www.twitter.com" target="_blank"><img src="Images/social_icons/twitter.png" class="social-icon"></a>
                            <a href="http://www.instagram.com" target="_blank"><img src="Images/social_icons/instagram.png" class="social-icon"></a>
                            </div>
                        </center>
                    </div>
                    <div class="col-lg-4 footer">
                        <center>
                            <div class="title-category" style="letter-spacing: 3px;">
                                Help<br><br>
                                <form action="BasketServlet" method="post">
                                    <p style="font-size: 16px; margin-top: -10px">
                                        <input type="hidden" name="loginId" value="${id}">
                                        <input type="hidden" name="basket" value="${list_basket}">
                                        <button name="button" value="shipping">Shipping & Returns</button><br>
                                        <button name="button" value="privacy">Privacy Policy</button><br>
                                        <button name="button" value="faq">FAQ</button> 
                                    <br><br><br><br><br><br><br>
                                    </p>
                                </form>

                            </div>
                        </center>
                    </div>
                </footer>
               
                <div style="color: #B97F6D; padding-top: 500px;">
                    <center>The Greenery &#169; 2017 </center>
                </div>
            </div>
    </body>
    </c:if>
</html>
