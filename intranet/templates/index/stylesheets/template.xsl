<?xml version="1.0" encoding="UTF-8"?>
<!-- template de la page d'accueil du skin UPSud v3 -->
<!-- Daniel Kerboeuf, novembre 2011 -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
	xmlns:sitemap="http://www.ametys.org/inputdata/sitemap/3.0"
	xmlns:xalan="http://xml.apache.org/xalan"
	xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date"
	exclude-result-prefixes="sitemap">

	<xsl:import href="skin://stylesheets/commons.xsl" />

	<xsl:template name="additionnal-css">
				<link href="{$skincontext}/css/accueil.css" rel="stylesheet" type="text/css"/>
	</xsl:template>

	<!--  ********************************************	-->
	<!--  **				content					**	-->
	<!--  ********************************************	-->
	<xsl:template name="content">
		<div class="grid_12">
			<zone name="default" level="2"/>
		</div>
	</xsl:template>


	<!--  ********************************************	-->
	<!--  **				rightcol				**	-->
	<!--  ********************************************	-->
	<xsl:template name="rightcol">
	</xsl:template>

</xsl:stylesheet>