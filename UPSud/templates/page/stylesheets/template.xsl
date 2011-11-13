<?xml version="1.0" encoding="iso-8859-1"?>
<!-- template des pages du skin UPSud3 -->
<!--  mise en page en tableaux -->
<!-- Daniel Kerboeuf, Juin 2009 -->
<!-- fichier original enregistr� sous template_06_09.xsl -->
<!-- cette version est modifi�e pour test de navigation � 2 niveaux seulement pour la rubrique formation2010 -->
<!-- et affichage sans zone de menu � gauche quand il n'y a pas de sous page -->
<!-- cf skin v2.5 -->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
    xmlns:sitemap="http://www.ametys.org/inputdata/sitemap/3.0"
    xmlns:xalan="http://xml.apache.org/xalan"
    xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date"
    exclude-result-prefixes="sitemap">

    <xsl:import href="skin://stylesheets/commons.xsl"/>
    
    <xsl:variable name="resource-prefix">resources://</xsl:variable>
    <xsl:variable name="document-prefix">document://</xsl:variable>
    <xsl:variable name="focus">true</xsl:variable>

    <xsl:variable name="stylePrefix">PLUGIN_TAGS_STYLES_PAGES_</xsl:variable>
    <xsl:variable name="style" select="translate(substring(name(/cms/inputData/sitemap//page[@sitemap:current='true']/ancestor-or-self::page[@*[starts-with(name(), $stylePrefix)]][1]/@*[starts-with(name(), $stylePrefix)]), string-length($stylePrefix)+1), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
    <xsl:variable name="stylecontext" select="concat($templatecontext, '/', $style)"/>

<!-- template g�n�ral -->
  <xsl:template name="template">
    <html>
      <head>
        <title><xsl:value-of select="/cms/page/pageContents/area/html/head/title"/></title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <meta name="description" content="{/cms/page/pageContents/area/html/head/meta[@name='subject']/@content}"/>
        <meta name="keywords">
          <xsl:attribute name="content"><xsl:for-each select="/cms/page/pageContents/area/html/head/meta[@name='keywords']"><xsl:if test="position() != 1">,</xsl:if><xsl:value-of select="@content"/></xsl:for-each></xsl:attribute>
        </meta>
                <link rel="stylesheet" href="{$skincontext}/css/content.css" type="text/css"/>
                <xsl:choose>
                    <xsl:when test="$style != ''">
                        <link rel="stylesheet" href="{$stylecontext}/css/u-psud.css" type="text/css"/>
                        <link rel="stylesheet" href="{$stylecontext}/css/content.css" type="text/css"/>                         
                    </xsl:when>
                    <xsl:otherwise>
                        <link rel="stylesheet" href="{$templatecontext}/default/css/u-psud.css" type="text/css"/>                    
                    </xsl:otherwise>
                </xsl:choose>
                <link href="{$skincontext}/css/custom-services-contents.css" rel="stylesheet" type="text/css"/>
      </head>
      
      <body>
        <a name="top"/>
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
        <xsl:call-template name="google"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="header">
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
        <td rowspan="3" height="108" width="210">
          <a href="{$cms-context}/{$lang}/index.html"><img src="{$skincontext}/img/logoweb_ups.gif" width="200" height="64" alt="logo" border="0"/></a>
        </td>
        <td valign="top" align="right">
          <table height="37" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="93">
                                <!-- Lien plan d'acc�s -->
                                <xsl:if test="/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_MAP]">
                                    <a href="{$cms-context}/{$lang}/{/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_MAP]/@sitemap:path}.html">
                                        <img src="{$skincontext}/img/{$lang}/top_acces.gif" width="93" height="37" alt="Plans d'acc�s aux campus" border="0"/>
                                    </a>
                                </xsl:if>            
                            </td>
                            <td width="76">
                                <!-- Lien Contact -->
                                <xsl:if test="/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_CONTACT]">
                                    <a href="{$cms-context}/{$lang}/{/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_CONTACT]/@sitemap:path}.html">
                                        <img src="{$skincontext}/img/{$lang}/top_contact.gif" width="76" height="37" alt="Vos contacts � l'Universit�" border="0" />
                                    </a>
                                </xsl:if>                           
                            </td>
              <td width="75">
                                <a href="http://www.annuaire.u-psud.fr/"><img src="{$skincontext}/img/{$lang}/top_annuaire.gif" width="75" height="37" alt="Annuaire de l'Universit�" border="0" /></a>
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
              <!-- <td width="68"><a href="http://intra.web.u-psud.fr/UPS.nsf/index.htm"><img src="{$skincontext}/img/{$lang}/top_intranet.gif" width="68" height="37" alt="Intranet (acc�s restreint)" border="0"/></a></td> -->
            </tr>
          </table>
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

  <xsl:template name="navigation-top">
    <table height="32" border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td width="5">
          <img src="{$skincontext}/img/top_navigation_borderleft.gif" width="5" height="32" />
        </td>
        <td background="{$skincontext}/img/top_navigation_bkg.gif" class="top_navigation">
                    <xsl:for-each select="/cms/inputData/sitemap/page[@PLUGIN_TAGS_RUBRIQUE]">
                        <a href="{$cms-context}/{$lang}/{@sitemap:path}.html">
                            <xsl:attribute name="class">top_navigation<xsl:if test="@sitemap:current = 'true'">_on</xsl:if></xsl:attribute>
                            <xsl:value-of select="@sitemap:title"/>
                        </a>
                        <xsl:if test="not(position() = last())">&#160;&#160;|&#160;&#160;</xsl:if>
                    </xsl:for-each>
        </td>
        <td width="6">
          <img src="{$skincontext}/img/top_navigation_borderright.gif" width="6" height="32" />
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template name="middle">
    <table bgcolor="#ffffff" background="{$skincontext}/img/middle.jpg" border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr> <!-- bandeau -->
                <xsl:choose>
                    <xsl:when test="$style != ''">
                        <td background="{$stylecontext}/img/bandeau.jpg" height="80"></td>    
                    </xsl:when>
                    <xsl:otherwise>
                        <td background="{$templatecontext}/default/img/bandeau.jpg" height="80"></td>
                        
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
            <br/>
            <zone name="focus" level="2"/>
    </div>
  </xsl:template>
  
  <xsl:template name="content">
    <table width="100%">
      <tr>
        <td valign="top" rowspan="2">
        <xsl:variable name="rubrique" select="/cms/inputData/sitemap/page[@sitemap:in-path='true']" />
          <xsl:choose>
            <xsl:when test="$style = 'formation2010' ">
              <xsl:call-template name="new-menu"/>
            </xsl:when>
            <xsl:when test="@sitemap:title = 'Actualit�s' ">
              <xsl:call-template name="new-menu"/>
            </xsl:when>
            <xsl:when test="$style = 'recherche' ">
              <xsl:call-template name="new-menu"/>
            </xsl:when>
            <!-- <xsl:when test="$rubrique/@title = 'Vie �tudiante' ">
              <xsl:call-template name="new-menu"/>
            </xsl:when> -->
            <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="name(/cms/inputData/sitemap//page[@sitemap:current = 'true']/parent::*) = 'page'">
              <xsl:call-template name="navigation-menu"/> 
            </xsl:when>
            <xsl:when test="name(/cms/inputData/sitemap//page[@sitemap:current = 'true']/parent::*) = 'sitemap'">
              <xsl:call-template name="subnavigation"/> 
            </xsl:when>
          </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </td>
        <td colspan="2">
              <table border="0" cellspacing="0" cellpadding="0" height="28" width="100%" background="{$templatecontext}/default/img/page_title_bkg.gif" class="page_title_bkg">
                <tr>
                  <td width="33"><img src="{$templatecontext}/default/img/page_title_bullet.gif" width="33" height="32"/></td>
                  <td valign="top">
                    <xsl:variable name="title">
                      <xsl:choose>
                                        <xsl:when test="cms/page/pageContents/zone[@name='default']/zoneItem/information[type = 'SERVICE']">
                                            <xsl:value-of select="cms/page/@title"/>
                                        </xsl:when>
                        <xsl:when test="cms/page/pageContents/zone[@name='default']/zoneItem/html/head/title != ''">
                          <xsl:value-of select="cms/page/pageContents/zone[@name='default']/zoneItem/html/head/title"/>
                        </xsl:when>
                      </xsl:choose>
                    </xsl:variable>
                    <h1><xsl:value-of select="$title"/></h1>
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
                                    <zone name="default" level="0"/>
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

  <xsl:template name="footer">
    <p>...</p>
  </xsl:template>

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
          <br />
        </td>
      </tr>
      <tr>
        <td height="5"><img src="{$stylecontext}/img/page_navigation_bottom.gif" width="204" height="5" /></td>
      </tr>
    </table>
    </xsl:if>
  </xsl:template>

