<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="/WEB-INF/tlds/c.tld" %>
<%@  taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld" %>
<!DOCTYPE html >
<html> 
<head> 
            <title>Kellogg’s Special K Snack Store</title> 
<meta name="description" content="Say ‘YES’ to Special K Biscuit Moments and other delicious   snacks using our Special K Snack Store."/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/css/pc/main_kellogg_fr.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/scroll/jquery.mousewheel.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/scroll/jquery.mCustomScrollbar.js"></script>
<script src="${pageContext.request.contextPath}/js/pc/kellogg_fr/common.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/cufon.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/Caecilia_LT_Std-Roman_italic_400.font.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/cufon/defineCufon.js"></script>
<script>
	$(document).ready(function() {
	
		$(".help_text").mCustomScrollbar({
			autoDraggerLength:true,
		});
		//alert($("#defaultRetailerPrice").val())
		//displayDefaultBasketInfo();
});
	
	function scrollTo(divId) {
		$(".help_text").mCustomScrollbar("scrollTo","#"+divId);
		
	}
	
	 var _gaq = _gaq || [];
	 _gaq.push(['_setAccount', '${brandModel["gaNumber"]}']);
	  _gaq.push(['_trackPageview','Help']);

	 _gaq.push(['b._setAccount', 'UA-35779257-6']);
	  _gaq.push(['b._trackPageview','Help']);
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
		</script>
		
<!-- Piwik  -->
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.dotter.me/" : "http://piwik.dotter.me/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php",4);
piwikTracker.setDocumentTitle("Help");
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="http://piwik.dotter.me/piwik.php?idsite=4" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->
</head>
<body id="Help Page">
	<div id="BlowFishHomePage" class="blowfish_page">
          <div class="blowfish_term_header">
      <a href="${pageContext.request.contextPath}/${brandModel['brandName']}">
				<img src="${pageContext.request.contextPath}/blowfish_images/kellogg/logo_kellogg.png"
				height="69" name="" border="0"> </a>    </div>
          <div class="clear"></div>
          <div class="terms_content">
								<!--          <div class="help_content_title">Help topics </div> --> 
                       <div class="help_text">
							
							
							
							
				<div class="terms_text_d01">				
							•&nbsp;&nbsp;	<span onClick="scrollTo('intro')" id="top">Introduction</span>
<br />
•&nbsp;&nbsp;	<span onClick="scrollTo('Selecting')">Sélectionner votre magasin</span>
<br />
•&nbsp;&nbsp;	<span  onclick="scrollTo('Finding')">Trouver les produits</span>
<br />
•&nbsp;&nbsp;	<span  onclick="scrollTo('Adding')">Ajouter et supprimer les produits</span>
<br />
•&nbsp;&nbsp;	<span  onclick="scrollTo('Pricing')">Prix et offres promotionnelles</span>
<br />
•&nbsp;&nbsp;	<span  onclick="scrollTo('Additional')">Informations supplémentaires sur les produits</span>
<br />
•&nbsp;&nbsp;	<span  onclick="scrollTo('basket')">Ajouter au panier</span>
<br />
•&nbsp;&nbsp;	<span  onclick="scrollTo('Data')">Donnée et sécurité</span>
							
		</div>					
							
	<br />					
			
<span id="intro">INTRODUCTION</span>
         <div class="help_text_d01">	
            <ul>
               <li>	 	
 En utilisant le magasin en ligne de<b> Kellogg's</b>, c'est facile et pratique d'ajouter les céréales et en-cas <b>Special K </b>dans le panier de votre magasin préféré sans avoir besoin de visiter le site du magasin.              

		        </li>
		        <li>
 La prochaine fois que vous visitez le site de votre magasin préféré, vous verrez vos produits sélectionnés déjà dans votre panier. Ensuite, il vous suffit de passer à la caisse.
		        </li>
		        <li>
Le magasin en ligne<b> Special K</b> de <b>Kellogg’s</b> est facile à utiliser et conforme entièrement avec les protocoles de sécurité les plus strictes.       </li>
		        <li>
Vous n'achetez pas les produits directement à partir de Kellogg, vous ajoutez des produits dans le panier de votre magasin préféré en utilisant notre service. Ces produits peuvent être retirés à tout moment sur le site de votre magasin préféré. Vous n'êtes pas obligé d'acheter dans le magasin en ligne de Kellogg’s Special K.
     </li>
		        <li>
<b>Veuillez éviter l'utilisation des boutons du navigateur « précédent » et « suivant ». Veuillez utiliser les boutons fonctionnels du site.	</b>				
			        </li>
		        </ul>
	</div>					
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')" style="margin-left:2px;">Retour en haut de page
			     </li>
				</ul>
	         </div>				
				<br />
		<span id="Selecting">Sélectionner votre magasin</span>			
         <div class="help_text_d02">	
            <ul>
               <li>	 
