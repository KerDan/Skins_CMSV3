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
							  xmlns:docbook="http://docbook.org/ns/docbook" 
                              xmlns:i18n="http://apache.org/cocoon/i18n/2.1" 
                              xmlns:resolver="org.ametys.cms.transformation.xslt.ResolveURIComponent" 
                              exclude-result-prefixes="docbook resolver">

	<xsl:import href="plugin:news://stylesheets/content/news/news-link.xsl"/>
    
	<xsl:template name="view">
		<p>
            <xsl:text>- </xsl:text>
            <xsl:if test="metadata/start-date or metadata/end-date">
                <xsl:call-template name="dates">
                    <xsl:with-param name="startDate" select="metadata/start-date"/>
                    <xsl:with-param name="endDate" select="metadata/end-date"/>
                </xsl:call-template>
            </xsl:if> 
            <xsl:text> : </xsl:text>        
			<xsl:choose>
				<xsl:when test="//pages/page">
					- <a href="{$prefix}/{//pages/page/@lang}/{//pages/page/@path}.html"><xsl:value-of select="metadata/title"/></a>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="metadata/title"/>
				</xsl:otherwise>
			</xsl:choose>           
		</p>
	</xsl:template>
    
    <xsl:template name="dates">
        <xsl:param name="startDate"/>
        <xsl:param name="endDate"/>
        
        <span class="news-date">
            <xsl:choose>
                <xsl:when test="$startDate and not($endDate)">
                    <xsl:call-template name="date-pattern-point">
                        <xsl:with-param name="date" select="$startDate"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$endDate and not($startDate)">
                    <xsl:call-template name="date-pattern-point">
                        <xsl:with-param name="date" select="$endDate"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$startDate and $endDate">
                    <xsl:call-template name="date-pattern-point">
                        <xsl:with-param name="date" select="$startDate"/>
                    </xsl:call-template>
                    <xsl:text> - </xsl:text>
                    <xsl:call-template name="date-pattern-point">
                        <xsl:with-param name="date" select="$endDate"/>
                    </xsl:call-template>
                </xsl:when>
                
            </xsl:choose>
        </span>
    </xsl:template>
    
    <xsl:template name="date-pattern-point">
        <xsl:param name="date"/>
        
        <i18n:date src-pattern="yyyy-MM-dd'T'hh:mm:ss" pattern="dd.MM.yyyy"><xsl:value-of select="$date"/></i18n:date>
    </xsl:template>        
    
</xsl:stylesheet>