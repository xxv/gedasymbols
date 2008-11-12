<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:import href="svgpath2lines.xsl"/>
	<xsl:import href="xsltmatrixtransform.xsl"/>
	<xsl:output method="xml" 
		encoding="UTF-8" 
		indent="yes" 
		standalone="yes" />
	<xsl:strip-space elements="*"/>


	<xsl:template match="*">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates/>
		</xsl:copy>	
	</xsl:template>


	<xsl:template match="*[local-name()='path']"> 

<!--		matrix<xsl:value-of select="@transform"/>...
-->
<!--		<xsl:call-template name="mult-x">
		        <xsl:with-param name="matrix" select="normalize-space(@transform)"/>
	        	<xsl:with-param name="x1" >100</xsl:with-param>
	        	<xsl:with-param name="y1">10</xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="mult-y">
		        <xsl:with-param name="matrix" select="normalize-space(@transform)"/>
	        	<xsl:with-param name="x1" >100</xsl:with-param>
	        	<xsl:with-param name="y1">10</xsl:with-param>
		</xsl:call-template>
-->

<!--		<xsl:value-of select="@d"/> -->
		<xsl:call-template name="parse">
			<xsl:with-param name="dval" select="normalize-space(@d)"/>
			<xsl:with-param name="style" select="normalize-space(@style)"/>
			<xsl:with-param name="id" select="normalize-space(@id)"/>
		        <xsl:with-param name="transform" select="normalize-space(@transform)"/>
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>
