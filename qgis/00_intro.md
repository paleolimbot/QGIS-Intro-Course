---
title:  Introduction to GIS
summary: "This is the first post in the series."
series: "Introduction to GIS"
weight: 1.0
last_updated: January 15, 2016
---

Welcome to the QGIS Intro course! I assume for some reason or another you've heard about QGIS or GIS and would like to know a little bit more - in the past this course has been taught to those with existing GIS background who would like to know more, and for those with no GIS background who would like to gain a basic understanding of GIS and how it's used. This tutorial serves as a bit of both: by no means do I claim to make anybody an expert in GIS, nor can I claim to unlock all the secrets of QGIS, but I can offer an overview of what GIS is and how to use it on a day-to-day basis.

A little bit about myself - I have an M.Sc. in Geology, which I received after two years of work in the environmental consulting industry following an undergraduate degree at Acadia University. My background in GIS is a very applied and pragmatic one - not one based in a degree in GIS. Because of this you'll find this course is just that: applied and pragmatic. I've used GIS in projects in my undergrad, masters, and in industry to save time and create effective visual representations of data I collected.

### What is Geographic Information?

GIS stands for a number of things, but they all start with Geographic Information (Systems is the most common suffix). So what is it? Just about everything has some location associated with it...let's take my cat as an example. Location information associated with him could be where he is right now, where he was this morning, where he was born, or where he caught his last bird. Another example might be a car, which, in addition to having a list of attributes (make, model, colour) also has relevant location information (where it's been, where it is now).

Just because you *can* put something on a map, it doesn't mean you *should*. I doubt anybody cares where my cat has been and nobody would waste time making a map of involving my truck. So instead of some fancy definition of Geographic Information, the one we're going to use is this: Geographic Information is any information you *can* put on a map and *want* to. When I collect samples, each one of them has a location and that location is important. Where those samples are in relation to eachother and in relation to roads and streams and lakes are all essential in interpreting the data I obtain from them. That is the kind of geographic information we will be using in this tutorial.

### GIS Applications

There are a number of applications for your computer that can plot data on the earth's surface. Google Maps is a good example of one, although its utility is limited to where to find various stores and driving directions. Google Earth is a little more flexible, letting you customize how the data you plot looks and loads and exports data in a variety of formats (the professional version does this especially well, but costs a few hundred dollars per year). The most famous of the GIS software family is ESRI's ArcGIS, which sells for thousands of dollars (although academic licenses are cheaper), and MapInfo is priced similarly.

For this tutorial, we will be using QGIS. QGIS is an open-source GIS that costs nothing to download, and works on Mac, Windows, and Linux. It builds on other free GIS software such as GRASS and [Saga GIS](http://www.saga-gis.org/), and has become an incredibly powerful GIS, rivaling ARC and MapInfo in terms of functionality. Of course, "free" software isn't actually free, and I encourage you all to donate to the QGIS project to keep open source GIS alive and well.