<!-- pour navigation dans rubrique formation2010 uniquement -->
  <xsl:template name="new-menu">
  <xsl:variable name="rubrique" select="/cms/inputData/sitemap/page[@sitemap:in-path='true']" />
    <div id="menu">
      <h2><xsl:value-of select="/cms/inputData/sitemap/page[@sitemap:in-path='true']/@sitemap:title"/></h2>
      <ul>
      <xsl:for-each select="$rubrique/page"> <!-- pages du premier niveau de la rubrique courante -->
        <li><a href="{$cms-context}/{$lang}/{@sitemap:path}.html" class="page_navigation_links"><xsl:value-of select="@sitemap:title"/></a></li>
        <xsl:if test="@sitemap:in-path='true'">
          <ul>
          <xsl:for-each select="./page"> <!-- sous pages -->
            <li>
              <a href="{$cms-context}/{$lang}/{@sitemap:path}.html" class="page_navigation_links">
              <xsl:if test="@sitemap:in-path='true'">
                <xsl:attribute name="class">page_navigation_links flag</xsl:attribute>
              </xsl:if>
                <xsl:value-of select="@sitemap:title"/>
              </a>
            </li>
          </xsl:for-each>
          </ul>
        </xsl:if>
      </xsl:for-each>
      </ul>
    </div>
  </xsl:template>

  <!-- pour remplacement de navigation-menu -->
  <xsl:template name="navigation-menu2">
    <div id="menu">
      <ul>
      <xsl:for-each select="/cms/inputData/sitemap//page[@sitemap:current = 'true']">
        <xsl:for-each select="./preceding-sibling::*"> <!-- noeuds pr�c�dents -->
          <li><a href="{$cms-context}/{$lang}/{@sitemap:path}.html"><xsl:value-of select="@sitemap:title"/></a></li>
        </xsl:for-each>
        <li><xsl:value-of select="@sitemap:title"/></li> <!-- noeud courant -->
        <ul>
          <xsl:for-each select="/cms/inputData/sitemap//page[@sitemap:current = 'true']/page"><!-- noeuds fils -->
            <li><a href="{$cms-context}/{$lang}/{@sitemap:path}.html"><xsl:value-of select="@sitemap:title"/></a></li>
          </xsl:for-each>
        </ul>
        <xsl:for-each select="./following-sibling::*"> <!-- noeuds suivants -->
          <li><a href="{$cms-context}/{$lang}/{@sitemap:path}.html"><xsl:value-of select="@sitemap:title"/></a></li>
        </xsl:for-each>
      </xsl:for-each>
      </ul>
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

  <xsl:template name="google"><!-- stats google analytics -->
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