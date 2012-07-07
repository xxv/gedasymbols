<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <xsl:for-each select="tree/directory">
    <xsl:variable name="current-dir" select="attribute::name"/>
    <table border="1">
      <caption><xsl:value-of select="attribute::name"/></caption>
    <xsl:for-each select="file">
      <tr>
        <td>
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="$current-dir"/>/<xsl:value-of select="attribute::name"/>
            </xsl:attribute>
            <xsl:value-of select="attribute::name"/>
          </a>
        </td>
      </tr>
    </xsl:for-each>
    </table>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet> 
