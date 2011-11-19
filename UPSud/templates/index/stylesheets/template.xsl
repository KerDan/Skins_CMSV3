<?xml version="1.0" encoding="UTF-8"?>
<!--
   Copyright 2010 Anyware Services

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
   -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
		xmlns:sitemap="http://www.ametys.org/inputdata/sitemap/3.0"
		xmlns:xalan="http://xml.apache.org/xalan"
		xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date"
		exclude-result-prefixes="sitemap">

	<xsl:import href="skin://stylesheets/commons.xsl" />
	<!-- template général pour la page d'accueil de l'université -->
	<xsl:template name="template">
		<html>
			<head>
				<title>Université Paris-Sud</title>
				<link href="{$skincontext}/css/u-psud.css" rel="stylesheet" type="text/css"/>
				<link href="{$skincontext}/css/accueil.css" rel="stylesheet" type="text/css"/>
                <link href="{$skincontext}/css/custom-services-contents.css" rel="stylesheet" type="text/css"/>
				<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
				<meta name="description" content="Bienvenue sur le site de l'Université Paris-Sud, première université en terme de distinctions, plus grand campus de France!"/>
				<meta name="keywords" content="études, formation, recherche, innovation, valorisation, science, médecine, pharmacie, droit, économie, gestion, staps" />
				<script type="text/javascript" src="{$skincontext}/js/swfobject.js"></script>
				<meta name="verify-v1" content="ciep7LAyVd2fzF72A795OAAHQ/eia1YdIwTzy3+pTS4=" /> <!-- balise meta pour vérification du site par google webtools -->
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
				<xsl:call-template name="google"/>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="header">
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
				<td rowspan="3" height="120" width="136">
					<a href="{$cms-context}/{$lang}/index.html"><img src="{$skincontext}/img/logoweb_psud.png" width="136" height="120" alt="logo" border="0"/></a>
				</td>
				<td valign="top" align="right">
					<table height="37" border="0" cellpadding="0" cellspacing="0"> <!-- Sur la page d'accueil, la toolbar est affichée dans le contenu de la page -->
						<tr>
							<td> </td>
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

	<xsl:template name="middle">
		<table bgcolor="#ffffff" border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr> <!-- bandeau -->
				<td background="{$skincontext}/img/bandeau_accueil.jpg" height="80">
					&#160;
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

	<xsl:template name="search">
		<table border="0" cellspacing="0" cellpadding="0" align="center" height="16">
            <form method="post" action="{$cms-context}/{$lang}/{/cms/inputData/sitemap//page[@PLUGIN_TAGS_RESEARCH]/@sitemap:path}.html#nav" id="research">
                <input type="hidden" name="submit-form"/>
                <tr>
                    <td valign="middle">
                        <input type="text" name="textfield" id="textfield" class="text_field"/>
                    </td>
                    <td width="16" valign="top">
                        <input type="image" src="{$skincontext}/img/zoom.png" value="submit" border="0" style="margin-top: 5px; margin-left: 10px"/>
                    </td>
                </tr>
            </form>            
		</table>
	</xsl:template>

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

	<xsl:template name="content">
		<table width="100%">
			<tr>
				<td id="cms-toolbar"></td>
			</tr>
			<tr>
				<td valign="top"> 
                <span class="content">
				<xsl:choose>
    				<xsl:when test="$lang='es'">
    				<table width="100%">
    					<tr>
    						<td bgcolor="white" valign="top">
    							<img src="{$skincontext}/img/espagnol.jpg" />
    						</td>
    						<td width="300" valign="top">
    							<xsl:call-template name="toolbar_es"/>
    							<xsl:call-template name="menu_es"/>
    							<xsl:call-template name="composantes"/>
                                 <div id="annexe_cd" style="margin-top: 20px">
									<zone name="zone-right-home" level="0"/>
                                </div>                                
   						</td>
    		   			</tr>
    				</table>
    				</xsl:when>
    				<xsl:when test="$lang='en'">
    				<table width="100%">
    					<tr>
    						<td bgcolor="white" valign="top">
	                           <div class="home_article">
                                    <zone name="default" level="2"/>
                               </div>                                
    						</td>
    						<td width="300" valign="top">
    							<xsl:call-template name="toolbar_en"/>
    							<xsl:call-template name="menu_en"/>
    							<xsl:call-template name="composantes"/>
                                 <div id="annexe_cd" style="margin-top: 20px;">
									<zone name="zone-right-home" level="0"/>
                                </div>                                
    						</td>
    		   			</tr>
    				</table>
    				</xsl:when>
				<xsl:otherwise>
				<table width="100%">
					<tr>
          				<td width="200" valign="top">
							<xsl:call-template name="menu_fr"/>
							<div id="annexe_cg" style="margin-top: 20px;">
								<zone name="zone-left-home" level="0"/>
                            </div>                                
   						</td>
						<td bgcolor="white" valign="top">
							<div id="actus">
                                <zone name="default" level="2"/>
                            </div>
						</td>
						<td width="200" valign="top">
							<xsl:call-template name="toolbar_fr"/>
							<xsl:call-template name="profils"/>
							<xsl:call-template name="direct"/>
							<xsl:call-template name="composantes"/>
                                 <div id="annexe_cd" style="margin-top: 20px;">
									<zone name="zone-right-home" level="0"/>
                                </div>                                
						</td>
		   			</tr>
				</table>
				</xsl:otherwise>
				</xsl:choose>
				</span>

				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="menu_fr">
		<div id="menu">
            <xsl:if test="/cms/inputData/PageModel/bloc-university/page">
                <!-- Bloc Université -->
    			<h2 class="R1">L'Université</h2>
    			<ul>
                    <xsl:for-each select="/cms/inputData/PageModel/bloc-university/page">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@path}.html" title="{$sitemap-goto-page} {@title}"><xsl:value-of select="@title" /></a>
                        </li>
                    </xsl:for-each>            
    			</ul>
            </xsl:if>
            <xsl:if test="/cms/inputData/PageModel/bloc-education/page">
                <!-- Bloc Formations -->
                <h2 class="R1">Formations</h2>
                <ul>
                    <xsl:for-each select="/cms/inputData/PageModel/bloc-education/page">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@path}.html" title="{$sitemap-goto-page} {@title}"><xsl:value-of select="@title" /></a>
                        </li>
                    </xsl:for-each>            
                </ul>
            </xsl:if>
            <xsl:if test="/cms/inputData/PageModel/bloc-research/page">
                <!-- Bloc Recherche -->
                <h2 class="R1">Recherche</h2>
                <ul>
                    <xsl:for-each select="/cms/inputData/PageModel/bloc-research/page">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@path}.html" title="{$sitemap-goto-page} {@title}"><xsl:value-of select="@title" /></a>
                        </li>
                    </xsl:for-each>            
                </ul>
            </xsl:if>                        
		</div>	
	</xsl:template>
	
	<xsl:template name="menu_en">
		<div id="menu">
            <xsl:if test="/cms/inputData/PageModel/bloc-university/page">
                <!-- Bloc Université -->
                <h2 class="R1">The University</h2>
                <ul>
                    <xsl:for-each select="/cms/inputData/PageModel/bloc-university/page">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@path}.html" title="{$sitemap-goto-page} {@title}"><xsl:value-of select="@title" /></a>
                        </li>
                    </xsl:for-each>            
                </ul>
            </xsl:if>			
            <xsl:if test="/cms/inputData/PageModel/bloc-research/page">
                <!-- Bloc Research -->
                <h2 class="R1">Research</h2>
                <ul>
                    <xsl:for-each select="/cms/inputData/PageModel/bloc-research/page">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@path}.html" title="{$sitemap-goto-page} {@title}"><xsl:value-of select="@title" /></a>
                        </li>
                    </xsl:for-each>            
                </ul>
            </xsl:if>             
            <xsl:if test="/cms/inputData/PageModel/bloc-education/page">
                <!-- Bloc Education -->
                <h2 class="R1">Education</h2>
                <ul>
                    <xsl:for-each select="/cms/inputData/PageModel/bloc-education/page">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@path}.html" title="{$sitemap-goto-page} {@title}"><xsl:value-of select="@title" /></a>
                        </li>
                    </xsl:for-each>            
                </ul>
            </xsl:if>
            <!-- Lien Student Life -->
            <xsl:if test="/cms/inputData/sitemap//page[@PLUGIN_TAGS_STUDENT_LIFE]">
                <h2 class="R1">
                    <a href="{$cms-context}/{$lang}/{/cms/inputData/sitemap//page[@PLUGIN_TAGS_STUDENT_LIFE]/@sitemap:path}.html">
                        <xsl:value-of select="/cms/inputData/sitemap//page[@PLUGIN_TAGS_STUDENT_LIFE]/@sitemap:title"/>
                    </a>
                </h2>
            </xsl:if>
            <!-- Lien Student Life -->
            <xsl:if test="/cms/inputData/sitemap//page[@PLUGIN_TAGS_INTERNATIONAL]">
                <h2 class="R1">
                    <a href="{$cms-context}/{$lang}/{/cms/inputData/sitemap//page[@PLUGIN_TAGS_INTERNATIONAL]/@sitemap:path}.html">
                        <xsl:value-of select="/cms/inputData/sitemap//page[@PLUGIN_TAGS_INTERNATIONAL]/@sitemap:title"/>
                    </a>
                </h2>
            </xsl:if>
		</div>
	</xsl:template>
    
	<xsl:template name="menu_es">
		<div id="menu">
			<h2 class="R1"><a href="{$cms-context}/fr/l_universite.html">La universidad</a></h2>
			<h2 class="R1"><a href="{$cms-context}/fr/la_recherche.html">Investigación</a></h2>
			<h2 class="R1"><a href="{$cms-context}/fr/les_formations.html">Formación</a></h2>
		</div>
	</xsl:template>

	<xsl:template name="toolbar_fr">
		<div id="toolbar">
			<ul>
                <!-- Lien plan d'accès -->
                <xsl:if test="/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_MAP]">
                    <li id="plan">
                        <a href="{$cms-context}/{$lang}/{/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_MAP]/@sitemap:path}.html">
                            <span>
                                <xsl:value-of select="/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_MAP]/@sitemap:title"/>
                            </span>
                        </a>
                    </li>
                </xsl:if>            
                <!-- Lien Contact -->
                <xsl:if test="/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_CONTACT]">
                    <li id="contacts">
                        <a href="{$cms-context}/{$lang}/{/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_CONTACT]/@sitemap:path}.html">
                            <span>
                                <xsl:value-of select="/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_CONTACT]/@sitemap:title"/>
                            </span>
                        </a>
                    </li>
                </xsl:if>
                <!-- Lien Annuaire -->
				<li id="annuaire"><a href="http://www.annuaire.u-psud.fr/" onClick="javascript: pageTracker._trackPageview ('/adonis');">Annuaire</a></li>
				<!-- Lien plan du site -->
                <xsl:if test="/cms/inputData/sitemap//page[@PLUGIN_TAGS_SITEMAP]">
                    <li id="sitemap">
                        <a href="{$cms-context}/{$lang}/{/cms/inputData/sitemap//page[@PLUGIN_TAGS_SITEMAP]/@sitemap:path}.html">
                            <span>
                                <xsl:value-of select="/cms/inputData/sitemap//page[@PLUGIN_TAGS_SITEMAP]/@sitemap:title"/>
                            </span>
                        </a>
                    </li>
                </xsl:if>                
				<li id="intranet"><a href="http://portail.u-psud.fr/" onClick="javascript: pageTracker._trackPageview ('/ent');">ENT / Intranet</a></li>
			</ul>
		<xsl:call-template name="search"/>
		</div>
	</xsl:template>
	<xsl:template name="toolbar_en">
		<div id="toolbar">
			<ul>
				<li id="annuaire"><a href="http://www.annuaire.u-psud.fr/" onClick="javascript: pageTracker._trackPageview ('/adonis');">Directory</a></li>
                <!-- Lien Contact -->
                <xsl:if test="/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_CONTACT]">
                    <li id="contacts">
                        <a href="{$cms-context}/{$lang}/{/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_CONTACT]/@sitemap:path}.html">
                            <span>
                                <xsl:value-of select="/cms/inputData/sitemap//page[@PLUGIN_TAGS_TOP_LINKS_CONTACT]/@sitemap:title"/>
                            </span>
                        </a>
                    </li>
                </xsl:if>				
			</ul>
		<xsl:call-template name="search"/>
		</div>
	</xsl:template>
	<xsl:template name="toolbar_es">
		<div id="toolbar">
			<ul>
				<li id="annuaire"><a href="http://www.annuaire.u-psud.fr/" onClick="javascript: pageTracker._trackPageview ('/adonis');">Guía telefónica</a></li>
				<li id="contacts"><a href="{$cms-context}/{$lang}/contact.html">Contactos</a></li>
			</ul>
		<xsl:call-template name="search"/>
		</div>
	</xsl:template>
	
	<xsl:template name="direct"> <!-- utilisation de l'ancienne boite "disciplines" pour la liste "accès direct" -->
		<xsl:if test="/cms/inputData/PageModel/acces-directs/page">
            <div id="direct">
                <!-- Bloc Accès direct -->
                <xsl:if test="$lang='fr'"><h2>Accès direct</h2></xsl:if>
                <ul>
                    <xsl:for-each select="/cms/inputData/PageModel/acces-directs/page">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@path}.html" title="{$sitemap-goto-page} {@title}"><xsl:value-of select="@title" /></a>
                        </li>
                    </xsl:for-each>            
                </ul> 		
		  </div>
        </xsl:if>        
	</xsl:template>
	
	<xsl:template name="profils">
        <xsl:if test="/cms/inputData/PageModel/profil/page">		
            <div id="profils">
                <!-- Bloc Profil -->
                <xsl:if test="$lang='fr'"><h2>Vous êtes...</h2></xsl:if>
                <ul>
                    <xsl:for-each select="/cms/inputData/PageModel/profil/page">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@path}.html" title="{$sitemap-goto-page} {@title}"><xsl:value-of select="@title" /></a>
                        </li>
                    </xsl:for-each>            
                </ul>
		  </div>
        </xsl:if>        
	</xsl:template>

	<xsl:template name="composantes">
        <xsl:if test="/cms/inputData/PageModel/composantes/page">     		
            <div id="composantes">
    			<!-- Bloc composantes -->
                <xsl:if test="$lang='fr'"><h2>Composantes</h2></xsl:if>
    			<xsl:if test="$lang='en'"><h2 class="left">Faculties and Schools</h2></xsl:if>
    			<xsl:if test="$lang='es'"><h2 class="left">Componentes universidad</h2></xsl:if>
                <ul>
                <xsl:if test="$lang='en' or $lang='es'">
                    <xsl:attribute name="class">left</xsl:attribute>
                </xsl:if>
                    <xsl:for-each select="/cms/inputData/PageModel/composantes/page">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@path}.html" title="{$sitemap-goto-page} {@title}"><xsl:value-of select="@title" /></a>
                        </li>
                    </xsl:for-each>                 
                </ul>
    		</div>
        </xsl:if>
	</xsl:template>

</xsl:stylesheet>