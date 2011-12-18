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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i18n="http://apache.org/cocoon/i18n/2.1">

	<xsl:import href="skin://newsletter/commons.xsl" />
	
	<xsl:param name="contextPath"/>
	<xsl:param name="skin"/>

	<xsl:variable name="skincontext" select="concat($contextPath, '/skins/', $skin, '/resources')"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<xsl:copy-of select="/html/head/node()"/>
				<link type="text/css" href="{$skincontext}/css/newsletter/generique.css" rel="stylesheet" media="screen" />
				<link type="text/css" href="{$skincontext}/css/newsletter/orange.css" rel="stylesheet" media="screen" />
				
				<!-- Content styles  -->
				<link type="text/css" href="{$skincontext}/css/content.css" rel="stylesheet" media="screen" />
		
				<xsl:call-template name="common-css"/>
				
				<style type="text/css" media="screen, print">
					a {
						color: #ffaf40;	
					}
					
					#header h1 {
						color: #ffaf40;	
					}
					
					#toc {
						background: #542d12 url('<xsl:value-of select="$skincontext"/>/img/orange/master-bg.jpg') repeat-x top left;
					}
					
					#newsletter-content .sidebar .encart h2 {
						color: #ffaf40;	
					}
				</style>
			</head>
			
			<body>
				<xsl:call-template name="newsletter-body"/>
			</body>
		</html>
	</xsl:template>
    
</xsl:stylesheet>