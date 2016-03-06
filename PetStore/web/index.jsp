<%--
  Created by IntelliJ IDEA.
  User: Liuzhen
  Date: 2016/3/2
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <link rel="StyleSheet" href="css/jpetstore.css" type="text/css"
          media="screen" />
    <meta name="generator"
          content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org" />
    <title>JPetStore</title>
    <meta content="text/html; charset=windows-1252"
          http-equiv="Content-Type" />
    <meta http-equiv="Cache-Control" content="max-age=0" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="Pragma" content="no-cache" />
  </head>
  <body>


  <div id="Header">

    <div id="Logo">
      <div id="LogoContent"><a href="/petstore/actions/Catalog.action"><img src="./images/logo-topbar.gif" /></a></div>
    </div>

    <div id="Menu">
      <div id="MenuContent"><a href="/petstore/actions/Cart.action?viewCart="><img align="middle" name="img_cart" src="../images/cart.gif" /></a> <img align="middle" src="../images/separator.gif" />
        <a href="location = 登录.jsp=">Sign In</a>
        <img align="middle" src="../images/separator.gif" /> <a
                href="../help.html">?</a></div>
    </div>

    <div id="Search">
      <div id="SearchContent"><form action="/petstore/actions/Catalog.action" method="post">
        <input name="keyword" type="text" size="14" />
        <input name="searchProducts" value="Search" type="submit" />
        <div style="display: none;"><input type="hidden" name="_sourcePage" value="EO5wd8Cifi9tXoxmEmuoo7MjkkJy9Tdfe_yM7byJBDFNjN9nRioyCQ==" /><input type="hidden" name="__fp" value="k8REpbzoBdE=" /></div></form></div>
    </div>

    <div id="QuickLinks"><a href="/petstore/actions/Catalog.action?viewCategory=&amp;categoryId=FISH"><img src="../images/sm_fish.gif" /></a> <img src="../images/separator.gif" /> <a href="/petstore/actions/Catalog.action?viewCategory=&amp;categoryId=DOGS"><img src="../images/sm_dogs.gif" /></a> <img src="../images/separator.gif" /> <a href="/petstore/actions/Catalog.action?viewCategory=&amp;categoryId=REPTILES"><img src="../images/sm_reptiles.gif" /></a> <img src="../images/separator.gif" /> <a href="/petstore/actions/Catalog.action?viewCategory=&amp;categoryId=CATS"><img src="../images/sm_cats.gif" /></a> <img src="../images/separator.gif" /> <a href="/petstore/actions/Catalog.action?viewCategory=&amp;categoryId=BIRDS"><img src="../images/sm_birds.gif" /></a></div>

  </div>
<div id = "Content">
  <div id="Main">
    <div id="Sidebar">
      <div id="SidebarContent"><a href="/petstore/actions/Catalog.action?viewCategory=&amp;categoryId=FISH"><img src="../images/fish_icon.gif" /></a> <br />
        Saltwater, Freshwater <br />
        <a href="/petstore/actions/Catalog.action?viewCategory=&amp;categoryId=DOGS"><img src="../images/dogs_icon.gif" /></a> <br />
        Various Breeds <br />
        <a href="/petstore/actions/Catalog.action?viewCategory=&amp;categoryId=CATS"><img src="../images/cats_icon.gif" /></a> <br />
        Various Breeds, Exotic Varieties <br />
        <a href="/petstore/actions/Catalog.action?viewCategory=&amp;categoryId=REPTILES"><img src="../images/reptiles_icon.gif" /></a> <br />
        Lizards, Turtles, Snakes <br />
        <a href="/petstore/actions/Catalog.action?viewCategory=&amp;categoryId=BIRDS"><img src="../images/birds_icon.gif" /></a> <br />
        Exotic Varieties</div>
    </div>
  </div>
  <div id="MainImage">
    <script src="js/jquery-1.8.3.min.js"></script>
    <!--Luara js文件-->
    <script src="js/jquery.luara.0.0.1.min.js"></script>
  <div class="Image">
    <ul>
      <li><img src="images/1.png" alt="1"/></li>
      <li><img src="images/2.png" alt="2"/></li>
      <li><img src="images/3.png" alt="3"/></li>
      <li><img src="images/4.png" alt="4"/></li>
      <li><img src="images/5.png" alt="5"/></li>
    </ul>
    <ol>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ol>
  </div>
  <!--Luara图片切换骨架end-->
  <script>
    $(function(){
      <!--调用Luara示例-->
      $(".Image").luara({width:"500",height:"334",interval:4000,selected:"seleted"});

    });
  </script>
</div>
</div>

  <div id="Footer">
    <div id="PoweredBy">&nbsp<a href="www.mybatis.org">www.mybatis.org</a>
    </div>

    <div id="Banner"></div>

  </div>

  </body>
</html>
