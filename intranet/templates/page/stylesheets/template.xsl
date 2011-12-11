<?xml version="1.0" encoding="iso-8859-1"?>
<!-- template des pages du skin UPSud v3 -->
<!-- Daniel Kerboeuf, novembre 2011 -->
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
    xmlns:sitemap="http://www.ametys.org/inputdata/sitemap/3.0"
    xmlns:xalan="http://xml.apache.org/xalan"
    xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date"
    exclude-result-prefixes="sitemap">

    <xsl:import href="skin://stylesheets/commons.xsl"/>

    <xsl:variable name="focus">true</xsl:variable>
    <xsl:variable name="stylePrefix">PLUGIN_TAGS_STYLES_PAGES_</xsl:variable>
    <xsl:variable name="style" select="translate(substring(name(/cms/inputData/sitemap//page[@sitemap:current='true']/ancestor-or-self::page[@*[starts-with(name(), $stylePrefix)]][1]/@*[starts-with(name(), $stylePrefix)]), string-length($stylePrefix)+1), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
    <xsl:variable name="stylecontext" select="concat($templatecontext, '/', $style)"/>

	<xsl:template name="additionnal-css">
		<link rel="stylesheet" href="{$skincontext}/css/content.css" type="text/css"/>                    
		<xsl:if test="$style != ''">
			<link rel="stylesheet" href="{$stylecontext}/css/style.css" type="text/css"/>                         
		</xsl:if>
	</xsl:template>

	<!--  ********************************************	-->
	<!--  **				content					**	-->
	<!--  ********************************************	-->
	<xsl:template name="content">
		<div class="grid_8" id="content">
			<zone name="default" level="2"/>
		</div>
	</xsl:template>

	<!--  ********************************************	-->
	<!--  **				rightcol				**	-->
	<!--  ********************************************	-->
	<xsl:template name="rightcol">
		<div class="grid_4" id="menu">
    <xsl:if test="/cms/inputData/sitemap//page[@sitemap:current = 'true']/page"> <!-- on n'affiche le menu que s'il y a des sous pages -->
      <ul class="nav">
      	<xsl:for-each select="/cms/inputData/sitemap//page[@sitemap:current = 'true']/page">
      		<li><a href="{$cms-context}/{$lang}/{@sitemap:path}.html" class="page_navigation_links"><xsl:value-of select="@sitemap:title"/></a></li>
       </xsl:for-each>
      </ul>
    </xsl:if>
		</div>
		<div class="grid_4" id="focus">
			<zone name="focus" level="2"/>
		</div>
	</xsl:template>
	

</xsl:stylesheet>