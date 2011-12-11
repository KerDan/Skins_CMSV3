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

	<xsl:param name="contextPath"/>
	<xsl:param name="skin"/>
	<xsl:param name="siteName"/>
	<xsl:param name="lang"/>
	<xsl:param name="mail"/>

	<xsl:variable name="skincontext" select="concat($contextPath, '/skins/', $skin, '/resources')"/>
	
	<xsl:template name="newsletter-body">
		<i18n:text i18n:key="NEWSLETTER_SEE_ONLINE" i18n:catalogue="skin.{$skin}"/>
		<xsl:text>
</xsl:text><xsl:value-of select="$contextPath"/>/_content/<xsl:value-of select="/html/head/meta[@name = 'contentName']/@content"/>.html<xsl:text>
</xsl:text>
		<xsl:text>---------------------------------------------------------------------------------------------------------</xsl:text><xsl:text>
</xsl:text>
		<xsl:call-template name="header" />
				
		<xsl:call-template name="toc" />
		
		<xsl:call-template name="content" />
		
		<xsl:call-template name="footer" />
		
	</xsl:template>

	<!-- +
		 | FOOTER
		 + -->
	<xsl:template name="footer">
		<xsl:text>
</xsl:text>
		<xsl:text>---------------------------------------------------------------------------------------------------------</xsl:text><xsl:text>
</xsl:text>
		<i18n:text i18n:key="NEWSLETTER_FOOTER_MENTIONS_1" i18n:catalogue="skin.{$skin}"/><xsl:text>
</xsl:text>
		<i18n:text i18n:key="NEWSLETTER_FOOTER_MENTIONS_2" i18n:catalogue="skin.{$skin}"/><xsl:text>
</xsl:text>
		<i18n:text i18n:key="NEWSLETTER_FOOTER_MENTIONS_3" i18n:catalogue="skin.{$skin}"/> <i18n:text i18n:key="NEWSLETTER_FOOTER_MENTIONS_4" i18n:catalogue="skin.{$skin}"/>
		<i18n:text i18n:key="NEWSLETTER_FOOTER_MENTIONS_5" i18n:catalogue="skin.{$skin}"/><xsl:text>
</xsl:text>
		<i18n:text i18n:key="NEWSLETTER_FOOTER_MENTIONS_6" i18n:catalogue="skin.{$skin}"/><xsl:text>
</xsl:text>
		<xsl:value-of select="$contextPath"/>/<xsl:value-of select="$lang"/>/_plugins/newsletter/page/unsubscribe?token=#token#<xsl:text>
</xsl:text>
		<i18n:text i18n:key="NEWSLETTER_COPYRIGHT" i18n:catalogue="skin.{$skin}"/>
	</xsl:template>

	<!-- +
		 | HEADER
		 + -->
	<xsl:template name="header">
		<i18n:text i18n:key="NEWSLETTER_TITLE" i18n:catalogue="skin.{$skin}"/>
		<xsl:text>
</xsl:text>
		<xsl:if test="/html/head/meta[@name = 'date']/@content != ''">
			<i18n:date src-pattern="yyyy-MM-dd'T'hh:mm:ss" pattern="long"><xsl:value-of select="/html/head/meta[@name = 'date']/@content"/></i18n:date>
		</xsl:if>
		<xsl:if test="/html/head/meta[@name = 'date']/@content != '' and /html/head/meta[@name = 'number']/@content != '' and /html/head/meta[@name = 'number']/@content != '0'"><xsl:text>, </xsl:text></xsl:if>
		<xsl:if test="/html/head/meta[@name = 'number']/@content != '' and /html/head/meta[@name = 'number']/@content != '0'">
			<xsl:text>N°</xsl:text><xsl:value-of select="/html/head/meta[@name = 'number']/@content"/>
		</xsl:if>
		<xsl:text>
</xsl:text>
		<xsl:text>---------------------------------------------------------------------------------------------------------</xsl:text><xsl:text>
</xsl:text>
	</xsl:template>
	
	<!-- +
		 | TOP OF CONTENT
		 + -->
	<xsl:template name="toc">
		<xsl:if test="/html/body/div[@id = 'newsletter-content']/div[@class = 'center']/div[@class = 'articles']//h3">
		<i18n:text i18n:key="NEWSLETTER_TOP_OF_CONTENT" i18n:catalogue="skin.{$skin}"/>
		<xsl:text>
</xsl:text>
		<xsl:call-template name="toc-list"/>
		<xsl:text>---------------------------------------------------------------------------------------------------------</xsl:text><xsl:text>
</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="toc-list">
		<xsl:for-each select="/html/body/div[@id = 'newsletter-content']/div[@class = 'center']/div[@class = 'articles']//h3"> 
		<xsl:text>- </xsl:text><xsl:value-of select="text()"/>
		<xsl:text>
</xsl:text>
		</xsl:for-each>
	</xsl:template>
	
	<!-- +
		 | CONTENT
		 + -->
	<xsl:template name="content">
		<xsl:apply-templates select="/html/body/node()"/>
	</xsl:template>	
	
	<xsl:template name="div">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="h3"><xsl:text>
</xsl:text>. <xsl:value-of select="normalize-space(text())"/><xsl:text>
</xsl:text>
	</xsl:template>
	
	<xsl:template match="h2"><xsl:text>
</xsl:text><xsl:value-of select="translate(text(), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/><xsl:text>
</xsl:text>
	</xsl:template>
	
	<xsl:template match="p"><xsl:apply-templates/><xsl:text>
</xsl:text>
	</xsl:template>
	
	<xsl:template match="br"><xsl:text>
</xsl:text>
	</xsl:template>
	
	<xsl:template match="img">[<xsl:value-of select="@alt"/>]
	</xsl:template>
	
	<xsl:template match="a"><xsl:value-of select="text()"/><xsl:text> </xsl:text><xsl:value-of select="@href"/>
	</xsl:template>
	
	<xsl:template match="text()"><xsl:value-of select="normalize-space(.)"/></xsl:template>
	
</xsl:stylesheet>