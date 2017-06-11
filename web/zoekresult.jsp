<%-- 
    HBO5 Programeren 4
    Document   : index
    Created on : 23-apr-2017, 17:33:50
    Author     : steve
--%>

<%@page import="hbo5.it.www.beans.Vlucht"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<head>
		<!-- meta -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale = 1.0, maximum-scale=1.0, user-scalable=no"/>
        <title>${title}</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/ionicons.min.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/owl.theme.css">
	<link rel="stylesheet" href="css/flexslider.css" type="text/css">
        <link rel="stylesheet" href="css/main.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
      
</head>
    <body>
        
        <div>
        <nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<%session = request.getSession();
                                String url= "";
                                if ("Admin".equals(session.getAttribute("paswoord"))) {
                                   url = "StartAdmin.jsp";}
                                else if("Director".equals(session.getAttribute("paswoord"))){
                                   url = "StartDirector.jsp";}
                                else{
                                    url = "index.jsp";}%>

                                    <a class="navbar-brand" href="<%=url%>" title="HOME"><i class="ion-paper-airplane"></i> Java <span>travel</span></a>
			</div> <!-- /.navbar-header -->

	    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
                                    <%if("Director".equals(session.getAttribute("paswoord"))){%>
                                        <li><a href="ZoekServlet?Zoeken=statistieken">Statistieken</a></li>
                                            <%}%>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">vluchtoverzicht <span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="ZoekServlet?Zoeken=inkomend">Inkomende vluchten</a></li>
                                            <li><a href="ZoekServlet?Zoeken=uitgaand">Uitgaande vluchten</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="zoektest.jsp"> Zoeken </a></li>   
                                    <li><a href="LoginPage.jsp"><i class="ion-person"></i>${status}</a></li>
				</ul> <!-- /.nav -->
		    </div><!-- /.navbar-collapse -->
	  	</div><!-- /.container -->
	</nav>
        </div>
        <section class="tour section-wrapper tablecontainer">
            <!--for demo wrap-->
            <h1 class="tour section-wrapper container section-title">Vluchten ${optie} ${input}</h1>
            <a class="btn btn-default col-md-offset-1 btn-lg" style="margin-bottom: 15px" href="zoektest.jsp">Nieuwe zoekopdracht</a>
           <%ArrayList<Vlucht> resultaat = 
                (ArrayList<Vlucht>) request.getAttribute("vluchten");                
                if (resultaat.isEmpty()) {%>
                    <div class="col-md-offset-2">
                        <h3>! Er zijn geen vluchten gevonden !</h3>
                    </div>
                <%}

                else {%>
                    <table cellpadding="0" cellspacing="0" border="0" id="myTable" class="tablecontainer tablesorter">
                        <thead>              
                            <tr>
                                <th>Vluchtnummer</th>
                                <th>Vliegtuig</th>
                                <th>Vertrek</th>
                                <th>Aankomst</th>
                                <th>Aankomsttijd</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Vlucht vlucht: resultaat){%>
                                <form action="">
                                    <tr>
                                        <td><a href="ZoekServlet?Zoeken=Details&id=<%=vlucht.getId()%>&input=${input}&optie=${returnoptie}&hide=no"><%=vlucht.getCode()%></a></td>
                                        <td><%=vlucht.getVliegtype().getNaam()%></td>
                                        <td><%=vlucht.getVertrekluchthaven().getNaam()%></td>
                                        <td><%=vlucht.getAankomstluchthaven().getNaam()%></td>
                                        <td><%=vlucht.getAankomsttijd() %></td>
                                          <td> <button value="<%=vlucht.getId()%>"><a href="ZoekServlet?choice=Book&vluchtid=<%=vlucht.getId()%>">boeken</a></button></td>
                                    </tr>
                                </form>
                            <%}%>
                        </tbody>
                    </table>
                <%}%>
        </section>





       
       <footer>
           <div class="container">
			<div class="row">
				<div class="col-xs-4">
					<div class="text-left">
						&copy; Copyright Java Travels
					</div>
				</div>
				<div class="col-xs-4">
					Project gemaakt door team 2 (Steve Dekerf, Tijs Torfs en Peter Haest)
				</div>
				<div class="col-xs-4">
					<div class="top">
						<a href="#header">
							<i class="ion-arrow-up-b"></i>
						</a>
					</div>
				</div>
			</div>
		</div>	
       </footer>
    </body>
</html>


      
        

