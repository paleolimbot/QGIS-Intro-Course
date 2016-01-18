---
title:  Layers and Geographic Data
summary: "This is the first post in the series."
series: "Introduction to GIS"
weight: 2.0
last_updated: January 15, 2016
---

Now that we've established we'd like to put some geographic information on a map, we're going to have to go over a little bit about how it's stored, and the terminology we use to refer to it.

### Layers

Let's start with **layers**. A **layer** is a group of related geographic information that is displayed in a similar way. Think of a layer for roads, a layer for lakes, and a layer for buildings. Each contains related information that is displayed similarly (each building looks the same on a map, as does each lake, and each road, such that you can tell what each item on the map represents). Underneath all of that you might have an aerial photograph as another layer. There are two types of layers we will be using in QGIS: **vector layers** and **raster layers**.

### Vector Layers

Vector layers contain a certain number of **features**, each of which contains **geometry** (location information) and **attribute** data (attributes are also referred to as **fields**). The **geometry** is the location information, which is either a **point**, a **line** or a **polygon**. **Attribute** data is any additional data about a feature other than its location such as its name, its elevation, its colour, etc. We can look at this information in a layer's **attribute table** just as we can look at the position of a feature on a map. Every vector layer has **points** OR **lines** OR **polygons** (i.e. every **feature** in the layer must be of the same type).

### Raster Layers

Raster layers are a different approach to storing geographic data. Instead of storing location as a point, line, or polygon, raster layers lay a grid over a given area and fill every cell of the grid with a value. This value can represent color (aerial photography is a commonly used raster layer; one color for each cell of the grid, in this case a pixel), elevation, or some other parameter that is applicable for all points within the grid. Digital Elevation Models (DEMs) are common examples of raster layers.

### Examples

* Soil conductivity (Points, Contours, Raster)
* Water table depth (Points, Contours, Raster)
* Sample locations (Points)
* Strike & dip (Points, Contours)
* Slope steepness & direction of slope (Points, Contours, Raster)
* Roads (Lines, Polygons)
* Habitat suitability (Polygons, Raster)
* Bedrock type (Polygons)
