<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
		<body>
			<xsl:apply-templates/>
		</body>
	</html>
</xsl:template>

<xsl:template match="collection/recipe">
	<p>
		<span style="color:#ff0000">
			<b>Recipe ID: </b>
			<xsl:value-of select="@id"/>
		</span><br/>
		<xsl:apply-templates select="title"/>
		<xsl:apply-templates select="date"/><br/>
		<b><u>Ingredients:</u></b><br/>
		<xsl:apply-templates select="ingredient"/><br/>
		<xsl:apply-templates select="preparation"/>
		<xsl:if test="string-length(.) &gt; 0">
			<xsl:apply-templates select="comment"/>
		</xsl:if>
		<xsl:apply-templates select="nutrition"/>
		<xsl:if test="string-length(.) &gt; 0">
			<xsl:apply-templates select="related"/>
		</xsl:if>
	</p>
</xsl:template>

<xsl:template match="title">
	<b>Title: </b>
	<u><xsl:value-of select="."/></u>
	<br/>
</xsl:template>

<xsl:template match="date">
	<b>Date: </b>
	<xsl:value-of select="."/><br/>
</xsl:template>

<xsl:template match="ingredient">
	<xsl:if test="string-length(@name) &gt; 0">
	<b><xsl:value-of select="@name"/></b>
	<xsl:if test="string-length(@amount) &gt; 0">
	-
	</xsl:if>
	<xsl:value-of select="@amount"/>
	<xsl:value-of select="@unit "/>
	</xsl:if><br/>
	<xsl:apply-templates select="ingredient"/>
	<xsl:apply-templates select="preparation"/>
</xsl:template>


<xsl:template match="preparation">
	<u>Preparation <xsl:if test="string-length(ancestor::preparation) &gt; 0"> for<xsl:value-of select="ingredient/./preparation/@name"/></xsl:if></u>:
	<dl><xsl:apply-templates select="step"/></dl>
</xsl:template>

<xsl:template match="step">
	<dt><xsl:value-of select="."/></dt>
</xsl:template>

<xsl:template match="comment">
	<u>Comments</u>:
	<xsl:value-of select="."/>
	<br/>
</xsl:template>

<xsl:template match="nutrition">
	<u>Nutrition</u>:
	Calories- <xsl:value-of select="@calories"/>
	Fat- <xsl:value-of select="@fat"/>
	Carbohydrates- <xsl:value-of select="@carbohydrates"/>
	Protein- <xsl:value-of select="@protein"/>
	<br/>
</xsl:template>

<xsl:template match="related">
	<u>Related</u>:
	<xsl:value-of select="."/>
	<br/>
</xsl:template>

</xsl:stylesheet>