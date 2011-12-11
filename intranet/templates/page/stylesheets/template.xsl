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
	

<!-- navigation incluant les noeuds freres -->
  <xsl:template name="navigation-menu">
    <table width="204" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td background="{$stylecontext}/img/page_navigation_bkg.gif">
          <xsl:for-each select="/cms/inputData/sitemap//page[@sitemap:current = 'true']">
            <xsl:for-each select="./preceding-sibling::*">
              <table width="190" height="22" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="25" valign="top"><img src="{$stylecontext}/img/page_navigation_bullet.gif" width="22" height="22" /></td>
                  <td valign="top" class="page_navigation"><a href="{$cms-context}/{$lang}/{@sitemap:path}.html" class="page_navigation_links"><xsl:value-of select="@sitemap:title"/></a></td>
                </tr>
              </table>
            </xsl:for-each>
            <table width="190" height="22" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="25" valign="top" align="right"><img src="{$stylecontext}/img/page_navigation_bullet.gif" width="22" height="22" /></td>
                <td valign="top" class="page_navigation"><xsl:value-of select="@sitemap:title"/></td>
              </tr>
            </table>
            <xsl:for-each select="/cms/inputData/sitemap//page[@sitemap:current = 'true']/page">
              <table width="190" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="25" valign="top" align="right">&#160;</td>
                  <td valign="top" class="page_navigation">&#160;-&#160;<a href="{$cms-context}/{$lang}/{@sitemap:path}.html" class="page_navigation_links"><xsl:value-of select="@sitemap:title"/></a></td>
                </tr>
              </table>
            </xsl:for-each>
            <xsl:for-each select="./following-sibling::*">
              <table width="190" height="22" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="25" valign="top"><img src="{$stylecontext}/img/page_navigation_bullet.gif" width="22" height="22" /></td>
                  <td valign="top" class="page_navigation"><a href="{$cms-context}/{$lang}/{@sitemap:path}.html" class="page_navigation_links"><xsl:value-of select="@sitemap:title"/></a></td>
                </tr>
              </table>
            </xsl:for-each>
          </xsl:for-each>
        </td>
      </tr>
      <tr>
        <td height="5"><img src="{$stylecontext}/img/page_navigation_bottom.gif" width="204" height="5" /></td>
      </tr>
    </table>
  </xsl:template>
	

</xsl:stylesheet>