<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<!--
	Minimaxing by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@ page import="main.CoinInfo" %>
<%@ page import="main.CryptoTransaction"%>
<%@ page import="main.PasswordManager"%>
<%

CoinInfo coin = new CoinInfo();
PasswordManager pM = new PasswordManager();

boolean loggedIn = false;
	        Cookie[] cookies = request.getCookies();
	        if (cookies != null){
	        for(int i = 0; i < cookies.length; i++) { 
	            Cookie c = cookies[i];
	            if (c.getName().equals("pwHash")) {
	            	if (pM.checkPassword(c.getValue())){
	            		loggedIn = true;
	            	}
	            }
	        }  
	        }

if (!loggedIn){
	String site = new String("./login.jsp");
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", site); 
}


%>
<html>
	<head>
		<title><%=coin.getName() %> HardWallet</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href="http://fonts.googleapis.com/css?family=Ubuntu+Condensed" rel="stylesheet">
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.tablesorter.pager.js"></script>
		<script src="js/staker.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
		</noscript>
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
	</head>
	<body>
		<div id="header-wrapper">
			<div class="container">
				<div class="row">
					<div class="12u">
						
						<header id="header">
							<h1><a href="./" id="logo"><%=coin.getAvailableBalance()%> <%=coin.getTickerSymbol() %></a></h1>
							<nav id="nav">
								<a href="./index.jsp">Overview</a>
								<a href="./sendcoin.jsp">Send Coin</a>
								<a href="./addresses.jsp">Addresses</a>
								<a href="./transactions.jsp" class="current-page-item">Transactions</a>
								<!-- <a href="./walletconsole.jsp">Wallet Console</a> -->
								<a href="./settings.jsp">Settings</a>
							</nav>
						</header>
					
					</div>
				</div>
			</div>
		</div>
		<div id="main">
			<div class="container">
				<div class="row main-row">
					<div class="4u" style="width: 100%;">
						<section id="recentTransactions">
							<h2>Transactions</h2>
							<p>By default, we give you the first 10,000 transactions from your wallet.</p>
							<table class="rctTxReport">
							<thead style="font-color: white;">
								<tr>
									<th class="header">Type</th>
									<th class="header">Amount</th>
									<th class="header">Fee</th>
									<th class="header">Total</th>
									<th class="header">Tx ID</th>
									<th class="header">Confirmations</th>
									<th class="header">Date</th>
								</tr>
							</thead>
							<tbody>
								<%
								
								for (CryptoTransaction tx : coin.getTransactions()){ 
									%>
									
									<tr>
										<td><%=tx.getType() %></td>
										<td><%=tx.getAmount() %> <%=coin.getTickerSymbol() %></td>
										<td><%=tx.getFee() %> <%=coin.getTickerSymbol() %></td>
										<td><%=tx.getTotal() %> <%=coin.getTickerSymbol() %></td>
										<td><a href="https://mazacha.in/tx/<%=tx.getTxId() %>" target="_blank"><%=tx.getTxId() %></a></td>
										<td><%=tx.getConfirmations() %></td>
										<td><%=tx.getDateTime() %></td>
									</tr>
									
									<%
								}
								
								%>
							</tbody> 
							</table>
							<!-- 
<div id="pager" class="pager">
	<form>
		<img src="./images/first.png" class="first"/>
		<img src="./images/prev.png" class="prev"/>
		<input type="text" class="pagedisplay"/>
		<img src="./images/next.png" class="next"/>
		<img src="./images/last.png" class="last"/>
		<select class="pagesize">
			<option selected="selected"  value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
			<option  value="40">40</option>
		</select>
	</form>
</div>
 -->
						</section>
					
					</div>
				</div>
			</div>
		</div>
		<div id="footer-wrapper">
			<div class="container">
				<div class="row">
					<div class="8u">
						
						<section>
							<h2>For help and support:</h2>
							<p>
								Please join us in our bitcointalk forum thread.
								<a href="https://twitter.com/blockchaintechs" class=""><img width="50px" src="images/bitcointalkicon.png"/></a>
							</p>
							<p>
								Find us on social media
								<a href="https://twitter.com/blockchaintechs" class=""><img width="50px" src="images/twitter_icon.png"/></a>
								<a href="https://www.facebook.com/blockchaintechnologies" class=""><img width="50px" src="images/facebook_icon.png"/></a>
							</p>
							<p>Or email us, at <a href="mail:darren@blockchaintechs.com">darren@blockchaintechs.com</a></p>
						</section>
					
					</div>
					<div class="4u">

						<section>
							<footer class="controls">
								<a href="<%=coin.getWebsite() %>" target="_blank" class="button"><img width="200px" src="images/coinLogo.png"/></a>
							</footer>
						</section>

					</div>
				</div>
				<div class="row">
					<div class="12u">

						<div id="copyright">
							&copy; Blockchain Technologies Inc. All rights reserved. | Design: <a href="http://html5up.net">HTML5 UP</a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</body>
</html>