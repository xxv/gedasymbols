<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:xlink="http://www.w3.org/1999/xlink"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
>

	<xsl:output method="text" />
	<xsl:strip-space elements="*"/> 

	<xsl:template match="svg:svg"> 
	<xsl:variable name="text_x">
		<xsl:call-template name="cssunitconvert">
			<xsl:with-param name="inval">
				<xsl:value-of select="./svg:text[@id='refdes']/@x"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="text_y">
		<xsl:call-template name="cssunitconvert">
			<xsl:with-param name="inval">
				<xsl:value-of select="./svg:text[@id='refdes']/@y"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
Element[ "" "<xsl:value-of select="@sodipodi:docname"/>" "" "<xsl:value-of select="./svg:text[@id='refdes']"/>" 1000 1000 <xsl:value-of select="$text_x"/><xsl:value-of select="$text_y"/>0 100 "" ]
(
		<xsl:apply-templates/>
)
	</xsl:template>

	<xsl:template match="svg:g">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="*" priority="-1"/>		



	<xsl:template match="svg:use">
	<xsl:variable name="ref1">
		<xsl:value-of select="translate(@xlink:href,'#','')"/>
	</xsl:variable>
	<xsl:variable name="off_x">
		<xsl:call-template name="cssunitconvert"><xsl:with-param name="inval">
				<xsl:value-of select="@x"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="off_y">
		<xsl:call-template name="cssunitconvert"><xsl:with-param name="inval">
				<xsl:value-of select="@y"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="pad_width">
		<xsl:call-template name="cssunitconvert"><xsl:with-param name="inval">
		<xsl:value-of select="//svg:rect[@id=$ref1]/@width"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="pad_height">
		<xsl:call-template name="cssunitconvert"><xsl:with-param name="inval">
		<xsl:value-of select="//svg:rect[@id=$ref1]/@height"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="clearance">
		<xsl:value-of select="floor( (400))"/><xsl:text> </xsl:text>
	</xsl:variable>
	<xsl:if test="$pad_width > $pad_height">
		<xsl:variable name="line_width"><xsl:value-of select="$pad_height"/></xsl:variable>
		<xsl:variable name="x1">
			<xsl:value-of select="floor( ($off_x - (($pad_width - $line_width) div 2)))"/><xsl:text> </xsl:text>
		</xsl:variable>
		<xsl:variable name="y1">
			<xsl:value-of select="floor( ($off_y))"/><xsl:text> </xsl:text>
		</xsl:variable>
		<xsl:variable name="x2">
			<xsl:value-of select="floor( ($off_x + (($pad_width - $line_width) div 2)))"/><xsl:text> </xsl:text>
		</xsl:variable>
		<xsl:variable name="y2">
			<xsl:value-of select="floor( ($off_y))"/><xsl:text> </xsl:text>
		</xsl:variable>
		<xsl:variable name="mask">
			<xsl:value-of select="floor( $line_width + (400))"/><xsl:text> </xsl:text>
		</xsl:variable>
	Pad[<xsl:value-of select="$x1"/><xsl:value-of select="$y1"/><xsl:value-of select="$x2"/><xsl:value-of select="$y2"/><xsl:value-of select="$line_width"/><xsl:value-of select="$clearance"/><xsl:value-of select="$mask"/>
	</xsl:if>
	<xsl:if test="$pad_height >= $pad_width">
		<xsl:variable name="line_width"><xsl:value-of select="$pad_width"/></xsl:variable>
		<xsl:variable name="x1">
			<xsl:value-of select="floor($off_x) "/><xsl:text> </xsl:text>
		</xsl:variable>
		<xsl:variable name="y1">
			<xsl:value-of select="floor( $off_y + (($pad_height - $line_width) div 2))"/><xsl:text> </xsl:text>
		</xsl:variable>
		<xsl:variable name="x2">
			<xsl:value-of select="floor($off_x )"/><xsl:text> </xsl:text>
		</xsl:variable>
		<xsl:variable name="y2">
			<xsl:value-of select="floor( ($off_y) - (($pad_height - $line_width) div 2) )"/><xsl:text> </xsl:text>
		</xsl:variable>
		<xsl:variable name="mask">
			<xsl:value-of select="floor( $line_width + (400))"/><xsl:text> </xsl:text>
		</xsl:variable>
	Pad[<xsl:value-of select="$x1"/><xsl:value-of select="$y1"/><xsl:value-of select="$x2"/><xsl:value-of select="$y2"/><xsl:value-of select="$line_width"/><xsl:value-of select="$clearance"/><xsl:value-of select="$mask"/>
	</xsl:if>
	
	<xsl:variable name="pad_num">
		<xsl:value-of select="@id"/>
	</xsl:variable>
	<xsl:variable name="flags">"square"</xsl:variable>"<xsl:value-of select="$pad_num"/>" "<xsl:value-of select="$pad_num"/>" <xsl:value-of select="$flags"/>]
<xsl:apply-templates/>

	</xsl:template>




	<xsl:template match="svg:rect">
		<xsl:apply-templates/>
	</xsl:template>


	<xsl:template match="svg:defs">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template name="cssunitconvert">
		<xsl:param name="inval"/>
		<xsl:variable name="vnumsOnly" select="translate($inval, translate($inval,'.0123456789-',''), '')"/>
<!--v<xsl:value-of select="$vnumsOnly"/>v-->

		<xsl:choose>
			<xsl:when test="contains($inval,'mm')">
				<xsl:value-of select="floor(3937.00787 * ($vnumsOnly) )"/> 
			</xsl:when>
			<xsl:when test="contains($inval,'in')">
				<xsl:value-of select="floor(100000 * ($vnumsOnly) )"/> 
			</xsl:when>
			<xsl:when test="contains($inval,'mils')">
				<xsl:value-of select="floor(100 * ($vnumsOnly) )"/> 
			</xsl:when>
			<xsl:when test="contains($inval,'mil')">
				<xsl:value-of select="floor(100 * ($vnumsOnly) )"/> 
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="floor(100 * ($vnumsOnly) )"/> 
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
	</xsl:template>


	<xsl:template match="*[local-name()='line']"> 
	<xsl:variable name="x1">
		<xsl:call-template name="cssunitconvert"><xsl:with-param name="inval">
		<xsl:value-of select="@x1"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="y1">
		<xsl:call-template name="cssunitconvert"><xsl:with-param name="inval">
		<xsl:value-of select="@y1"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="x2">
		<xsl:call-template name="cssunitconvert"><xsl:with-param name="inval">
		<xsl:value-of select="@x2"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="y2">
		<xsl:call-template name="cssunitconvert"><xsl:with-param name="inval">
		<xsl:value-of select="@y2"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="w1">
		<xsl:value-of select="substring-after(ancestor-or-self::*/@style,'stroke-width:')"/>;
	</xsl:variable>
	<xsl:variable name="width">
	<xsl:call-template name="cssunitconvert"><xsl:with-param name="inval">
			<xsl:value-of select="substring-before($w1,';')"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	ElementLine[ <xsl:value-of select="$x1"/><xsl:value-of select="$y1"/><xsl:value-of select="$x2"/><xsl:value-of select="$y2"/><xsl:value-of select="$width"/>]

</xsl:template>

</xsl:stylesheet>
