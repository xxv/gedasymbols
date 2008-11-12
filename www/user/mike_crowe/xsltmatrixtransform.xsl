<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- these two functions, provide teh matrix transformation function according to <svg:transform matrix=""> rules-->
	<xsl:template name="mult-x">
		<xsl:param name="matrix"/>
		<xsl:param name="x1"/>
		<xsl:param name="y1"/>

		<xsl:variable name="matrix1">
			<xsl:value-of select="substring-after( $matrix, '(')"/>
		</xsl:variable>

		<xsl:variable name="mt_a">
			<xsl:value-of select="substring-before($matrix1, ',')"/>
		</xsl:variable>
		<xsl:variable name="matrix2">
			<xsl:value-of select="substring-after($matrix1, ',')"/>
		</xsl:variable>

		<xsl:variable name="mt_b">
			<xsl:value-of select="substring-before( $matrix2, ',')"/>
		</xsl:variable>
		<xsl:variable name="matrix3">
			<xsl:value-of select="substring-after($matrix2, ',')"/>
		</xsl:variable>

		<xsl:variable name="mt_c">
			<xsl:value-of select="substring-before($matrix3,',')"/>
		</xsl:variable>
		<xsl:variable name="matrix4">
			<xsl:value-of select="substring-after($matrix3, ',')"/>
		</xsl:variable>

		<xsl:variable name="mt_d">
			<xsl:value-of select="substring-before($matrix4,',')"/>
		</xsl:variable>
		<xsl:variable name="matrix5">
			<xsl:value-of select="substring-after($matrix4, ',')"/>
		</xsl:variable>

		<xsl:variable name="mt_e">
			<xsl:value-of select="substring-before($matrix5,',')"/>
		</xsl:variable>
		<xsl:variable name="matrix6">
			<xsl:value-of select="substring-after($matrix5, ',')"/>
		</xsl:variable>

		<xsl:variable name="mt_f">
			<xsl:value-of select="substring-before($matrix6,')')"/>
		</xsl:variable>
		
<!--		mt_a<xsl:value-of select="$mt_a"/>...
		mt_b<xsl:value-of select="$mt_b"/>...
		mt_c<xsl:value-of select="$mt_c"/>...
		mt_d<xsl:value-of select="$mt_d"/>...
		mt_e<xsl:value-of select="$mt_e"/>...
		mt_f<xsl:value-of select="$mt_f"/>...
-->
		<xsl:value-of select="$mt_a*$x1+$mt_c*$y1+$mt_e"/>
	</xsl:template>


	<xsl:template name="mult-y">
		<xsl:param name="matrix"/>
		<xsl:param name="x1"/>
		<xsl:param name="y1"/>
		<xsl:variable name="matrix1">
			<xsl:value-of select="substring-after( $matrix, '(')"/>
		</xsl:variable>

		<xsl:variable name="mt_a">
			<xsl:value-of select="substring-before($matrix1, ',')"/>
		</xsl:variable>
		<xsl:variable name="matrix2">
			<xsl:value-of select="substring-after($matrix1, ',')"/>
		</xsl:variable>

		<xsl:variable name="mt_b">
			<xsl:value-of select="substring-before( $matrix2, ',')"/>
		</xsl:variable>
		<xsl:variable name="matrix3">
			<xsl:value-of select="substring-after($matrix2, ',')"/>
		</xsl:variable>

		<xsl:variable name="mt_c">
			<xsl:value-of select="substring-before($matrix3,',')"/>
		</xsl:variable>
		<xsl:variable name="matrix4">
			<xsl:value-of select="substring-after($matrix3, ',')"/>
		</xsl:variable>

		<xsl:variable name="mt_d">
			<xsl:value-of select="substring-before($matrix4,',')"/>
		</xsl:variable>
		<xsl:variable name="matrix5">
			<xsl:value-of select="substring-after($matrix4, ',')"/>
		</xsl:variable>

		<xsl:variable name="mt_e">
			<xsl:value-of select="substring-before($matrix5,',')"/>
		</xsl:variable>
		<xsl:variable name="matrix6">
			<xsl:value-of select="substring-after($matrix5, ',')"/>
		</xsl:variable>

		<xsl:variable name="mt_f">
			<xsl:value-of select="substring-before($matrix6,')')"/>
		</xsl:variable>
		<xsl:value-of select="$mt_b*$x1+$mt_d*$y1+$mt_f"/>
	</xsl:template>


</xsl:stylesheet>
