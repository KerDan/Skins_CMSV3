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

    <xsl:import href="plugin:web://stylesheets/content/article/article-link.xsl"/>

    <xsl:template name="view">
        <p>
            <xsl:text>- </xsl:text>
            <xsl:choose>
                <xsl:when test="//pages/page">
                    <a href="{$prefix}/{//pages/page/@lang}/{//pages/page/@path}.html"><xsl:value-of select="metadata/title"/></a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="metadata/title"/>
                </xsl:otherwise>
            </xsl:choose>
        </p>
    </xsl:template>

</xsl:stylesheet>


