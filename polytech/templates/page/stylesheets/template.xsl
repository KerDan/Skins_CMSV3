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
	<!--  **				header					**	-->
	<!--  ********************************************	-->
	<xsl:template name="header">
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
				<td rowspan="3" height="108" width="210">
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

	<xsl:template name="top-toolbar">
          <table height="37" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="93">
				<!-- Lien plan d'accès -->
				<xsl:if test="/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_MAP]">
					<a href="{$cms-context}/{$lang}/{/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_MAP]/@sitemap:path}.html">
						<img src="{$skincontext}/img/{$lang}/top_acces.gif" width="93" height="37" alt="Plans d'accès aux campus" border="0"/>
					</a>
				</xsl:if>
			  </td>
			  <td width="76">
				<!-- Lien Contact -->
				<xsl:if test="/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_CONTACT]">
					<a href="{$cms-context}/{$lang}/{/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_CONTACT]/@sitemap:path}.html">
						<img src="{$skincontext}/img/{$lang}/top_contact.gif" width="76" height="37" alt="Vos contacts à l'Université" border="0" />
					</a>
				</xsl:if>
			  </td>
			  <td width="75">
				<!-- Lien Annuaire -->
				<a href="http://www.annuaire.u-psud.fr/"><img src="{$skincontext}/img/{$lang}/top_annuaire.gif" width="75" height="37" alt="Annuaire de l'Universitï¿½" border="0" /></a>
			  </td>
              <td width="93">
				<!-- Lien plan du site -->
					<xsl:if test="/cms/inputData/sitemap//page[@PLUGIN_TAGS_SITEMAP]">
						<a class="sitemap" href="{$cms-context}/{$lang}/{/cms/inputData/sitemap//page[@PLUGIN_TAGS_SITEMAP]/@sitemap:path}.html">
							<img src="{$skincontext}/img/{$lang}/top_sitemap.gif" width="93" height="37" alt="Plan du site web" border="0" />
						</a>
					</xsl:if>                             
			  </td>
              <td width="150" height="37"><xsl:call-template name="search"/></td>
            </tr>
          </table>
	</xsl:template>


  <xsl:template name="middle">
    <table bgcolor="#ffffff" border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr> <!-- bandeau -->
                <xsl:choose>
                    <xsl:when test="$style != ''">
                        <td background="{$stylecontext}/img/bandeau_web.jpg" height="80"></td>    
                    </xsl:when>
                    <xsl:otherwise>
                        <td background="{$templatecontext}/default/img/bandeau_web.jpg" height="80"></td>
                    </xsl:otherwise>
                </xsl:choose>
        
      </tr>
      <tr> <!-- fil d'arianne -->
        <td>
          <div class="path">
            <xsl:call-template name="asc-nav"/>
          </div>
        </td>
      </tr>
      <tr> <!-- contenu principal -->
        <td>
          <xsl:call-template name="content"/>
        </td>
      </tr>
    </table>
  </xsl:template>


  <xsl:template name="footer">
    <p>...</p>
  </xsl:template>


 <!-- fil d'arianne -->
  <xsl:template name="asc-nav">
    <xsl:variable name="nav" select="/cms/inputData/sitemap/descendant::*[@sitemap:in-path='true']"/>
    <xsl:for-each select="$nav[@sitemap:path != 'index']">
      <xsl:choose>
          <xsl:when test="@sitemap:current='true'">
            &#160;<xsl:value-of select="@sitemap:title"/>
          </xsl:when>
          <xsl:otherwise>
            &#160;<a href="{$cms-context}/{$lang}/{@sitemap:path}.html" class="path"><xsl:value-of select="@sitemap:title"/></a>&#160;&gt;
          </xsl:otherwise>
        </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="focus">
    <div id="focus">
		<zone name="focus" level="2"/>
    </div>
  </xsl:template>
  
  <xsl:template name="content">
    <table width="100%">
      <tr>
        <td valign="top" rowspan="2">
        <xsl:variable name="rubrique" select="/cms/inputData/sitemap/page[@sitemap:in-path='true']" />
          <xsl:choose>
            <xsl:when test="name(/cms/inputData/sitemap//page[@sitemap:current = 'true']/parent::*) = 'page'">
              <xsl:call-template name="navigation-menu"/> 
            </xsl:when>
            <xsl:when test="name(/cms/inputData/sitemap//page[@sitemap:current = 'true']/parent::*) = 'sitemap'">
              <xsl:call-template name="subnavigation"/> 
            </xsl:when>
          </xsl:choose>
		 <div id="annexe_cg">
			<zone name="zone-left-page" level="2"/>
		 </div>
        </td>
        <td colspan="2">
              <table border="0" cellspacing="0" cellpadding="0" height="28" width="100%" background="{$templatecontext}/default/img/page_title_bkg.gif" class="page_title_bkg">
                <tr>
                  <td width="33"><img src="{$templatecontext}/default/img/page_title_bullet.gif" width="33" height="32"/></td>
                  <td valign="top">
                    <xsl:variable name="title">
                    	<xsl:choose>
                    		<xsl:when test="cms/page/@long-title != ''">
                    			<xsl:value-of select="cms/page/@long-title"/>
                    		</xsl:when>
                    		<xsl:otherwise>
                    			<xsl:value-of select="cms/page/@title"/>
                    		</xsl:otherwise>
                    	</xsl:choose>
                    </xsl:variable>
                    <h1 class="title"><xsl:value-of select="$title"/></h1>
                   </td>
                </tr>
              </table>
        </td>
      </tr>
      <tr>
        <td valign="top">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td valign="top" style="height: 560px" class="text">
                          <xsl:call-template name="print"/>
                          <br />
                                <br />
                                <div class="content">
                                    <zone name="default" level="2"/>
                                </div>
                          <div align="right"> . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .<br />
                          <br />
                          <a class="top" href="#top">haut .:.</a></div>
                          <br />
                        </td>
                      </tr>
                    </table>
        </td>
        <td valign="top">
			<xsl:call-template name="focus"/>
        </td>
      </tr>
    </table>
  </xsl:template>


  <xsl:template name="print">
    <table border="0" cellspacing="0" cellpadding="0" align="right" style="padding-top:3px">
      <tr>
        <td>
          <img align="middle" src="{$skincontext}/img/print.gif" border="0"/>
        </td>
        <td style="padding-left:5px">
          <a class="print" href="javascript:print();"><i18n:text i18n:key="print" i18n:catalogue="skin.{$skin}"/></a>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template name="subnavigation">
    <xsl:if test="/cms/inputData/sitemap//page[@sitemap:current = 'true']/page"> <!-- on n'affiche le menu que s'il y a des sous pages -->
    <table width="204" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td background="{$stylecontext}/img/page_navigation_bkg.gif">
          <xsl:for-each select="/cms/inputData/sitemap//page[@sitemap:current = 'true']/page">
            <table width="190" height="22" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="25" valign="top"><img src="{$stylecontext}/img/page_navigation_bullet.gif" width="22" height="22" /></td>
                <td valign="top" class="page_navigation"><a href="{$cms-context}/{$lang}/{@sitemap:path}.html" class="page_navigation_links"><xsl:value-of select="@sitemap:title"/></a></td>
              </tr>
            </table>
          </xsl:for-each>
        </td>
      </tr>
      <tr>
        <td height="5"><img src="{$stylecontext}/img/page_navigation_bottom.gif" width="204" height="5" /></td>
      </tr>
    </table>
    </xsl:if>
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