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

	<xsl:import href="workspace:web://stylesheets/helper/html-hierarchy.xsl"/>
	
	<xsl:param name="contextPath"/>
	<xsl:param name="skin"/>
	<xsl:param name="siteName"/>
	<xsl:param name="lang"/>
	<xsl:param name="mail"/>

	<xsl:variable name="skincontext" select="concat($contextPath, '/skins/', $skin, '/resources')"/>
	
	<xsl:template name="newsletter-body">
		<div id="email-box">
			<xsl:if test="$mail = 'true'">
				<xsl:call-template name="redirect" />
			</xsl:if>
				
			<div id="box">
				<xsl:call-template name="header" />
				
				<xsl:call-template name="toc" />
				
				<xsl:call-template name="content" />
				
				<xsl:if test="$mail = 'true'">
					<xsl:call-template name="footer" />
				</xsl:if>
			</div>
		</div>
		
		<xsl:if test="$mail != 'true'">
			<xsl:call-template name="google-analytics" /> 
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="redirect">
		<div id="redirect">
			<i18n:text i18n:key="NEWSLETTER_REDIRECT_1" i18n:catalogue="skin.{$skin}"/>
			<a href="{$contextPath}/_wrapped-content/{/html/head/meta[@name = 'contentName']/@content}.html"><i18n:text i18n:key="NEWSLETTER_REDIRECT_2" i18n:catalogue="skin.{$skin}"/></a>
		</div>
	</xsl:template>

	<xsl:template name="footer">
		<div id="footer">
			<p><i18n:text i18n:key="NEWSLETTER_FOOTER_MENTIONS_1" i18n:catalogue="skin.{$skin}"/></p>
			<p><i18n:text i18n:key="NEWSLETTER_FOOTER_MENTIONS_2" i18n:catalogue="skin.{$skin}"/></p>
			<p>
				<i18n:text i18n:key="NEWSLETTER_FOOTER_MENTIONS_3" i18n:catalogue="skin.{$skin}"/>
				<a href="{$contextPath}/{$lang}/_plugins/newsletter/page/unsubscribe?token=#token#"><i18n:text i18n:key="NEWSLETTER_FOOTER_MENTIONS_4" i18n:catalogue="skin.{$skin}"/></a>
				<i18n:text i18n:key="NEWSLETTER_FOOTER_MENTIONS_5" i18n:catalogue="skin.{$skin}"/>
			</p>
			
			<p class="copy"><i18n:text i18n:key="NEWSLETTER_COPYRIGHT" i18n:catalogue="skin.{$skin}"/></p>
		</div>
	</xsl:template>

	<xsl:template name="header">
		<div id="header">
			<h1><i18n:text i18n:key="NEWSLETTER_TITLE" i18n:catalogue="skin.{$skin}"/></h1>
			
			<p class="date">
				<xsl:if test="/html/head/meta[@name = 'date']/@content != ''">
					<i18n:date src-pattern="yyyy-MM-dd'T'hh:mm:ss" pattern="long"><xsl:value-of select="/html/head/meta[@name = 'date']/@content"/></i18n:date>
				</xsl:if>
				<xsl:if test="/html/head/meta[@name = 'date']/@content != '' and /html/head/meta[@name = 'number']/@content != '' and /html/head/meta[@name = 'number']/@content != '0'"><xsl:text>, </xsl:text></xsl:if>
				<xsl:if test="/html/head/meta[@name = 'number']/@content != '' and /html/head/meta[@name = 'number']/@content != '0'">
					<xsl:text>N°</xsl:text><xsl:value-of select="/html/head/meta[@name = 'number']/@content"/>
				</xsl:if>
			</p>
		</div>
	</xsl:template>
	
	<xsl:template name="toc">
		<xsl:if test="/html/body//div[@id = 'newsletter-content']/div[@class = 'center']/div[@class = 'articles']//h1">
			<div id="toc">
				<h2><i18n:text i18n:key="NEWSLETTER_TOP_OF_CONTENT" i18n:catalogue="skin.{$skin}"/></h2>
				
				<xsl:call-template name="toc-list"/>
			</div>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="toc-list">
		<ul>
			<xsl:for-each select="/html/body//div[@id = 'newsletter-content']/div[@class = 'center']/div[@class = 'articles']//h1"> 
				<li>
					<a class="anchor" href="#go-to-{count(preceding::h1)}"><xsl:value-of select="text()"/></a>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	
	<xsl:template name="content">
		<xsl:apply-templates select="/html/body/node()"/>
	</xsl:template>	
	
	<xsl:template match="div[@class = 'articles']"> 
		<xsl:copy>
    		<xsl:copy-of select="@*"/>
    		
			<xsl:apply-templates select="node()" mode="move-hierarchy">
				<xsl:with-param name="level" select="2"/>
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="*">
    	<xsl:copy>
    		<xsl:copy-of select="@*"/>
    		<xsl:apply-templates/>
    	</xsl:copy>
    </xsl:template>
    
    <xsl:template name="google-analytics">
    </xsl:template>
    
    <xsl:template name="common-css">
		<style type="text/css" media="screen, print">
			body {
				font-size:75%;
			}
			
			a {
				color: #006BB1;	
			}
			
			#email-box {
				color:#000000;
				font-family:Arial,Helvetica,sans-serif;
				margin:0 0 0 auto;
				padding:0;
				width:100%;
			}
			
			#box {
				border:1px solid #999999;
				margin-right:auto;
				text-align:left;
				width:700px;
			}
			
			#redirect {
				margin-right:auto;
				width:700px;
				text-align:center;
				color:#595959;
				font-size:0.9em;
				padding-bottom: 3px;
			}
			
			#header {
				background:#FFFFFF url('<xsl:value-of select="$skincontext"/>/img/banner_<xsl:value-of select="$lang"/>.png') no-repeat scroll 0 0;
				height:75px;
				text-align: right;
				valign: bottom;
			}
			
			#header h1, #header h3 {
				font-size:1.4em;
				color: #006BB1;	
				margin: 0 10px 0 0;
				padding-top: 25px;
				letter-spacing: 1px;
			}
			
			#header p.date {
				margin: 0 10px 0 0;
				font-size:1.1em;
			}
			
			#toc {
				color: #f2f2f2 !important;
				background: #595959 url('<xsl:value-of select="$skincontext"/>/img/promo-bg.jpg') repeat-x left top;
				border-bottom: 5px solid #404040;
				height: 100px;
				padding: 10px 20px;;
			}
			
			#toc h2, #toc h4 {
				text-transform: uppercase;
				margin: 0;
				letter-spacing: 1px;
				color: #f2f2f2 !important;
			}
			
			#toc ul li a.anchor {
				color: #f2f2f2 !important;
				text-decoration: none;
				font-weight: bold;
				text-transform: uppercase;
			}
			#toc ul li a.anchor:hover {
				text-decoration: underline;
			}
			
			#newsletter-content {
				
			}
			
			#newsletter-content .center {
				float:left;
				width:490px;
			}
			
			#newsletter-content .edito {
				font-size:0.9em;
				font-weight:bold;
				letter-spacing:1px;
				background-color: #F4F4F4;
				padding: 10px;
			}
			
			#newsletter-content .edito h1, #newsletter-content .edito h3 {
				font-size:1.8em;
				text-transform: uppercase;
				letter-spacing: 1px;
				margin: 0px;
				color: #000;
			}
			
			#newsletter-content .articles {
				padding: 10px;
			}
			
			#newsletter-content .articles .article {
				clear: left;
			}
			
			#newsletter-content .articles .article h2, #newsletter-content .articles .article h4 {
				padding-left: 0px;
				color: #006BB1;
				font-size: 1.1em;
			}
			
			#newsletter-content .articles .article .content-illustration {
				float:left;
				margin-right: 10px;
				border: 1px solid #E6E6E6;
				background-color: #FFFFFF;
				padding: 4px;
			}
			
			#newsletter-content .sidebar {
				clear:right;
				float:right;
				width:190px;
				padding: 10px;
				background : transparent url('<xsl:value-of select="$skincontext"/>/img/rightside-bg-small.png') repeat-y scroll -240px 0
			}
			
			#newsletter-content .sidebar .encart {
				padding: 10px 0 15px 0;
				border-bottom: 1px solid #999999;
			}
			
			#newsletter-content .sidebar .encart.last {
				border: 0px none;
			}
				
			#newsletter-content .sidebar .encart h2, #newsletter-content .sidebar .encart h4 {
				color: #006BB1;	
				text-transform: uppercase;
				margin: 0px;
				letter-spacing: 1px;
				font-size: 1.1em;
			}
			
			
			#footer {
				color:#595959;
				clear:both;
				overflow:hidden;
				padding:10px;
				font-size:0.9em;
				border-top: 1px solid #999999;
			}
			
			#footer p {
				padding-bottom:3px;
			}
			
			#footer p.copy {
				color:#999999;
				text-align: right;
				padding-top: 5px;
			}
			
			#footer p {
				margin: 0px;
			}
		</style>
	</xsl:template>
	
	<xsl:template match="processing-instruction()">
		<xsl:copy-of select="."/>
	</xsl:template>
</xsl:stylesheet>