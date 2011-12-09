<?xml version="1.0" encoding="UTF-8"?>
<!-- template commun aux gabarits du skin intranet -->
<!-- Daniel Kerboeuf, décembre 2011 -->
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
			
			<body>
				<div id="container" class="container_12">
					<xsl:call-template name="header"/>
					<xsl:call-template name="navbar"/>
					<xsl:call-template name="breadcrumb"/>
					<xsl:call-template name="content"/>
					<xsl:call-template name="rightcol"/>
					<xsl:call-template name="footer"/>
				</div>
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
					<xsl:otherwise><xsl:text>Intranet de l'Université Paris-Sud</xsl:text></xsl:otherwise>
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
		<link type="text/css" href="{$skincontext}/css/style.css" rel="stylesheet"/>
		<link type="text/css" href="{$skincontext}/css/960_12_col.css" rel="stylesheet"/>
		<link type="text/css" href="{$skincontext}/css/intranet.css" rel="stylesheet"/>
		<link type="text/css" href="{$skincontext}/css/custom-services-contents.css" rel="stylesheet"/>
		<link type="text/css" href="{$skincontext}/css/print.css" rel="stylesheet" media="print" />
	</xsl:template>
	

	<!--  ********************************************	-->
	<!--  **				header					**	-->
	<!--  ********************************************	-->
	<xsl:template name="header">
		<div id="header" class="grid_12">
			<h1 class="hidden">Intranet Université Paris-Sud</h1>
		</div>
		<div class="clear"></div>
	</xsl:template>
 
 	<!--  ********************************************	-->
	<!--  **				navbar					**	-->
	<!--  ********************************************	-->
	<xsl:template name="navbar">
		<div id="navbar" class="grid_12 nav">
			<ul class="nav">
				<li>
					<a href="{$cms-context}/fr/index.html"><img src="{$skincontext}/img/home_icon.png" width="16px" height="16px" alt="accueil" /></a>&#160;|&#160;
				</li>
				<xsl:for-each select="/cms/inputData/sitemap/page[@PLUGIN_TAGS_RUBRIQUE]">
					<li>
						<a href="{$cms-context}/{$lang}/{@sitemap:path}.html">
							<xsl:attribute name="class">top_navigation<xsl:if test="@sitemap:current = 'true'">_on</xsl:if></xsl:attribute>
							<xsl:value-of select="@sitemap:title"/>
						</a>
						<xsl:if test="not(position() = last())">&#160;|&#160;</xsl:if>
					</li>
				</xsl:for-each>
				<div class="clear"></div>
			</ul>
		</div>
		<div class="clear"></div>
	</xsl:template>
	
	<!--  ********************************************	-->
	<!--  **				breadcrumb					**	-->
	<!--  ********************************************	-->
	<xsl:template name="breadcrumb">
		<div id="breadcrumb" class="grid_12">
			<ul class="nav">
			<xsl:variable name="in_path" select="/cms/inputData/sitemap/descendant::*[@sitemap:in-path='true']"/>
			<xsl:for-each select="$in_path[@sitemap:path != 'index']">
				<li>
				<xsl:choose>
 					<xsl:when test="@sitemap:current='true'">&#160;<xsl:value-of select="@sitemap:title"/></xsl:when>
					<xsl:otherwise>&#160;<a href="{$cms-context}/fr/{@sitemap:path}.html" class="path"><xsl:value-of select="@sitemap:title"/></a>&#160;&gt;</xsl:otherwise>
				</xsl:choose>
				</li>
    		</xsl:for-each>
			</ul>
		</div>
		<div class="clear"></div>
	</xsl:template>


	<!--  ********************************************	-->
	<!--  **				footer					**	-->
	<!--  ********************************************	-->
	<xsl:template name="footer">
		<div class="clear"></div>
		<div id="footer" class="grid_12">
			<p></p>
		</div>
	</xsl:template>


	<!-- ****************************************************************** -->

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

</xsl:stylesheet>