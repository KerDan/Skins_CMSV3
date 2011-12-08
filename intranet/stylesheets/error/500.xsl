<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
	xmlns:error="http://apache.org/cocoon/error/2.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ex="http://apache.org/cocoon/exception/1.0">

	<xsl:import href="../../stylesheets/common.xsl"/>
	
	<xsl:param name="pageTitle">An error has occured</xsl:param>
	<xsl:param name="cms-context"/>
	<xsl:param name="version-context"/>
	<xsl:param name="lang">fr</xsl:param>
	<xsl:param name="sitemap">default</xsl:param>
	<xsl:param name="back-office">false</xsl:param>
	<xsl:param name="skin"/>
	<xsl:param name="realPath"/>
	
	<xsl:variable name="skincontext"><xsl:value-of select="$cmscontext"/>/skins/<xsl:value-of select="$skin"/>/resources</xsl:variable>

	<xsl:template match="/ex:exception-report">
		<html>
			<head>
				<title>Université Paris-Sud 11 - An error has occured</title>
				<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
				<meta name="description" content="{/cms/page/pageContents/area/html/head/meta[@name='subject']/@content}"/>
				<meta name="keywords">
	           		 <xsl:attribute name="content"><xsl:for-each select="/cms/page/pageContents/area/html/head/meta[@name='keywords']"><xsl:if test="position() != 1">,</xsl:if><xsl:value-of select="@content"/></xsl:for-each></xsl:attribute>
	       		 </meta>
				<link rel="stylesheet" href="{$skincontext}/css/u-psud.css" type="text/css"/>
			</head>
			<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
			
			<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
				 <tr>
      				<td valign="top" background="{$skincontext}/img/bkg_top.gif">
      					<table width="883" border="0" align="center" cellpadding="0" cellspacing="0">
         					<tr>
            					<td height="37">
            						<xsl:call-template name="top"/>
            					</td>
            				</tr>
            				<tr>
          						<td height="32">
          							<xsl:call-template name="navigation-top"/>
      							</td>
      						</tr>
      						<tr>
          						<td height="29" valign="top">
          							<a href="{$cms-context}/{$lang}/index.html"><img src="{$skincontext}/img/logo_bottom.gif" width="47" height="29" border="0" /></a>
          						</td>
       						</tr>
       						<tr>
          						<td valign="top">
          							<table width="883" border="0" cellspacing="0" cellpadding="0">
          								<tr>
	              							<td><img src="{$skincontext}/img/page_bkg_top2.gif" width="883" height="15"/></td>
	            						</tr>
	            						<tr>
             	 							<td background="{$skincontext}/img/page_bkg_content.gif">
             	 								<table width="883" border="0" cellspacing="0" cellpadding="0">
             	 									<tr>
             	 										<td width="4"><img src="{$skincontext}/img/pixel.gif" width="4" height="1"/></td>
				  										<td valign="top">
				  											<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  												<tr>
																	<td id="cms-toolbar">
																	</td>
																</tr>
			                    								<tr>
									                      			<td class="text" style="vertical-align: top" height="500px">
															  			<div class="content">
																			<h1><i18n:text i18n:key="SKIN_ERROR_500_TITLE" i18n:catalogue="skin.{$skin}"/></h1>
																		    <br/>
																		    <i18n:text i18n:key="SKIN_ERROR_500_TEXT" i18n:catalogue="skin.{$skin}"/>
																		    <br/>
																		    <br/>
																			<i18n:text i18n:key="SKIN_ERROR_404_HOME_LINK" i18n:catalogue="skin.{$skin}"/>
																			<xsl:text> </xsl:text><a href="{$cms-context}/{$lang}/index.html">
																			<i18n:text i18n:key="SKIN_ERROR_404_HOME_LINK2" i18n:catalogue="skin.{$skin}"/>
																			</a><xsl:text> </xsl:text>
																			<i18n:text i18n:key="SKIN_ERROR_404_HOME_LINK3" i18n:catalogue="skin.{$skin}"/>
																		    <br/>
																		    <br/>
																		    <br/>
																			<p style="font-size: 9px;"><i18n:text i18n:key="SKIN_ERROR_500_ERROR_MESSAGE" i18n:catalogue="skin.{$skin}"/> :</p>
																			<!-- Contenu de la page d'administration -->							
																			<p style="font-size: 9px; border: 1px dashed #cdcdcd; padding: 10px;">
																				<xsl:value-of select="@class"/>:
																				<xsl:value-of select="ex:message"/>
																				<xsl:if test="ex:location">
																					<br/><span style="font-weight: normal"><xsl:apply-templates select="ex:location"/></span>
																				</xsl:if>
																			</p>
																											        
																			<div style="display: none">
																				<xsl:copy-of select="/"/>
																			</div>
																		</div>
			                          									
															  		</td>
															  	</tr>
			                   								</table>
				  										</td>
             	 									</tr>
             	 								</table>
             	 							</td>
             	 						</tr>
             	 						<tr>
											<td height="7">
												<img src="{$skincontext}/img/page_bkg_bottom.gif" width="883" height="7"/>
											</td>
										</tr>
          							</table>
          						</td>
          					</tr>
          				</table>
          			</td>
        		</tr>
        		<tr>
    				<td height="35" background="{$skincontext}/img/bkg_middle.gif"><img width="1" height="35" /></td>
  				</tr>
  				<tr>
    				<td valign="bottom" background="{$skincontext}/img/bkg_bottom.gif" class="homepage_bkg_bottom">
	  					<table width="883" border="0" align="center" cellpadding="0" cellspacing="0">
					      <tr>
					          <td height="30" class="bottom"><i18n:text i18n:key="copyright" i18n:catalogue="skin.{$skin}"/><a href="{$cms-context}/{$lang}/{$url_sitemap}" class="bottom"><i18n:text i18n:key="sitemap" i18n:catalogue="skin.{$skin}"/></a> - <a href="{$cms-context}/{$lang}/{$url_access}" class="bottom"><i18n:text i18n:key="access" i18n:catalogue="skin.{$skin}"/></a> - <a href="mailto:{$webmaster}" class="bottom">webmaster</a> - <a href="{$cms-context}/{$lang}/{$url_info_legales}" class="bottom"><i18n:text i18n:key="info_legales" i18n:catalogue="skin.{$skin}"/></a> - R&#233;alisation : <a href="http://www.anyware-tech.com" target="_blank" class="bottom">Anyware Technologies</a> &amp; <a href="http://www.netvizion.fr" target="_blank" class="bottom">NetviZion</a></td>
					        </tr>
      					</table>
					</td>
  				</tr>
			</table>
			
          	</body>
        </html>
	</xsl:template>

  <xsl:template match="ex:location">
   <xsl:if test="string-length(.) > 0">
     <em><xsl:value-of select="."/></em>
     <xsl:text> - </xsl:text>
   </xsl:if>
   <xsl:call-template name="print-location"/>
  </xsl:template>
  
  <xsl:template name="print-location">
     <xsl:choose>
       <xsl:when test="contains(@uri, $realPath)">
         <xsl:text>context:/</xsl:text>
         <xsl:value-of select="substring-after(@uri, $realPath)"/>
       </xsl:when>
       <xsl:otherwise>
         <xsl:value-of select="@uri"/>
       </xsl:otherwise>
      </xsl:choose>
      <xsl:text> - </xsl:text>
      <xsl:value-of select="@line"/>:<xsl:value-of select="@column"/>
  </xsl:template>
  
  <xsl:template name="top">
			<table width="883" height="37" border="0" cellpadding="0" cellspacing="0">
             		<tr>
                		<td width="187" background="{$skincontext}/img/top_logo.gif" class="homepage_bkg_top_logo">
                			<img src="{$skincontext}/img/pixel.gif" width="187" height="37" />
                		</td>
                		<td width="100%">&#160;</td>
                		<td width="251">
				  			<table width="251" height="37" border="0" cellpadding="0" cellspacing="0">
                    		<tr>
                      			<td width="48">
                      				<a href="#intranet"><img src="{$skincontext}/img/top_intranet.jpg" width="48" height="37" border="0" /></a>
                      			</td>
					    		<xsl:call-template name="search"/>
                      			<td width="24"><img src="{$skincontext}/img/pixel.gif" width="24" height="1"/></td>
                     			<td width="18"><img src="{$skincontext}/img/pixel.gif" width="18" height="1"/></td>
                    		</tr>
                  			</table>
			   			 </td>
              		</tr>
            </table>    	
	</xsl:template>
	
	<xsl:template name="search">
			<td width="161">
				<table border="0" cellspacing="0" cellpadding="0" align="center" height="16px">
			    	<tr>
			       		<td valign="middle">
							<input type="text" name="textfield" size="15" maxlength="500" class="text_field"/>
						</td>
			            <td width="16" valign="top">
							<input type="image" src="{$skincontext}/img/top_search.gif" border="0">
							</input>
						</td>
			     	</tr>
            	</table>
			</td>
	</xsl:template>
	
	<xsl:template name="navigation-top">
		<table width="883" height="32" border="0" cellpadding="0" cellspacing="0">
        	<tr>
            	<td width="208">
            		<a href="{$cms-context}/{$lang}/index.html"><img src="{$skincontext}/img/top_navigation_logo.jpg" width="208" height="32" border="0" /></a>
            	</td>
              	<td width="5">
              	</td>
              	<td class="top_navigation">
              	</td>
              	<td width="6">
              	</td>
           	</tr>
    	</table>
	</xsl:template>
	
</xsl:stylesheet>

