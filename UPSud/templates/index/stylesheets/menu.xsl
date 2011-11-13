<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
		xmlns:sitemap="http://anwrt.com/sitemap/2.0">			
	<xsl:template name="content">
		<table width="100%">
			<tr>
				<td id="cms-toolbar"></td>
			</tr>
			<tr>
				<td valign="top"> <span class="content">
				<table width="100%">
					<tr>
          				<td width="200" valign="top">
						<xsl:choose>
							<xsl:when test="$lang='en'">
								<p>menu anglais</p>
							</xsl:when>
							<xsl:otherwise>
								<p>menu french</p>
							</xsl:otherwise>
						</xsl:choose>
   						</td>
						<td bgcolor="white" valign="top">
						<p>actu</p>
						</td>
						<td width="200" valign="top">
							<p>menu droite</p>
						</td>
		   			</tr>
				</table> </span>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>