•&nbsp;&nbsp;	Sélectionnez votre magasin préféré dans le panneau des magasins (souligné ci-dessous)	
			<br />	
			<img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/help01.png"  height="400"  name="" border="0">
		        </li>
		        <li style="line-height:45px;">	
			•&nbsp;&nbsp;	Vous pouvez changer de magasin à tout moment en sélectionnant un autre magasin dans le panneau (souligné ci-dessous)
			<br />
			<img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/help02.png"  height="400" style="padding-top:10px;"  name="" border="0">
		        </li>
		        <li>	
			
			•&nbsp;&nbsp;	Changer de magasin ne supprime pas les produits que vous avez sélectionnés pour le magasin précédent. Nous conserverons les produits sélectionnés pour chaque magasin. Les produits sélectionnés resteront pour si ou quand vous revenez à ce magasin.
			</li>
		        <li>		
	     	Voir ci-dessous pour savoir comment supprimer les produits
	     			</li>
				</ul>
	</div>			
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')">Retour en haut de page
			     </li>
				</ul>
	         </div>			
				<br />
		<span id="Finding">Trouver les produits</span>			
					
         <div class="help_text_d02">	
            <ul>
               <li>	 
	     	
	     									
			•&nbsp;&nbsp;	Lorsque vous avez sélectionné votre magasin préféré, vous pouvez trouver la gamme complète des produits disponibles dans ce magasin en utilisant le panneau des catégories (souligné ci-dessous)	
			<br />		
			<img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/help03.png"  height="400"  name="" border="0">			
		        </li>
		        <li>			
			•&nbsp;&nbsp;	Les produits, par type, qui sont disponibles dans votre magasin sélectionné seront mis en étalage avec une image de produit et prix en temps réel et offres promotionnelles
		        </li>
		        <li>	
			•&nbsp;&nbsp;	C'est possible que tous les produits ne seront pas disponibles dans tous les magasins
		        </li>
		        <li>	
			•&nbsp;&nbsp;	Si vous ne trouvez pas ce que vous recherchez dans un magasin, veuillez essayer un autre produit ou un autre magasin.
					   </li>
				</ul>
	             </div>		
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')">Retour en haut de page
			     </li>
				</ul>
	         </div>			
				<br />
		    <span id="Adding">Ajouter et supprimer les produits</span>			
         <div class="help_text_d02">	
            <ul>
               <li>	  		
						
			 •&nbsp;&nbsp;	Ajouter et supprimer les produits avec le bouton<img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/help04.png"  height="18"  name="" border="0">	
		        </li>
		        <li>
			   •&nbsp;&nbsp;	La quantité d'un produit sélectionné sera affichée dans le bouton
		        </li>
		        <li>
			   •&nbsp;&nbsp;	Ces informations seront aussi portées à travers à votre panier dans le panneau de panier, souligné ci-dessous.
               <br />	
		 	   <img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/help05.png"  height="400"  name="" border="0">			
		        </li>
		        <li>						
				•&nbsp;&nbsp;	Si vous voulez supprimer la quantité totale d’un produit spécifique de votre panier, cliquez   <img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/icon_del.png"  height="16"  name="" border="0">		
					  </li>
				</ul>
	             </div>							
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')">Retour en haut de page
			     </li>
				</ul>
	         </div>				
		
			   <br />
		    <span id="Pricing">Prix et offres promotionnelles </span>			
         <div class="help_text_d02">	
            <ul>
               <li>	         	 
				•&nbsp;&nbsp; Notre service en ligne présente des informations des magasins en temps réel. Le prix et les offres promotionnelles que vous verrez sont les prix et offres promotionnelles disponibles dans le magasin que vous avez sélectionné.
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Le prix de ligne présenté est le prix pour le produit, multiplié par la quantité choisie, sans offre promotionnelle appliqué.
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Les « Economies » montrent la quantité d'argent économisé par les offres promotionnelles qui ont été appliquées aux produits dans votre panier
		        </li>
		        <li>
		      •&nbsp;&nbsp;	« Total » montre la somme des prix de ligne, avec « Economies » déduites
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Le prix « Total » est le prix actuel, qui peut changer selon du jour que vous passez à la caisse de votre magasin en ligne sélectionné et l'horaire de votre livraison. 
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Nous ne pouvons pas garantir que le prix présenté quand vous avez ajouté des produits à votre panier sera le même prix que vous devrez payer à la caisse.
              		  </li>
				</ul>
	             </div>	
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')">Retour en haut de page
			     </li>
				</ul>
	         </div>				
				 
				 <br />
		    <span id="Additional">Informations supplémentaires sur les produits</span>			
         <div class="help_text_d02">	
            <ul>
               <li>			
				•&nbsp;&nbsp; Si vous cliquez sur le bouton <img src="${pageContext.request.contextPath}/images/pc/kellogg_fr/info_btn.png"  height="16"  name="" border="0">  à côté d’un produit ceci ouvrira des informations et détails supplémentaires sur un produit en particulier. Les informations sont présentées en tables et sont facile à lire.
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Vous pouvez retourner à la liste des produits à tout moment en cliquant le bouton « VOIR TOUS LES PRODUITS » 
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Les boutons fonctionnels de sélection des produits, les informations de prix et les offres promotionnelles sont aussi disponibles sur les pages d'informations des produits
				  </li>
                 </ul> 
     			</div>	
				   <div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')">Retour en haut de page
			     </li>
				</ul>
	         </div>	
				
				   <br />
					 <span id="basket">Ajouter au panier</span>			
         <div class="help_text_d02">	
            <ul>
               <li>	
					•&nbsp;&nbsp; Lorsque vous avez choisi tous vos produits, vous aurez besoin de confirmer que vous voulez transférer ceux-ci à votre panier de votre magasin sélectionné.
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Pour ajouter les produits à votre panier de votre magasin sélectionné, vous aurez besoin d’entrer votre identifiant et votre mot de passe pour ce magasin.
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Choisir si vous voulez recevoir des offres promotionnelles de <b>Special K</b> de <b>Kellogg’s</b>
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Enfin cliquez « Ajouter au panier »
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Vous verrez alors que le traitement des données apparaissent sur votre écran pour vous tenir au courant. Ceci ne devrait pas prendre plus que quelques secondes à compléter.
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Selon que les produits sont disponibles, les produits seront ajoutés à votre panier et vous verrez « Merci » comme confirmation.
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Si les produits ne peuvent pas être ajoutés, probablement à cause de la disponibilité dans votre région, vous serez demandés si vous voulez ajouter autres produits ou continuer. Veuillez suivre les instructions qui apparaissent sur l'écran.
		      </li>
		        <li>
		      •&nbsp;&nbsp;	S'il y a un problème avec l’identifiant ou le mot de passe, des instructions pour réessayer apparaîtra sur l'écran. S'il y a un deuxième problème, nous vous référerons au site du magasin.
		      </li>
     </ul> 
     			</div>	
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')">Retour en haut de page
			     </li>
				</ul>
	         </div>				

			<br />
					 <span id="Data">Donnée et sécurité</span>			
         <div class="help_text_d02">	
         
             <ul>
               <li>
					•&nbsp;&nbsp;	Nous ne voulons ni nécessitons pas des détails de banque ou paiement de votre part.
		        </li>
		        <li>
		      •&nbsp;&nbsp;	Nous nécessitons que vous entrez votre identifiant et votre mot de passe de votre magasin préféré. Ceci nous permet d’ajouter vos produits dans votre panier.
		      </li>
		          <li>
		      •&nbsp;&nbsp;	Nous ne partageons ni gardons pas l’information de votre mot de passe.
		          </li>
		          <li>
		      •&nbsp;&nbsp;	Si vous nous permettez, nous pouvons utiliser votre adresse électronique pour vous informer d'offres promotionnelles exclusives de <b>Special K</b> de <b>Kellogg’s</b>. 
		          </li>
		          <li>
		      •&nbsp;&nbsp;	Nous ne partagerons jamais vos détails à des tiers.
		          </li>
		          <li>
					Pour des informations supplémentaires – veuillez consulter les <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#000000;text-decoration: underline;font-size:11px;font-family:Arial, Verdana, Tahoma;">TERMES</span></a>
		          </li>

     </ul>
     					</div>	
	     	<div class="help_back_top" >
			   <ul>
		         <li onClick="scrollTo('top')">Retour en haut de page
			     </li>
				</ul>
	         </div>	
  	<br />
			<div class="terms_text_d01">	
				Si vous avez d'autres questions, veuillez nous contacter à  <a href="mailto:enquiries@dotter.me" style="color:#666666;">enquiries@dotter.me</a>
  
					</div>
			         	<br />	
					</div>	          
	      </div>
		     
		     <div style="float: right; margin-right: 25px;">
	                     <input class="input_btn03" style="width: 120px; margin-top:20px; " type="button" value="BACK" name="" onClick="goBack();"/>
	                  </div>
		       <div class="sch_footer">
	                       <img src="${pageContext.request.contextPath}/images/logo_dotter.png" height="18" name="" border="0">
	                       EFFECTUÉ PAR DOTTER EN ASSOCIATION AVEC KELLOGG’S - <a href="${pageContext.request.contextPath}/${brandModel['brandName']}/${defaultRetailer}/${defaultCategory}/terms"><span style="color:#ffffff;">TERMES</span></a>
	                  </div>
	                  
   </div>
</body>
</html>