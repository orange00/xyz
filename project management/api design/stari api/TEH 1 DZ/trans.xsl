<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/category">
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous"/>
</head>
<body>
	<b>Kategorija: </b><span><xsl:value-of select="/category/@title"/></span>
	<xsl:apply-templates select="subcategories"/>
	<xsl:apply-templates select="contents"/>
</body>
</html>
</xsl:template>

<xsl:template match="subcategories">
	<b>Podkategorije: </b>
	<span>
		<xsl:for-each select="category">
			<xsl:value-of select="@id"/> |
		</xsl:for-each>
	</span>
</xsl:template>

<xsl:template match="contents">
	<b>Sadržaji: </b>
	<table class="table">
		<tr>
			<th>id</th>
			<th>Autor</th>
			<th>Regija</th>
			<th>Multimedija</th>
		</tr>
		
	<xsl:for-each select="content">
		<tr>
			<td>
				<xsl:value-of select="@id"/>
			</td>
			<td>
				<xsl:value-of select="author"/>
			</td>
			<td>
				<xsl:value-of select="region"/>
			</td>
			<td>
				<xsl:for-each select="multimedias/multimedia">
					<div class="row">
						<div class="col-md-12">
							<p class="font-weight-bold">
								<xsl:value-of select="title"/>
							</p>
							<p class="font-italic">
								<xsl:value-of select="description"/>
							</p>
							<p>
								<xsl:value-of select="text"/>
							</p>
							<xsl:if test="image">
								<img alt="image">
									<xsl:attribute name="src">
										<xsl:value-of select="image"/>
									</xsl:attribute>
								</img><br></br>
							</xsl:if>
							<xsl:if test="audio">
								<audio controls="true">
									<source type="audio/mp3">
										<xsl:attribute name="src">
											<xsl:value-of select="audio"/>
										</xsl:attribute>								
									</source>
								</audio><br></br>
							</xsl:if>
							<xsl:if test="video">
								<b>Video: </b><a> 
									<xsl:attribute name="href">
										<xsl:value-of select="video"/>
									</xsl:attribute>
									
									Video
								</a><br></br>
							</xsl:if>
							<xsl:if test="link">
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="link"/>
									</xsl:attribute>
									Link
								</a><br></br><br></br>
							</xsl:if>
						</div>
					</div>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:for-each>
	</table>
</xsl:template>

</xsl:stylesheet> 