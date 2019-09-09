<%-- 
    Document   : index
    Created on : Sep 30, 2017, 6:47:09 PM
    Author     : Arianne
--%>

<%@page import = "java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shipping</title>
        <script src="Bootstrap/js/jquery.js"></script>
	<script src="Bootstrap/js/bootstrap.js"></script>
	<link rel="stylesheet" href="Bootstrap/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
            }
            
            .navbar {
                overflow: hidden;
                background-color: #F2F2F2;
                position: fixed;
                width:100%;
                top: 0;
                z-index:3;
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
            
            .company{
                font-family: CodeBold;
                font-size: 150px;
            }
            
            
            .title-category{
                font-size: 20px;
                color: #B97F6D;
            }
            
            p{
                font-size: 14px;
                font-family: ChampagneRegular;
            }

            .footer{
                color: #B97F6D;
                background-color: #093C33;
                padding: 100px;
                padding-bottom: 80px;
            }
            
            .panel-heading .accordion-toggle:after {
                /* symbol for "opening" panels */
                font-family: 'Glyphicons Halflings';
                content: "\e114";    /* adjust as needed, taken from bootstrap.css */
                float: right;        /* adjust as needed */
                color: #B97F6D;         /* adjust as needed */
            }
            
            .panel-heading .accordion-toggle.collapsed:after {
                /* symbol for "collapsed" panels */
                content: "\e080";    /* adjust as needed, taken from bootstrap.css */
            }
            
            .container-fluid{
                max-width: 100%;
                margin: 0 auto;
                background: #FAFAFA;
                padding: 50px;
                
            }
            
            h1{
                font-family: CodeBold;
                letter-spacing: 2px;
                text-align: center;
                color: #B97F6D;
                margin-top: 80px;
                letter-spacing: 5px;
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
            
            .hr{
                width: 80%;
                height: 2px;
                background-color: #B97F6D;
                width: 15px; 
                margin-bottom: 0px; 
                height: 5px; 
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
            
            p a, p a:hover{
                color: #B97F6D;
            }

            #main {
                margin-right: 10px;
                padding-right: 10px;
                float: right;
                margin-top: -52px;
            }
            
            button{
                border: transparent;
                background-color: transparent;
                outline: none;
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
 
            .content{
                font-family: ChampagneRegular;
                color: #B97F6D;
                font-size: 14px;
                border: 0;
                outline: 0;
                border-collapse: collapse;
                margin-left: 200px;
                margin-right: 300px;
                margin-bottom: 40px;
                text-align: center;
                margin-top: 10px;
            }
            
            p a, p a:hover{
                color: #B97F6D;
            }
            
            .social-icon{
                height: 30px;
                weigh: 30px;
                padding-right: 10px;
            }

        </style>
        
        <script> 
            $(document).ready(function(){
                $("#flip").click(function(){
                    $("#panel").slideToggle("slow");
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
                <a href="index.jsp">Home</a>
                <a href="index.jsp#about">About</a>
                <a href="faq.jsp">FAQ</a>
                <a href="index.jsp#contact">Contact</a>
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
                <h1>SHIPPING POLICY</h1>
                <hr class="hr">
                <br><br>
                <div class="content">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 
                    3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. 
                    Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. 
                    Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. 
                    Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
                <h1>RETURN POLICY</h1>
                <hr class="hr">
                <br><br>
                <div class="content">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 
                    3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. 
                    Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. 
                    Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. 
                    Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
                <h1>PAYMENT METHOD</h1>
                <hr class="hr">
                <br><br>
                <div class="content">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 
                    3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. 
                    Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. 
                    Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. 
                    Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
                <h1>WHOLESALE INQUIRIES</h1>
                <hr class="hr">
                <br><br>
                <div class="content" style="margin-bottom: 80px;">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 
                    3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. 
                    Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. 
                    Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. 
                    Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
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
            <c:set var="id" value='${requestScope["loginId"]}' />
            
            <div class="navbar">
                <table>
                    <tr>
                            <td>
                                <form action="BasketServlet" method="post">
                                    <input type="hidden" name="loginId" value="${id}">
                                    <input type="hidden" name="basket" value="${list_basket}">
                                    <button name="button" value="home"><a>Home</a></button>
                                </form>
                            </td>

                            <td>
                                <form action="BasketServlet" method="post">
                                    <input type="hidden" name="loginId" value="${id}">
                                    <input type="hidden" name="basket" value="${list_basket}">
                                    <button name="button" value="about"><a>About</a></button>
                                </form>
                            </td>
                            <td>
                                <form action="BasketServlet" method="post">
                                    <input type="hidden" name="loginId" value="${id}">
                                    <input type="hidden" name="basket" value="${list_basket}">
                                    <button name="button" value="faq"><a>FAQ</a></button>
                                </form>                     
                            </td>
                            <td>
                                <form action="BasketServlet" method="post">
                                    <input type="hidden" name="loginId" value="${id}">
                                    <input type="hidden" name="basket" value="${list_basket}">
                                    <button name="button" value="contact"><a>Contact</a></button>
                                </form>                    
                            </td>
                            <td>
                                <form action="InventoryUser">
                                    <input type="hidden" name="loginId" value="${id}">
                                    <input type="hidden" name="basket" value="${list_basket}">
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
        
            <c:set var="list_basket" value='${requestScope["basket"]}' />
            <c:set var="description" value = "1"/>
            <c:set var="price" value = "2"/>
            <div id="mySidenav" class="sidenav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <a href="#">ITEMS</a>
                <hr>
                <div class="products">
                    <c:forEach items="${list_basket}" var="item_basket" varStatus="counter">
                        <c:if test="${counter.count == description}">
                            <c:out value="${item_basket}"/>
                            <div class="cancel">
                                <form action="BasketServlet" method="post">
                                    <input type="hidden" name="basket" value="${list_basket}">
                                    <button name="delete_item" value="${item_basket}">
                                        <img src="Images/index/cancel-button.png" style="width: 10px; height: 10px">
                                    </button>
                                </form>
                            </div>
                            <br>
                            <c:set var="description" value="${description+2}"/>
                        </c:if>
                            
                        <c:if test="${counter.count == price}">
                            <c:out value="${item_basket}"/>
                            <c:set var="price" value="${price}"/>
                            <br><br>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            </div>
            <div class="container-fluid">
                <h1>SHIPPING POLICY</h1>
                <hr class="hr">
                <br><br>
                <div class="content">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 
                    3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. 
                    Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. 
                    Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. 
                    Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
                <h1>RETURN POLICY</h1>
                <hr class="hr">
                <br><br>
                <div class="content">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 
                    3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. 
                    Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. 
                    Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. 
                    Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
                <h1>PAYMENT METHOD</h1>
                <hr class="hr">
                <br><br>
                <div class="content">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 
                    3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. 
                    Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. 
                    Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. 
                    Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
                <h1>WHOLESALE INQUIRIES</h1>
                <hr class="hr">
                <br><br>
                <div class="content" style="margin-bottom: 80px;">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 
                    3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. 
                    Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. 
                    Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. 
                    Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
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
                                
                                <form action="ReturnServlet" method="post">
                                    <p style="font-size: 16px; margin-top: -10px">
                                        <input type="hidden" name="loginId" value="${id}">
                                        <input type="hidden" name="basket" value="${list_basket}">
                                        <button name="button" value="shipping">Shipping & Returns</button><br>
                                    </p>
                                </form>
                                <form action="ReturnServlet" method="post">
                                    <p style="font-size: 16px; margin-top: -10px">
                                        <input type="hidden" name="loginId" value="${id}">
                                        <input type="hidden" name="basket" value="${list_basket}">
                                        <button name="button" value="privacy">Privacy Policy</button><br>
                                    </p>
                                </form>
                                <form action="ReturnServlet" method="post">
                                    <p style="font-size: 16px; margin-top: -10px">
                                        <input type="hidden" name="loginId" value="${id}">
                                        <input type="hidden" name="basket" value="${list_basket}">
                                        <button name="button" value="faq">FAQ</button> 
                                    </p>
                                </form>
                                    <br><br><br><br><br><br><br>
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
