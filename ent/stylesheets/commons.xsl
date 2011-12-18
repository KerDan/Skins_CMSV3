<?xml version="1.0" encoding="UTF-8"?>
<!-- template commun à tous les gabarit du skin UPSud v3 -->
<!-- Daniel Kerboeuf, novembre 2011 -->
<!-- Adaptation ent, Sandrine RIVOIRE, decembre 2011 -->
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
        
  <!--  ********************************************  -->
  <!--  **      Template de base      **  -->
  <!--  ********************************************  -->
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
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center"> <!--  container principal -->
          <tr> <!--  middle -->
            <td>
              <xsl:call-template name="middle"/>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>

  <!--  ********************************************  -->
  <!--  **      balises meta        **  -->
  <!--  ********************************************  -->
  <!--  cf http://www.alsacreations.com/article/lire/628-balises-meta.html  -->
  <xsl:template name="meta">
    <meta name="language" content="{$lang}" />
    <meta name="description">
      <xsl:attribute name="content">
        <xsl:choose>
          <xsl:when test="/cms/page/pageContents/zone[@name = 'default']/zoneItem/html/head/meta[@name = 'DC.description']">
            <xsl:value-of select="/cms/page/pageContents/zone/zoneItem/html/head/meta[@name = 'DC.description']/@content" />
          </xsl:when>
          <xsl:otherwise><xsl:text>Bienvenue sur le site de l'Université Paris-Sud, première université en terme de distinctions, plus grand campus de France!</xsl:text></xsl:otherwise>
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
  

  <!--  ********************************************  -->
  <!--  **      Common CSS          **  -->
  <!--  ********************************************  -->
  <xsl:template name="common-css">
    <link type="text/css" href="{$skincontext}/css/u-psud.css" rel="stylesheet"/>
    <link type="text/css" href="{$skincontext}/css/custom-services-contents.css" rel="stylesheet"/>
    <link type="text/css" href="{$skincontext}/css/print.css" rel="stylesheet" media="print" />
  </xsl:template>
  

     
  <!-- ****************************************************************** -->
  <!--             LIENS EN BAS DE PAGE            -->
  <!-- ****************************************************************** -->
  <!-- Lien vers le plan du site -->
    <xsl:variable name="url_sitemap">sitemap.html</xsl:variable>
  <!-- Lien vers le page d'acces -->
    <xsl:variable name="url_access">access.html</xsl:variable>
  <!-- Lien vers le page des informations légales -->
    <xsl:variable name="url_info_legales">info_legales.html</xsl:variable>
  <!-- EMail du webmaster -->
    <xsl:variable name="webmaster">webmaster@u-psud.fr</xsl:variable>  
</xsl:stylesheet>