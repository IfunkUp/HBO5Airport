<%-- 
    Document   : overzichtBemmanning
    Created on : 23-mei-2017, 14:19:49
    Author     : steve
--%>

<%@page import="hbo5.it.www.beans.Passagier"%>
<%@page import="hbo5.it.www.beans.Crew"%>
<%@page import="hbo5.it.www.beans.Vlucht"%>
<%@page import="hbo5.it.www.beans.Persoon"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        .footer{
            position:absolute;
    	width:100%;
        bottom:0;
    	height:60px;
        }
    </style>
    <head>
		<!-- meta -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale = 1.0, maximum-scale=1.0, user-scalable=no"/>

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
                        <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
	<a class="navbar-brand" href="index.jsp" title="HOME"><i class="ion-paper-airplane"></i> Java <span>travel</span></a>
                        </div> 
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">vluchtoverzicht <span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">Inkomende vluchten</a></li>
                                            <li><a href="#">Uitgaande vluchten</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#"> Zoeken </a></li>   
                                    <li><a href="LoginPage.jsp"><i class="ion-person"></i>${status}</a></li>
				</ul> 
		    </div>
	  	</div>
	</nav>
 
  
                                </div>
                                <form  action="AdminServlet?choice=vlucht" method="Post">
                                <div class="form-group"> 
                                    <label for="LstVluchten">kies een vlucht</label>
                                    <select onchange="this.form.submit()" class="form-control" name="LstVluchten" style="width: 50%; margin: 15px">
                                        <option selected="true"></option>
                                         <%ArrayList<String> lijst =(ArrayList<String>) session.getAttribute("lijstvluchten");%>
                                            <%for (String item : lijst) {%>
                                            <option value="<%=item%>" ><%=item%></option>
                                           <%}%>
                                    </select>
                                           
                                </div>           
                                         
   

                                    </form>
                                      <%if (request.getAttribute("Bemanning") != null) {%>
                                           <%ArrayList<Crew> crewlijst = (ArrayList<Crew>) request.getAttribute("Bemanning");%>
                                    <form >
                                        
                                        <h3> overzicht van vlucht <%=crewlijst.get(1).getCode()%>
                                        
                                            <table title="Crew">
                                                <caption>Crew</caption>
                                                <th>functie</th>
                                                <th>naam</th>
                                        <%for (Crew item : crewlijst){%>
                                                <tr>
                                                    <td><%=item.getFunctie()%></td>
                                                    <td><%=item.getNaam()%></td>
                                                </tr>
                                          
                                        <%}%>
                                       
                                            </table>
                                            <input type="submit" name="btnWijzig" value="Wijzig"/>
                                            <input type="submit" name="btnVerwijder" value="Verwijder"/>
                                    </form>
     <%}%>                               
     <%if (request.getAttribute("Passagiers") != null) {%>
     <%ArrayList<Passagier> pasLijst = (ArrayList<Passagier>) request.getAttribute("Passagiers");%>
     <table>
         <th>id</th>
         <th>ingeschreven</th>
         <th>plaats</th>
  
     <%for (Passagier item : pasLijst) {%>
     <tr>
    <td><%=item.getId()%></td>
    <td><%=item.getIngecheckt()%></td>
    <td><%=item.getPlaats()%></td>
     </tr>
     
<%}%>
       </table>
     
<%}%>
                                    
                                    
                                    
                                    
         
                                    
                                    
                                    
                                    
                                    
                                    
                                </div>
       
       <footer>
           <p>Project gemaakt door team 2 (Steve Dekerf, Peter Haest and Tijs Torfs)</p>
           
       </footer>








    </body>
</html>