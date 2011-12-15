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
                xmlns:str="http://exslt.org/strings"
                extension-element-prefixes="math str">
	
    <xsl:import href="plugin:web://pages/services/search/search.xsl" />
    <xsl:import href="../search-criteria/search-criteria.xsl" />	
    
	<xsl:param name="on-same-page"/>
    <xsl:variable name="skin">UPSud</xsl:variable>

	<xsl:template name="form">
		<form action="{$cms-context}/{/search/url}#nav" method="post" class="search">
			<xsl:choose>
				<xsl:when test="$on-same-page = 'true' or (count(hit/hit) + sum(content-types/*/hits/@total)) = 0">
					<xsl:call-template name="form-search"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="form-search-hidden"/>
					<div class="back"><a href="{$cms-context}/{url}" title="FRONT_MODULE_SEARCH_BACK_TO_SEARCH_TITLE" i18n:attr="title"><i18n:text i18n:key="FRONT_MODULE_SEARCH_BACK_TO_SEARCH"/></a></div>
				</xsl:otherwise>
			</xsl:choose>
				
			<a name="nav"/>
			
			<xsl:if test="/search/form/fields/content-types-choice = 'filter' and content-types/*/hits">
				<xsl:call-template name="content-types-filter"/>
			</xsl:if>
			
			<xsl:if test="hits/hit|content-types/*[@current = 'true']/hits/hit">
				<xsl:call-template name="results-sort"/>
			</xsl:if>
		</form>	
		
		<xsl:choose>
			<xsl:when test="hits/hit|content-types/*[@current = 'true']/hits/hit">
				<xsl:call-template name="hits"/>
				
				<xsl:call-template name="pagination"/>
			</xsl:when>
			<xsl:when test="/search/form/values and not(/search/illegal-textfield)">
				<div class="no-result"><i18n:text i18n:key="FRONT_MODULE_SEARCH_NO_RESULT"/></div>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<!-- +
	     | Template for filter by content types
	     + -->
	<xsl:template name="content-types-filter">
		<div class="ctypes-filter">
			<p class="number"><span><xsl:value-of select="sum(content-types/*/hits/@total)"/></span><xsl:text> </xsl:text><i18n:text i18n:key="PLUGINS_WEB_SERVICE_FRONT_SEARCH_RESULTS"/></p>
			<ul class="ctypes">
				<xsl:for-each select="content-types/*[hits/@total != '0']">
					<li>
						<xsl:choose>
							<xsl:when test="@current = 'true'">
								<span><xsl:value-of select="label"/> (<xsl:value-of select="hits/@total"/>)</span>
								<input type="hidden" name="current-ctype-filter" value="{local-name()}"/>
							</xsl:when>
							<xsl:otherwise>
								<input type="submit" name="ctype-filter-{local-name()}" value="{label} ({hits/@total})"></input>
							</xsl:otherwise>
						</xsl:choose>
					</li>
				</xsl:for-each>
			</ul>
		</div>
	</xsl:template>
	
	<!-- +
		 | Template for results
		 + -->
	<xsl:template name="hits">
		
		<dl class="search-hits">
							
			<xsl:for-each select="/search/hits/hit|/search/content-types/*[@current = 'true']/hits/hit">
			
				<xsl:choose>
					<xsl:when test="type = 'resource'"> 
						<dt class="hit resource">
							<xsl:if test="position() mod 2 = 0"><xsl:attribute name="class">hit resource even</xsl:attribute></xsl:if>
							<img class="icon" src="{$contextPath}/{icon}" alt=""/>
							<a href="{$cms-context}/{uri}.html" title="{title}"><xsl:value-of select="title"/></a>
							<span class="size"> (<xsl:value-of select="size"/>)</span>
						</dt>
						<dd class="hit resource">	
							<xsl:if test="position() mod 2 = 0"><xsl:attribute name="class">hit resource even</xsl:attribute></xsl:if>
							<xsl:value-of select="excerpt"/>
							<xsl:if test="/search/form/values/multisite">
								<br/>
								<span class="site"><xsl:value-of select="siteTitle"/><xsl:text> - </xsl:text><a href="{siteUrl}" target="_blank" title="{siteTitle}"><xsl:value-of select="siteUrl"/></a></span>
							</xsl:if>
						</dd>
					</xsl:when>
					<xsl:otherwise>
						<dt class="hit page">
							<a title="{title}" class="text_links">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="$cms-context"/>
                                    <xsl:text>/</xsl:text>
                                    <xsl:value-of select="uri"/>
                                    <xsl:text>.html</xsl:text>
                                    <xsl:if test="/search/form/values/textfield != '' or /search/form/values/all-words != '' or /search/form/values/exact-wording != ''">
                                        <xsl:choose>
                                            <xsl:when test="contains(uri, '?')">&amp;</xsl:when>
                                            <xsl:otherwise>?</xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:text>search-keywords=</xsl:text>
                                        <xsl:if test="/search/form/values/textfield != ''"><xsl:value-of select="/search/form/values/textfield"/></xsl:if>
                                        <xsl:if test="/search/form/values/all-words != ''">
                                            <xsl:if test="/search/form/values/textfield != ''">,</xsl:if>
                                            <xsl:for-each select="str:split(/search/form/values/all-words)">
                                                <xsl:if test="position() &gt; 1">,</xsl:if>
                                                <xsl:value-of select="."/>
                                            </xsl:for-each>
                                        </xsl:if>
                                        <xsl:if test="/search/form/values/exact-wording != ''">
                                            <xsl:if test="/search/form/values/textfield != '' or /search/form/values/all-words != ''">,</xsl:if>
                                            <xsl:value-of select="/search/form/values/exact-wording"/>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:attribute>
                                <xsl:value-of select="title"/>
                            </a>
						</dt>
						<dd class="hit page">	
							<xsl:if test="position() mod 2 = 0"><xsl:attribute name="class">hit page even</xsl:attribute></xsl:if>
							<xsl:value-of select="excerpt"/>
							
							<xsl:if test="/search/form/values/multisite">
								<br/>
								<span class="site"><xsl:value-of select="siteTitle"/><xsl:text> - </xsl:text><a href="{siteUrl}" target="_blank" title="{siteTitle}" class="text_links"><xsl:value-of select="siteUrl"/></a></span>
							</xsl:if>
						</dd>
					</xsl:otherwise>
				</xsl:choose>
				
			</xsl:for-each>
			
		</dl>
	</xsl:template>	
	
	<!-- +
		 | Template for results sort
		 + -->
	<xsl:template name="results-sort">
        <br/><br/>
        <h3><i18n:text i18n:key="MODULE_SEARCH_RESULT_TITLE" i18n:catalogue="skin.{$skin}"/></h3>
		<div class="results-sort">
			<ul class="sort">
				<li><span><i18n:text i18n:key="FRONT_MODULE_SEARCH_SORT_BY"/></span></li>
				<li>
					<xsl:choose>
						<xsl:when test="/search//sort-by-score">
							<i18n:text i18n:key="FRONT_MODULE_SEARCH_SORT_BY_SCORE"/>
						</xsl:when>
						<xsl:otherwise>
							<input type="submit" name="sort-by-score" value="FRONT_MODULE_SEARCH_SORT_BY_SCORE" i18n:attr="value"/>
						</xsl:otherwise>
					</xsl:choose>
				</li>
				<li>
					<xsl:choose>
						<xsl:when test="/search//sort-by-title-for-sorting">
							<i18n:text i18n:key="FRONT_MODULE_SEARCH_SORT_BY_TITLE"/>
						</xsl:when>
						<xsl:otherwise>
							<input type="submit" name="sort-by-title-for-sorting" value="FRONT_MODULE_SEARCH_SORT_BY_TITLE" i18n:attr="value"/>
						</xsl:otherwise>
					</xsl:choose>
				</li>
				<li>
					<xsl:choose> 
						<xsl:when test="/search//sort-by-last-validation">
							<i18n:text i18n:key="FRONT_MODULE_SEARCH_SORT_BY_DATE"/>
						</xsl:when>
						<xsl:otherwise>
							<input type="submit" name="sort-by-last-validation" value="FRONT_MODULE_SEARCH_SORT_BY_DATE" i18n:attr="value"/>
						</xsl:otherwise>
					</xsl:choose>
				</li>
				
			</ul>
		</div>
	</xsl:template>
		 
			
</xsl:stylesheet>