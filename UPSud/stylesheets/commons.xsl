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