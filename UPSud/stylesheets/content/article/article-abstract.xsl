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

	<xsl:import href="plugin:web://stylesheets/content/article/article-abstract.xsl"/>
    
    <xsl:variable name="skin">UPSud</xsl:variable>
    
    <xsl:template name="view">
        <h1><xsl:value-of select="metadata/title"/></h1>
        
        <xsl:if test="metadata/illustration/image">
            <div class="content-illustration">
                <img src="{resolver:resolveBoundedImage(metadata/illustration/image/@type, metadata/illustration/image/@path, 85, 85)}" alt="{metadata/illustration/alt-text}"/>
            </div>
        </xsl:if>
            
        <p>
            <xsl:choose>
                <xsl:when test="normalize-space(metadata/abstract) != ''">
                    <xsl:value-of select="metadata/abstract"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="truncate">
                        <xsl:with-param name="content" select="metadata/content/docbook:article"/>
                        <xsl:with-param name="length" select="'200'"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
            
            <br/>
            <xsl:if test="//pages/page">
                <a href="{resolver:resolve('page', //pages/page/@id, false)}">
                    <xsl:if test="metadata/illustration/image">
                        <xsl:attribute name="style">margin-left:100px;</xsl:attribute>
                    </xsl:if>
                    <i18n:text i18n:key="CONTENT_READ_MORE" i18n:catalogue="skin.{$skin}"/>
                </a>            
            </xsl:if>            
        </p>
    </xsl:template>
</xsl:stylesheet>
