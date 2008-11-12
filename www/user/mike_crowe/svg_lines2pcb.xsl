<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="text" />

	<xsl:template match="*[local-name()='g']"> 
Layer(5 "<xsl:value-of select="@id"/>")
(<xsl:apply-templates/>)
	</xsl:template>

	<xsl:template match="*[local-name()='line']"> 
	<xsl:variable name="scale">10.0 </xsl:variable>
	<xsl:variable name="width">
	 <xsl:value-of select="substring-before(substring-after(concat(@style, ' '),'stroke-width:'), ';')"/>		
	</xsl:variable>	Line[ <xsl:value-of select="floor(100000 * @x1 div $scale)"/> <xsl:text> </xsl:text> 
<xsl:value-of select="floor(503.9996 * @y1 div $scale)"/>  <xsl:text> </xsl:text> 
<xsl:value-of select="floor(503.99960 * @x2 div $scale)"/> <xsl:text> </xsl:text>  
<xsl:value-of select="floor(503.99960 * @y2 div $scale)"/> <xsl:text> </xsl:text>  
<xsl:value-of select="floor(50399.960 * $width div $scale)"/> <xsl:text> </xsl:text>  
<xsl:value-of select="floor(2*50399.960 * $width div $scale)"/> <xsl:text> </xsl:text>""]</xsl:template>

</xsl:stylesheet>
