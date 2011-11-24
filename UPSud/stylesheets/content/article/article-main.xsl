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

    <xsl:import href="plugin:web://stylesheets/content/article/article-main.xsl"/>

	<xsl:template name="view">
		
        <xsl:choose>
            <xsl:when test="tags/FOCUS_VERT or tags/FOCUS_VIOLET or tags/FOCUS_MARRON or tags/FOCUS_WITHOUT_TITLE">
                <xsl:call-template name="focus"/>      
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="main"/>
            </xsl:otherwise>        
        </xsl:choose>
        
	</xsl:template>
    
    <xsl:template name="focus">
        <div>
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="tags/FOCUS_VERT">image</xsl:when>
                    <xsl:when test="tags/FOCUS_VIOLET">liens</xsl:when>
                    <xsl:when test="tags/FOCUS_MARRON">doc</xsl:when>
                    <xsl:otherwise></xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            
            <xsl:if test="not(tags/FOCUS_WITHOUT_TITLE)">
                <h1 class="title"><xsl:value-of select="metadata/title"/></h1>
            </xsl:if>                     
                        
            <xsl:if test="metadata/document-subtitle != ''">
                <h2 class="subtitle"><xsl:value-of select="metadata/document-subtitle"/></h2>
            </xsl:if>
                
            <xsl:if test="metadata/illustration/image">
                <div class="content-illustration">
                    <img src="{resolver:resolveBoundedImage(metadata/illustration/image/@type, metadata/illustration/image/@path, 148, 148)}" alt="{metadata/illustration/alt-text}"/>
                </div>
            </xsl:if>
            
            <xsl:if test="metadata/content/docbook:article and not(normalize-space(metadata/content/docbook:article/docbook:para) = '&#160;' and count(metadata/content/docbook:article/*) = 1 and not(metadata/content/docbook:article/*))">
                <xsl:apply-templates select="metadata/content/docbook:article">
                    <xsl:with-param name="level" select="2"/>
                </xsl:apply-templates>
            </xsl:if>
                    
            <xsl:if test="metadata/contact/name or metadata/contact/mail">
                <p class="content-contact">
                    <xsl:if test="metadata/contact/name"><xsl:value-of select="metadata/contact/name"/><br/></xsl:if>
                    <xsl:if test="metadata/contact/mail">
                        <xsl:call-template name="mail-antispam">
                            <xsl:with-param name="mail" select="metadata/contact/mail"></xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>
                </p>
            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template name="main">
        <h1 class="title"><xsl:value-of select="metadata/title"/></h1>
                    
        <xsl:if test="metadata/document-subtitle != ''">
            <h2 class="subtitle"><xsl:value-of select="metadata/document-subtitle"/></h2>
        </xsl:if>
            
        <!-- <xsl:if test="metadata/illustration/image">
            <div class="content-illustration">
                <img src="{resolver:resolveBoundedImage(metadata/illustration/image/@type, metadata/illustration/image/@path, 148, 148)}" alt="{metadata/illustration/alt-text}"/>
            </div>
        </xsl:if> -->
        
        <xsl:if test="metadata/content/docbook:article and not(normalize-space(metadata/content/docbook:article/docbook:para) = '&#160;' and count(metadata/content/docbook:article/*) = 1 and not(metadata/content/docbook:article/*))">
            <xsl:apply-templates select="metadata/content/docbook:article">
                <xsl:with-param name="level" select="2"/>
            </xsl:apply-templates>
        </xsl:if>
                
        <xsl:if test="metadata/contact/name or metadata/contact/mail">
            <p class="content-contact">
                <xsl:if test="metadata/contact/name"><xsl:value-of select="metadata/contact/name"/><br/></xsl:if>
                <xsl:if test="metadata/contact/mail">
                    <xsl:call-template name="mail-antispam">
                        <xsl:with-param name="mail" select="metadata/contact/mail"></xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </p>
        </xsl:if>

        <!-- Comments -->
        <xsl:call-template name="comments"/>
    </xsl:template>

</xsl:stylesheet>


