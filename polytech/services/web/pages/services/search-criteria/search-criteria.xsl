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
				xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
				xmlns:xalan="http://xml.apache.org/xalan"
				xmlns:math="java.lang.Math"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:resolver="org.ametys.cms.transformation.xslt.ResolveURIComponent"
                extension-element-prefixes="math">
	
    <xsl:import href="plugin:web://pages/services/search-criteria/search-criteria.xsl"/>
    
	<xsl:param name="search-page"/>
	<xsl:param name="contextPath"/>
	<xsl:param name="cms-context"/>
    <xsl:param name="skin"/>
	<xsl:param name="header"/>

	<xsl:variable name="uniqueId" select="substring-after(math:random(), '.')"/>
	
	<xsl:template match="/search">
		<html>
		
			<head>
				<link href="{$contextPath}/plugins/web/resources/css/service/search.css" type="text/css" rel="stylesheet" />
				
				<xsl:call-template name="extra-css"/>
				
				<xsl:call-template name="script-autocompletion"/>
				
				<xsl:call-template name="extra-scripts"/>
			</head>
		
			<body id="default">
				
				<div id="service-search-wrapper">
					
					<xsl:choose>
						<xsl:when test="$header != ''"><h3><xsl:value-of select="$header"/></h3></xsl:when>
						<xsl:otherwise><h3><i18n:text i18n:key="FRONT_MODULE_SEARCH_TITLE"/></h3></xsl:otherwise>
					</xsl:choose>
					
					<xsl:call-template name="form"/>
				</div>
				
			</body>
		</html>
	</xsl:template>
			
</xsl:stylesheet>