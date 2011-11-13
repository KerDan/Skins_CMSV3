<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="content"/>
	<xsl:param name="version"/>
	<xsl:param name="style"/>

	<xsl:param name="context"/>
	<xsl:param name="cmscontext"/>
	<xsl:param name="context"/>
	<xsl:param name="context-internal"/>
	<xsl:param name="skin"/>
	<xsl:param name="site"/>
	<xsl:param name="lang"/>
	<xsl:param name="version-context"/>
	<xsl:param name="style"/>
	<xsl:param name="template"/>
	
	<xsl:variable name="prefix"><xsl:value-of select="$context"/></xsl:variable>
	<!-- URL des ressources qui differe si non version courante -->
	<xsl:variable name="files">
		<xsl:value-of select="concat($cmscontext, '/content/')"/>
		<xsl:if test="$version != ''">
			<xsl:value-of select="concat('v_', $version, '/')"/>
		</xsl:if>
		<xsl:value-of select="concat($site, '/', $content, '/', $lang, '/data')"/>
	</xsl:variable>
	<xsl:variable name="resource-prefix">resource://</xsl:variable>
	<xsl:variable name="document-prefix">document://</xsl:variable>
	<xsl:variable name="odf-prefix">odf://</xsl:variable>

	<xsl:variable name="skincontext" select="concat($cmscontext, '/skins/', $skin, '/resources')"/>
	<xsl:variable name="stylecontext" select="concat($cmscontext, '/skins/', $skin, '/templates/', $template, '/styles/', $style)"/>
	
	<xsl:template match="content">
		<html>
			<head>
  				<title><xsl:value-of select="metadata/title"/></title>
  				<xsl:for-each select="metadata/*[count(*)=0]">
  					<meta name="{name(.)}" content="{.}"/>
  				</xsl:for-each>
			</head>
			<body>
				<xsl:apply-templates select="document"/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="document">
  		<xsl:apply-templates select="para|diplome|form|section|table|itemizedlist|orderedlist|error">
  			<xsl:with-param name="level" select="1"/>
		</xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="error">
		<p class="error">
  			<xsl:apply-templates/>
		</p>
	</xsl:template>
	
	<xsl:template match="diplome">
		<!--<xsl:variable name="href"><xsl:value-of select="concat($cmscontext, $context-internal, '/', $lang, '/_modules/odf/', substring-after(@url, $odf-prefix))"/></xsl:variable>-->
		
		<!-- 
		<xsl:variable name="href"><xsl:value-of select="concat($prefix,'/', $lang, '/',substring-after(@url,$document-prefix),'.html')"/></xsl:variable>
		<a href="{$href}"><xsl:value-of select="@label"/></a>
		<ul>
			<xsl:apply-templates select="program"/>
		</ul>
		-->
		<table class="odf" width="100%">
			<tr>
				<td colspan="2" class="head" style="text-align: center">
					<xsl:variable name="href"><xsl:value-of select="concat($prefix,'/', $lang, '/',substring-after(@url,$document-prefix),'.html')"/></xsl:variable>
					<a href="{$href}"><xsl:value-of select="@label"/></a>
				</td>
			</tr>
			<tr>
				<td class="subhead" width="50%">Parcours</td>
				<td class="subhead" width="50%">Spécialités</td>
			</tr>
			<tr>
				<td><ul><xsl:apply-templates select="program"/></ul></td>
				<td></td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="program">
		<!--<xsl:variable name="href"><xsl:value-of select="concat($cmscontext, $context-internal, '/', $lang, '/_modules/odf/', substring-after(@url, $odf-prefix))"/></xsl:variable>-->
			
		<!-- 
		<li>
			<xsl:variable name="href"><xsl:value-of select="concat($prefix,'/', $lang, '/',substring-after(@url,$document-prefix),'.html')"/></xsl:variable>
			<a href="{$href}"><xsl:value-of select="@label"/></a>
			<ul>
				<xsl:apply-templates select="course"/>
			</ul>
		</li>
		-->
		<li>
			<xsl:variable name="href"><xsl:value-of select="concat($prefix,'/', $lang, '/',substring-after(@url,$document-prefix),'.html')"/></xsl:variable>
			<a href="{$href}"><xsl:value-of select="@label"/></a>
		</li>
	</xsl:template>
	
	<xsl:template match="course">
		<li>
			<!--<xsl:variable name="href"><xsl:value-of select="concat($cmscontext, $context-internal, '/', $lang, '/_modules/odf/', substring-after(@url, $odf-prefix))"/></xsl:variable>-->
			<xsl:variable name="href"><xsl:value-of select="concat($prefix,'/', $lang, '/',substring-after(@url,$document-prefix),'.html')"/></xsl:variable>
			<a href="{$href}"><xsl:value-of select="@label"/></a>
		</li>
	</xsl:template>
	
	<xsl:template match="section">
		<xsl:param name="level"/>
		
		<xsl:element name="h{$level}">
			<xsl:apply-templates select="title"/>		
		</xsl:element>
		
  		<xsl:apply-templates select="diplome|para|form|table|itemizedlist|orderedlist"/>
		<xsl:apply-templates select="section">
  			<xsl:with-param name="level" select="$level+1"/>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="subscript">
		<sub>
  			<xsl:apply-templates/>
		</sub>
	</xsl:template>
	
	<xsl:template match="supscript">
		<sup>
  			<xsl:apply-templates/>
		</sup>
	</xsl:template>
	
	<xsl:template match="para">
		<p>
			<xsl:copy-of select="@align"/>
  			<xsl:apply-templates/>
		</p>
	</xsl:template>
	
	<xsl:template match="para" mode="listitem">
		<xsl:copy-of select="@align"/>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="para" mode="caption">
		<p class="legende">
			<xsl:copy-of select="@align"/>
  			<xsl:apply-templates select="text()|emphasis"/>
		</p>
	</xsl:template>
	
	<xsl:template match="phrase[@role='linebreak']">
		<br/>
	</xsl:template>

	<xsl:template match="emphasis">
		<xsl:choose>
			<xsl:when test="@role='strong'">
				<b><xsl:apply-templates/></b>
			</xsl:when>
			<xsl:otherwise>
				<i><xsl:apply-templates/></i>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="ulink">
		<xsl:variable name="url">
	    	<xsl:choose>
	      		<xsl:when test="starts-with(@url,$document-prefix)">
	        		<xsl:value-of select="concat($prefix,'/',substring-after(@url,$document-prefix),'.html')"/>
	      		</xsl:when>
	      		<xsl:when test="starts-with(@url,$resource-prefix)">
	      			<xsl:variable name="actual-url">
	      				<xsl:choose>
	      					<xsl:when test="substring(@url, string-length(@url), 1) = '/'"><xsl:value-of select="substring(@url, 1, string-length(@url) - 1)"/></xsl:when>
	      					<xsl:otherwise><xsl:value-of select="@url"/></xsl:otherwise>
	      				</xsl:choose>
	      			</xsl:variable>
	        		<xsl:value-of select="concat($cmscontext, '/modules/resources/download/', $site, '/', substring-after($actual-url, $resource-prefix))"/>
	      		</xsl:when>
	      		<xsl:when test="starts-with(@url,$odf-prefix)">
	      			<xsl:variable name="actual-url">
	      				<xsl:choose>
	      					<xsl:when test="substring(@url, string-length(@url), 1) = '/'"><xsl:value-of select="substring(@url, 1, string-length(@url) - 1)"/></xsl:when>
	      					<xsl:otherwise><xsl:value-of select="@url"/></xsl:otherwise>
	      				</xsl:choose>
	      			</xsl:variable>
	        		<xsl:value-of select="concat($cmscontext, '/modules/odf/preview/', substring-after($actual-url, $odf-prefix))"/>
	      		</xsl:when>
	      		<xsl:otherwise>
	        		<xsl:value-of select="@url"/>
	      		</xsl:otherwise>
	    	</xsl:choose>
	  	</xsl:variable>
		<a href="{$url}">
	  		<xsl:if test="not(starts-with(@url,$document-prefix)) and not(starts-with(@url,$resource-prefix)) ">
	    		<xsl:attribute name="target">_blank</xsl:attribute>
	  		</xsl:if>
	  		<xsl:apply-templates/>
		</a>
	</xsl:template>
	
	<xsl:template match="inlinemediaobject">
		<xsl:apply-templates select="imageobject"/>
		<xsl:apply-templates select="caption/para" mode="caption"/>
	</xsl:template>
	
	<xsl:template match="imageobject[not(@type) or @type='img']">
		<xsl:variable name="style-name">width:<xsl:value-of select="imagedata/@width"/>;height:<xsl:value-of select="imagedata/@depth"/></xsl:variable>
		<xsl:variable name="src">
			<xsl:choose>
				<xsl:when test="starts-with(imagedata/@fileref, $resource-prefix)">
	      			<xsl:variable name="actual-url">
	      				<xsl:choose>
	      					<xsl:when test="substring(imagedata/@fileref, string-length(imagedata/@fileref), 1) = '/'"><xsl:value-of select="substring(imagedata/@fileref, 1, string-length(imagedata/@fileref) - 1)"/></xsl:when>
	      					<xsl:otherwise><xsl:value-of select="imagedata/@fileref"/></xsl:otherwise>
	      				</xsl:choose>
	      			</xsl:variable>
	        		<xsl:value-of select="concat($cmscontext, '/modules/resources/download/', $site, '/', substring-after($actual-url, $resource-prefix))"/>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="$files"/>/<xsl:value-of select="imagedata/@fileref"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<img src="{$src}" style="{$style-name}" border="0">
			<xsl:if test="objectinfo">
				<xsl:attribute name="alt"><xsl:value-of select="objectinfo/title"/></xsl:attribute>
			</xsl:if>
			<xsl:copy-of select="@align"/>
		</img>
	</xsl:template>

	<xsl:template match="imageobject[@type='flash']">
		<xsl:variable name="src">
			<xsl:choose>
				<xsl:when test="starts-with(imagedata/@fileref, $resource-prefix)">
	      			<xsl:variable name="actual-url">
	      				<xsl:choose>
	      					<xsl:when test="substring(imagedata/@fileref, string-length(@url), 1) = '/'"><xsl:value-of select="substring(imagedata/@fileref, 1, string-length(imagedata/@fileref) - 1)"/></xsl:when>
	      					<xsl:otherwise><xsl:value-of select="imagedata/@fileref"/></xsl:otherwise>
	      				</xsl:choose>
	      			</xsl:variable>
	        		<xsl:value-of select="concat($cmscontext, '/modules/resources/download/', $site, '/', substring-after($actual-url, $resource-prefix))"/>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="$files"/>/<xsl:value-of select="imagedata/@fileref"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0">
			<xsl:if test="imagedata/@width"><xsl:attribute name="width"><xsl:value-of select="imagedata/@width"/></xsl:attribute></xsl:if>
			<xsl:if test="imagedata/@depth"><xsl:attribute name="height"><xsl:value-of select="imagedata/@depth"/></xsl:attribute></xsl:if>
			<xsl:if test="imagedata/@align"><xsl:attribute name="align"><xsl:value-of select="imagedata/@align"/></xsl:attribute></xsl:if>
            <param name="movie" value="{$src}"/>
            <param name="quality" value="high"/>
            <embed src="{$src}" pluginspage="http://www.macromedia.com/go/getflashplayer" quality="high" type="application/x-shockwave-flash">
				<xsl:if test="imagedata/@width"><xsl:attribute name="width"><xsl:value-of select="imagedata/@width"/></xsl:attribute></xsl:if>
				<xsl:if test="imagedata/@depth"><xsl:attribute name="height"><xsl:value-of select="imagedata/@depth"/></xsl:attribute></xsl:if>
				<xsl:if test="imagedata/@align"><xsl:attribute name="align"><xsl:value-of select="imagedata/@align"/></xsl:attribute></xsl:if>
            </embed>
        </object>
	</xsl:template>
		
	<xsl:template match="table">
		<xsl:variable name="style">
			<xsl:if test="@align">align:<xsl:value-of select="@align"/>;</xsl:if>
		</xsl:variable>
		<xsl:variable name="class">
			<xsl:choose>
				<xsl:when test="@frame='all'">table-border</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<table style="{$style}" class="{$class}" width="{@width}">
			<xsl:if test="string-length(@align)!=0"><xsl:copy-of select="@align"/></xsl:if>
			<xsl:apply-templates select="tgroup"/>
		</table>
		<xsl:apply-templates select="title" mode="caption"/>
	</xsl:template>
			
	<xsl:template match="tgroup">
        <colgroup>
            <xsl:for-each select="colspec">
                <col width="{@colwidth}"/>
            </xsl:for-each>
        </colgroup> 
		<xsl:apply-templates select="thead|tbody"/>
	</xsl:template>
		
	<xsl:template match="thead">
		<xsl:apply-templates select="row" mode="head"/>
	</xsl:template>
		
	<xsl:template match="tbody">
		<tbody>
			<xsl:apply-templates select="row"/>
		</tbody>
	</xsl:template>
		
	<xsl:template match="row" mode="head">
		<tr>
			<xsl:if test="@align">
				<xsl:attribute name="style">align:<xsl:value-of select="@align"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="entry" mode="head"/>
		</tr>
	</xsl:template>
	
	<xsl:template match="entry" mode="head">
		<th>
			<xsl:if test="@align">
				<xsl:attribute name="style">align:<xsl:value-of select="@align"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@morecols">
				<xsl:attribute name="colspan"><xsl:value-of select="@morecols"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@morerows">
				<xsl:attribute name="rowspan"><xsl:value-of select="@morerows"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="para"/>
		</th>
	</xsl:template>
	
	<xsl:template match="row">
		<tr>
			<xsl:if test="@align">
				<xsl:attribute name="style">align:<xsl:value-of select="@align"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="entry"/>
		</tr>
	</xsl:template>
	
	<xsl:template match="entry">
		<td>
			<xsl:if test="@align">
				<xsl:attribute name="style">align:<xsl:value-of select="@align"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@morecols">
				<xsl:attribute name="colspan"><xsl:value-of select="@morecols"/></xsl:attribute>
			</xsl:if>
			<xsl:if test="@morerows">
				<xsl:attribute name="rowspan"><xsl:value-of select="@morerows"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	
	<xsl:template match="itemizedlist">
		<ul>
			<xsl:apply-templates select="listitem|itemizedlist|orderedlist"/>
		</ul>
	</xsl:template>

	<xsl:template match="orderedlist">
		<ol>
			<xsl:apply-templates select="listitem|itemizedlist|orderedlist"/>
		</ol>
	</xsl:template>
	
	<xsl:template match="itemizedlist|orderedlist" mode="listitem">
		<xsl:apply-templates select="."/>
	</xsl:template>
	
	<xsl:template match="listitem">
		<li>
			<xsl:apply-templates select="para|itemizedlist|orderedlist" mode="listitem"/>
		</li>
	</xsl:template>
	
	<xsl:template match="form">
		<xsl:variable name="action">
			<xsl:choose>
				<xsl:when test="contains(@url, '://')"><xsl:value-of select="@url"/></xsl:when>
				<xsl:when test="starts-with(@url, '/')"><xsl:value-of select="$context"/><xsl:value-of select="@url"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="$context"/>/<xsl:value-of select="@url"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<form method="post" action="{$action}">
			<xsl:attribute name="target">
				<xsl:choose>
					<xsl:when test="@self='true'">_self</xsl:when>
					<xsl:otherwise>_blank</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:if test=".//input[@type='file']">
				<xsl:attribute name="enctype">multipart/form-data</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates/>
		</form>
	</xsl:template>
	
	<xsl:template match="select">
		<select name="{@name}">
			<xsl:if test="@multiple"><xsl:attribute name="multiple">true</xsl:attribute></xsl:if>
			<xsl:copy-of select="option"/>
		</select>
	</xsl:template>
	
	<xsl:template match="textarea">
		<textarea name="{@name}" style="{@style}"><xsl:value-of select="."/></textarea>
	</xsl:template>
	
	<xsl:template match="input">
		<input type="{@type}" style="{@style}">
			<xsl:if test="@value!='' and @type!='password'"><xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute></xsl:if>
			<xsl:if test="@checked='true'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if>
			<xsl:choose>
				<xsl:when test="@type='radio'">
					<xsl:attribute name="name"><xsl:value-of select="@group"/></xsl:attribute>
					<xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="@type='checkbox'">
					<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
					<xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></xsl:otherwise>
			</xsl:choose>
		</input>
	</xsl:template>
	
	<xsl:template match="label">
		<label for="{@input}"><xsl:apply-templates/></label>&#160;
	</xsl:template>
</xsl:stylesheet>
