<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
        <xsl:import href="xsltmatrixtransform.xsl"/>

<!-- this function, attempts to parse a <path d="..." value, into <line>'s Very tricky karma indeed -->
	<xsl:template name="parse">
		<xsl:param name="dval"/>
		<xsl:param name="x1"/>
		<xsl:param name="y1"/>
		<xsl:param name="style"/>
		<xsl:param name="id"/>
		<xsl:param name="transform"/>

		<xsl:variable name="cmd">
			<xsl:value-of select="substring-before(concat($dval, ' '),' ')"/>
		</xsl:variable>

		<xsl:variable name="dval2">
			<xsl:value-of select="substring-after(concat($dval, ' '),' ')"/>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$cmd = 'M'">
<!--				<xsl:value-of select="$dval2"/> ...
				x1x<xsl:value-of select="substring-before($dval2, ' ')"/> ...
				y1y<xsl:value-of select="substring-before(substring-after(concat($dval2,' '), ' '), ' ')"/> ...
				dval<xsl:value-of select="substring-after(substring-after(concat($dval2,' '), ' '), ' ')"/> ...
-->
				<xsl:call-template name="parse">
					<xsl:with-param name="x1">
<!--						<xsl:value-of select="substring-before($dval2, ',')"/>
-->						<xsl:value-of select="substring-before($dval2, ' ')"/>

					</xsl:with-param>
					<xsl:with-param name="y1">
<!--						<xsl:value-of select="substring-after(substring-before($dval2, ' '), ',')"/>
-->						<xsl:value-of select="substring-before(substring-after(concat($dval2,' '), ' '), ' ')"/>
					</xsl:with-param>
					<xsl:with-param name="dval">
<!--						<xsl:value-of select="substring-after(concat($dval2, ' '), ' ')"/>
-->						<xsl:value-of select="substring-after(substring-after(concat($dval2,' '), ' '), ' ')"/>
					</xsl:with-param>
					<xsl:with-param name="style" select="$style"/>
					<xsl:with-param name="id" select="$id"/>
					<xsl:with-param name="transform" select="$transform"/>


				</xsl:call-template>

			</xsl:when> <!-- end case 'M' -->

			<xsl:when test="$cmd = 'L'">
				<xsl:variable name="x2">
<!--					<xsl:value-of select="substring-before($dval2, ',')"/>
-->					<xsl:value-of select="substring-before($dval2, ' ')"/>
				</xsl:variable>
				<xsl:variable name="y2">
<!--					<xsl:value-of select="substring-after(substring-before($dval2, ' '), ',')"/>
-->					<xsl:value-of select="substring-before(substring-after(concat($dval2,' '), ' '), ' ')"/>					
				</xsl:variable>

				<xsl:variable name="xx1">
					<xsl:call-template name="mult-x">
						<xsl:with-param name="x1">
							<xsl:value-of select="$x1"/>
						</xsl:with-param>
						<xsl:with-param name="y1">
							<xsl:value-of select="$y1"/>
						</xsl:with-param>
						<xsl:with-param name="matrix">
							<xsl:value-of select="$transform"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="yy1">
					<xsl:call-template name="mult-y">
						<xsl:with-param name="x1">
							<xsl:value-of select="$x1"/>
						</xsl:with-param>
						<xsl:with-param name="y1">
							<xsl:value-of select="$y1"/>
						</xsl:with-param>
						<xsl:with-param name="matrix">
							<xsl:value-of select="$transform"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="xx2">
					<xsl:call-template name="mult-x">
						<xsl:with-param name="x1">
							<xsl:value-of select="$x2"/>
						</xsl:with-param>
						<xsl:with-param name="y1">
							<xsl:value-of select="$y2"/>
						</xsl:with-param>
						<xsl:with-param name="matrix">
							<xsl:value-of select="$transform"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="yy2">
					<xsl:call-template name="mult-y">
						<xsl:with-param name="x1">
							<xsl:value-of select="$x2"/>
						</xsl:with-param>
						<xsl:with-param name="y1">
							<xsl:value-of select="$y2"/>
						</xsl:with-param>
						<xsl:with-param name="matrix">
							<xsl:value-of select="$transform"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>

				<line style="{$style}" x1="{$xx1}" y1="{$yy1}" x2="{$xx2}" y2="{$yy2}"/>

				<xsl:variable name="next">
<!--					<xsl:value-of select="substring-after(concat($dval2, ' '), ' ')"/> 
-->
					<xsl:value-of select="substring-after(substring-after(concat($dval2,' '), ' '), ' ')"/>
				</xsl:variable>


				<!-- check for chained lineto's -->
				<xsl:variable name="lineto">
<!--					<xsl:if test="contains(substring-before(concat($next, ' '), ' '), ',')">
-->					<xsl:if test="contains(substring-before(concat($next, ' '), ' '), ' ')">
						<xsl:value-of select="substring-before(concat($next, ' '), ' ')"/>
					</xsl:if>
				</xsl:variable>

				<xsl:variable name="next2">
					<xsl:choose>
						<xsl:when test="$lineto">
<!--							<xsl:value-of select="concat('L ', $next)"/> -->
							<xsl:value-of select="$next"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$next"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:if test="$next2">
					<xsl:call-template name="parse">
						<xsl:with-param name="x1" select="$x2"/>
						<xsl:with-param name="y1" select="$y2"/>
						<xsl:with-param name="style" select="$style"/>
						<xsl:with-param name="id" select="$id"/>
						<xsl:with-param name="transform" select="$transform"/>

						<xsl:with-param name="dval" select="$next2"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>  <!-- end case 'L' -->

			<xsl:when test="$cmd = 'Z'">
			</xsl:when>

			<xsl:when test="$cmd">
			</xsl:when>

		</xsl:choose>
	</xsl:template>
<!-- end <path d="... parseing function -->

</xsl:stylesheet>
