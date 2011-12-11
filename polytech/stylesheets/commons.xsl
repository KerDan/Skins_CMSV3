<?xml version="1.0" encoding="UTF-8"?>
<!-- template commun à tous les gabarit du skin UPSud v3 -->
<!-- Daniel Kerboeuf, novembre 2011 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
							xmlns:i18n="http://apache.org/cocoon/i18n/2.1" 
							xmlns:xalan="http://xml.apache.org/xalan"
							xmlns:sitemap="http://www.ametys.org/inputdata/sitemap/3.0"
							exclude-result-prefixes="sitemap">
        
    <xsl:import href="skin://stylesheets/attributes-labels.xsl" />
    
    <xsl:variable name="prefix"><xsl:value-of select="$contextPath"/></xsl:variable>
    <xsl:variable name="resource-prefix">resources://</xsl:variable>
    <xsl:variable name="document-prefix">document://</xsl:variable>
    <xsl:variable name="back-office">true</xsl:variable>        
        
	<!--  ********************************************	-->
	<!--  **			Template de base			**	-->
	<!--  ********************************************	-->
	<xsl:template name="template">
		<html>
			<head>
				<title>
					<xsl:if test="/cms/page" >
						<xsl:value-of select="/cms/page/@title" />
					</xsl:if>
				</title>
				<xsl:call-template name="meta" />			
				<xsl:call-template name="common-css" />
				<xsl:call-template name="additionnal-css" />
                <link rel="shortcut icon" href="{$skincontext}/ico/favicon.ico" />
                <link rel="icon" type="image/png" href="{$skincontext}/ico/icon.png" />
                <link rel="apple-touch-icon" href="{$skincontext}/ico/apple-touch-icon.png" />
			</head>
			
			<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
				<table width="895" border="0" cellspacing="0" cellpadding="0" align="center"> <!--  container principal -->
					<tr> <!--  header -->
						<td>
							<xsl:call-template name="header"/>
						</td>
					</tr>
					<tr> <!--  middle -->
						<td>
							<xsl:call-template name="middle"/>
						</td>
					</tr>
					<tr> <!-- footer -->
						<td>
							<xsl:call-template name="footer"/>
						</td>
					</tr>
				</table>
				<xsl:if test="$back-office = 'front'">
					<xsl:call-template name="google"/>
				</xsl:if>
			</body>
		</html>
	</xsl:template>

	<!--  ********************************************	-->
	<!--  **			balises meta				**	-->
	<!--  ********************************************	-->
	<!--  cf http://www.alsacreations.com/article/lire/628-balises-meta.html  -->
	<xsl:template name="meta">
		<meta name="language" content="{$lang}" />
		<meta name="description">
			<xsl:attribute name="content">
				<xsl:choose>
					<xsl:when test="/cms/page/pageContents/zone[@name = 'default']/zoneItem/html/head/meta[@name = 'DC.description']">
						<xsl:value-of select="/cms/page/pageContents/zone/zoneItem/html/head/meta[@name = 'DC.description']/@content" />
					</xsl:when>
					<xsl:otherwise><xsl:text>Bienvenue sur le site de Polytech Paris-Sud, école d'ingénieur de l'Université Paris-sud</xsl:text></xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</meta>
	 	<meta name="subject">
			<xsl:attribute name="content">
				<xsl:choose>
					<xsl:when test="/cms/page/pageContents/zone[@name = 'default']/zoneItem/html/head/meta[@name = 'DC.subject']">
						<xsl:value-of select="/cms/page/pageContents/zone/zoneItem/html/head/meta[@name = 'DC.subject']/@content" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Université Paris-Sud, formation, recherche, science</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</meta>
	<!-- Copy Dublin Core metadata. 
		<xsl:copy-of select="/cms/page/pageContents/zone[@name = 'default']/zoneItem/html/head/meta[starts-with(@name, 'DC.')]"/>
	-->
	</xsl:template>
	

	<!--  ********************************************	-->
	<!--  **			Common CSS					**	-->
	<!--  ********************************************	-->
	<xsl:template name="common-css">
		<link type="text/css" href="{$skincontext}/css/u-psud.css" rel="stylesheet"/>
		<link type="text/css" href="{$skincontext}/css/custom-services-contents.css" rel="stylesheet"/>
		<link type="text/css" href="{$skincontext}/css/print.css" rel="stylesheet" media="print" />
	</xsl:template>
	

	<!--  ********************************************	-->
	<!--  **				header					**	-->
	<!--  ********************************************	-->
	<xsl:template name="header">
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
				<td rowspan="3" height="64" width="200">
					<a href="{$cms-context}/{$lang}/index.html"><img src="{$skincontext}/img/logoweb_polytech.png" width="200" height="64" alt="logo" border="0"/></a>
				</td>
				<td valign="top" align="right">
					<xsl:call-template name="top-toolbar"/>
				</td>
			</tr>
			<tr>
				<td valign="top" align="right">
					<xsl:call-template name="navigation-top"/>
				</td>
			</tr>
			<tr>
				<td valign="top" align="right">
					<table height="37" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="30"><a href="{$cms-context}/fr/index.html"><img src="{$skincontext}/img/top_fr.gif" width="24" border="0" height="37"/></a></td><!-- version francaise -->
							<td width="30"><a href="{$cms-context}/en/index.html"><img src="{$skincontext}/img/top_en.gif" width="24" border="0" height="37"/></a></td><!-- version anglaise -->
							<td width="30"><img src="{$skincontext}/img/pixel.gif" width="24" height="37"/></td><!-- autre version ... -->
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</xsl:template>
 		
	<!-- ****************************************************************** -->
	<xsl:template name="navigation-top">
		<table height="32" border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="5">
					<img src="{$skincontext}/img/top_navigation_borderleft.png" width="10" height="32" />
				</td>
				<td background="{$skincontext}/img/top_navigation_bkg.png" class="top_navigation">
					<xsl:for-each select="/cms/inputData/sitemap/page[@PLUGIN_TAGS_RUBRIQUE]">
						<a href="{$cms-context}/{$lang}/{@sitemap:path}.html">
							<xsl:attribute name="class">top_navigation<xsl:if test="@sitemap:current = 'true'">_on</xsl:if></xsl:attribute>
							<xsl:value-of select="@sitemap:title"/>
						</a>
						<xsl:if test="not(position() = last())">&#160;&#160;|&#160;&#160;</xsl:if>
					</xsl:for-each>
				</td>
				<td width="6">
					<img src="{$skincontext}/img/top_navigation_borderright.png" width="10" height="32" />
				</td>
			</tr>
		</table>
	</xsl:template>

	<!--  ********************************************	-->
	<!--  **		moteur de recherche				**	-->
	<!--  ********************************************	-->
	<xsl:template name="search">
        <table border="0" cellspacing="0" cellpadding="0" align="center" height="16">
            <form method="post" action="{$cms-context}/{$lang}/{/cms/inputData/sitemap//page[@PLUGIN_TAGS_RESEARCH]/@sitemap:path}.html#nav" id="research">
                <input type="hidden" name="submit-form"/>
                <tr>
                    <td valign="middle">
                        <input type="text" name="textfield" id="textfield" class="text_field" size="15" maxlength="500"/>
                    </td>
                    <td width="16" valign="top">
                        <input type="image" src="{$skincontext}/img/top_search.gif" value="submit" border="0" style="margin-top: 5px;"/>
                    </td>
                </tr>
            </form>            
        </table>
	</xsl:template>

	<!--  ********************************************	-->
	<!--  **			Google analytics			**	-->
	<!--  ********************************************	-->
	<xsl:template name="google">
        <script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        
        <script type="text/javascript">
        var pageTracker = _gat._getTracker("UA-1379301-1");
        pageTracker._initData();
        pageTracker._trackPageview();
        </script>
	</xsl:template>


	<!-- ****************************************************************** -->
	<!-- 						INTRANET 									-->
	<!-- ****************************************************************** -->
	<!-- Lien vers l'Intranet accessible sur toutes les pages -->
		<xsl:variable name="lien_intranet">#intranet</xsl:variable>
		
	<!-- ****************************************************************** -->
	<!-- 						LIENS EN BAS DE PAGE						-->
	<!-- ****************************************************************** -->
	<!-- Lien vers le plan du site -->
		<xsl:variable name="url_sitemap">sitemap.html</xsl:variable>
	<!-- Lien vers le page d'acces -->
		<xsl:variable name="url_access">access.html</xsl:variable>
	<!-- Lien vers le page des informations légales -->
		<xsl:variable name="url_info_legales">info_legales.html</xsl:variable>
	<!-- EMail du webmaster -->
		<xsl:variable name="webmaster">webmaster@u-psud.fr</xsl:variable>
	
	<!-- *********************************************************************************************** -->
	<!-- 						Phrases explicatives d'introduction des composantes					     -->
	<!-- *********************************************************************************************** -->
		<xsl:variable name="compo_presentation">Phrase explicative de présentation à personnaliser dans le fichier custom.xsl</xsl:variable>
		<xsl:variable name="compo_search">Phrase explicative d'introduction de la recherche à personnaliser dans le fichier custom.xsl</xsl:variable>
		<xsl:variable name="compo_formation">Phrase explicative d'introduction des formations à personnaliser dans le fichier custom.xsl</xsl:variable>

	<!-- *********************************************************************************************** -->
	<!-- 						Barre de navigation (nombre de rubriques à afficher)				      -->
	<!-- *********************************************************************************************** -->
		<xsl:variable name="navbar_max">6</xsl:variable>
</xsl:stylesheet>