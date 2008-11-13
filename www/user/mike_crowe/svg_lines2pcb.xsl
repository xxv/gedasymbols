<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="text" />

	<xsl:template match="*[local-name()='g']"> 
Layer(5 "<xsl:value-of select="@id"/>")
(<xsl:apply-templates/>)
	</xsl:template>

	<xsl:template match="*[local-name()='line']"> 
	<xsl:variable name="xscale">72.0 </xsl:variable>
	<xsl:variable name="yscale">-72.0 </xsl:variable>
	<xsl:variable name="xoffset">-30.135599 </xsl:variable>
	<xsl:variable name="yoffset">319.603601 </xsl:variable>
	<xsl:variable name="width">
	 <xsl:value-of select="substring-before(substring-after(concat(@style, ' '),'stroke-width:'), ';')"/>		
	</xsl:variable>	Line[ <xsl:value-of select="floor(100000 * (@x1 - $xoffset) div $xscale)"/> <xsl:text> </xsl:text> 
<xsl:value-of select="floor(100000 * (@y1 - $yoffset) div $yscale)"/>  <xsl:text> </xsl:text> 
<xsl:value-of select="floor(100000 * (@x2 - $xoffset) div $xscale)"/> <xsl:text> </xsl:text>  
<xsl:value-of select="floor(100000 * (@y2 - $yoffset) div $yscale)"/> <xsl:text> </xsl:text>  
<xsl:value-of select="floor(50399.960 * $width )"/> <xsl:text> </xsl:text>  
<xsl:value-of select="floor(2*50399.960 * $width )"/> <xsl:text> </xsl:text>""]</xsl:template>

</xsl:stylesheet>
