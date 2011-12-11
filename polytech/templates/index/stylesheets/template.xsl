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
	<!--  **				header					**	-->
	<!--  ********************************************	-->
	<xsl:template name="header">
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
				<td width="210" height="108">
					<a href="{$cms-context}/{$lang}/index.html"><img src="{$skincontext}/img/logoweb_polytech.png" width="200" height="64" alt="logo" border="0"/></a>
				</td>
				<td valign="top" align="right"></td>
				<td width="210" height="108" align="right">
					<a href="http://www.u-psud.fr/"><img border="0" src="{$skincontext}/img/logoweb_psud.png" alt="logo Université Paris-Sud" /></a>
				</td>
			</tr>
		</table>
	</xsl:template>
 		
	<!-- ****************************************************************** -->

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


	<xsl:template name="content">
		<table width="100%">
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
									<zone name="zone-right-home" level="2"/>
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
									<zone name="zone-right-home" level="2"/>
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
								<zone name="zone-left-home" level="2"/>
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
							<xsl:call-template name="composantes"/>
                                 <div id="annexe_cd" style="margin-top: 20px;">
									<zone name="zone-right-home" level="2"/>
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
				<xsl:if test="/cms/inputData/PageModel/acces-directs/page">
 		               <!-- Bloc Accès direct -->
  	           	 	   <h2 class="R1">Accès direct</h2>
                		<ul>
                  		  <xsl:for-each select="/cms/inputData/sitemap//page[@PLUGIN_TAGS_ACCES_DIRECTS]">
    	                    <li>
                            	<a href="{$cms-context}/{$lang}/{@sitemap:path}.html" title="{$sitemap-goto-page} {@sitemap:title}"><xsl:value-of select="@sitemap:title" /></a>
                    	    </li>
                 	      </xsl:for-each>            
              			</ul> 		
      			</xsl:if>        
			
           <xsl:if test="/cms/inputData/PageModel/bloc-education/page">
                <!-- Bloc Formations -->
                <h2 class="R1">Les formations</h2>
                <ul>
                    <xsl:for-each select="/cms/inputData/sitemap//page[@PLUGIN_TAGS_BLOC_LEFT_EDUCATION]">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@sitemap:path}.html" title="{$sitemap-goto-page} {@sitemap:title}"><xsl:value-of select="@sitemap:title" /></a>
                        </li>
                    </xsl:for-each>            
                </ul>
            </xsl:if>
            <xsl:if test="/cms/inputData/PageModel/bloc-university/page">
                <!-- Bloc Spécialités -->
    			<h2 class="R1">Les spécialités</h2>
    			<ul>
                    <xsl:for-each select="/cms/inputData/sitemap//page[@PLUGIN_TAGS_BLOC_LEFT_UNIVERSITY]">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@sitemap:path}.html" title="{$sitemap-goto-page} {@sitemap:title}"><xsl:value-of select="@sitemap:title" /></a>
                        </li>
                    </xsl:for-each>            
    			</ul>
            </xsl:if>
		</div>	
	</xsl:template>
	
	<xsl:template name="menu_en">
		<div id="menu">
            <xsl:if test="/cms/inputData/PageModel/bloc-university/page">
                <!-- Bloc composante -->
                <h2 class="R1">The Faculty</h2>
                <ul>
                    <xsl:for-each select="/cms/inputData/sitemap//page[@PLUGIN_TAGS_BLOC_LEFT_UNIVERSITY]">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@sitemap:path}.html" title="{$sitemap-goto-page} {@sitemap:title}"><xsl:value-of select="@sitemap:title" /></a>
                        </li>
                    </xsl:for-each>            
                </ul>
            </xsl:if>			
            <xsl:if test="/cms/inputData/PageModel/bloc-research/page">
                <!-- Bloc Research -->
                <h2 class="R1">Research</h2>
                <ul>
                    <xsl:for-each select="/cms/inputData/sitemap//page[@PLUGIN_TAGS_BLOC_LEFT_RESEARCH]">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@sitemap:path}.html" title="{$sitemap-goto-page} {@sitemap:title}"><xsl:value-of select="@sitemap:title" /></a>
                        </li>
                    </xsl:for-each>            
                </ul>
            </xsl:if>             
            <xsl:if test="/cms/inputData/PageModel/bloc-education/page">
                <!-- Bloc Education -->
                <h2 class="R1">Education</h2>
                <ul>
                    <xsl:for-each select="/cms/inputData/sitemap//page[@PLUGIN_TAGS_BLOC_LEFT_EDUCATION]">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@sitemap:path}.html" title="{$sitemap-goto-page} {@sitemap:title}"><xsl:value-of select="@sitemap:title" /></a>
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
		
	<xsl:template name="profils">
        <xsl:if test="/cms/inputData/PageModel/profil/page">		
            <div id="profils">
                <!-- Bloc Profil -->
                <xsl:if test="$lang='fr'"><h2>Vous êtes...</h2></xsl:if>
                <ul>
                    <xsl:for-each select="/cms/inputData/sitemap//page[@PLUGIN_TAGS_PROFIL]">
                        <li>
                            <a href="{$cms-context}/{$lang}/{@sitemap:path}.html" title="{$sitemap-goto-page} {@sitemap:title}"><xsl:value-of select="@sitemap:title" /></a>
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