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
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="cms-context"/>
    <xsl:param name="skin"/>
	<xsl:param name="lang"/>
	<xsl:param name="header"/>
	
	<xsl:template match="/sitemap">
		<html>
			<body>
				<div class="sitemap">
					<xsl:if test="$header != ''"><h1><xsl:value-of select="$header"/></h1></xsl:if>
	
					<xsl:if test="page">
						<ul>
							<xsl:apply-templates select="page" mode="first"/>
						</ul>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="page" mode="first">
		<li class="first">
			<a href="{$cms-context}/{$lang}/{@path}.html" title="{@title}" class="lien_plan_du_site_first">- <xsl:value-of select="@title" /></a>
			<xsl:if test="page">
				<ul>
					<xsl:apply-templates select="page"/>
				</ul>
			</xsl:if>
            <br/>
            <br/>            
		</li>
	</xsl:template>
	
	<xsl:template match="page">
		<li>
			<a href="{$cms-context}/{$lang}/{@path}.html" title="{@title}" class="lien_plan_du_site">- <xsl:value-of select="@title"/></a>
			<xsl:if test="page">
				<ul>
					<xsl:apply-templates select="page"/>
				</ul>
			</xsl:if>
		</li>
	</xsl:template>

</xsl:stylesheet>
