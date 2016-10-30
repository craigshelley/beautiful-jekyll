---
layout: page
pagetype: project
permalink: /XL3DRender
title: Excel 3D Rendering
subtitle: Draw 3D Wireframe Graphics using a Microsoft Excel VBA Macro
---

[[Image:XL3DRender.png|350px|thumb|right|XL3DRender In Action]]
XL3DRender is an animated 3D wire frame rendering engine for Microsoft Excel. It is written using the VBA macro editor built into Excel, and renders using the spreadsheet cells as a pixel array. By making the cells tiny, turning off the grid and changing their background colour, the spreadsheet can be used for basic 3D rendering.
__TOC__<br clear="all">
## The Idea
The idea came from a 3D cinematic effect I had seen used by a traditional travelling theatre. The effect produced a smooth 3D fly through of a wire frame cathedral and town projected onto the screen from the back. It was quite impressive since everything was very low-tech, no cameras, no projectors, basic lighting etc... They had achieved this using an actual wire frame model and a very bright point light source, possibly a magnesium or lime light. The shadow produced on the screen was a shadow image taken from a view point at the light and looking in the direction of the screen. The fly through effect was achieved by simply moving the wire frame model over the light source. I can't describe how impressive this low-tech effect was, and must have been even more so in the days before the invention of projectors, video cameras and computer graphics.
{|align="center"
|[[Image:XL3DRender-3DProjection.png|XL3DRender 3D Projection]]
|}
In some spare time in the summer of 2002 a work colleague, Christopher Allen was working on the idea of writing a simple game such as Snake to run in Excel. I had previously demonstrated a simple [http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life Life] algorithm, however we ran into difficulties while trying to get interactive user input to work correctly.
While explaining the amazing 3D shadow effect I had seen, we figured that it would theoretically be possible to produce such an image using an Excel spreadsheet. And why not!

## Implementation
By reducing the size of the cells of an Excel spreadsheet to one pixel per cell, and turning the grid lines off, a 2D imaging area can be produced. The background colour of the cells can be changed to change the colour of the pixels.

### Line Drawing Algorithm
In order to draw anything on this plot area, the first step was to write a line drawing function. A fast line drawing algorithm I had previously used in assembly programming was the optimised implementation of [http://en.wikipedia.org/wiki/Bresenham's_line_algorithm Bresenham's Line Algorithm]. The use of this algorithm allowed the production of an excel function that could be given two sets of x,y coordinates, and would draw a line between the two points.

### 3D Projection
The next stage was to do the conversion from 3D coordinates to 2D. This was achieved by considering the geometry of the 3D shadow projection described above. The amount of perspective can be adjusted by moving the view point closer to the object. If the view point is moved so close that it falls inside the object, then a view from inside the object is projected. The distance between the view point and the screen changes the image scaling. Moving the screen closer makes the image smaller, just as you'd expect from shadow projection. One interesting property of this projection method that is not possible to achieve using genuine shadow projection, is the ability to move the screen so close to the object that part of the object lies in the screen, or indeed on the other side of it. There are no side effects of doing this, in fact it has its advantages because the extra flexibility on the scaling removes the need to post-scale the rendered image, thereby improving the rendering performance.
Since the lines between the points are drawn using a 2D line drawing algorithm, the only points to be projected from 3D to 2D are the vertices. This technique provides a significant performance boost over translating every point along the line.

### Animation
The animated fly through was achieved by rotating and offsetting the 3D object. Again, this requires some basic geometry/trigonometry, however only the vertices require rotation and offset. Initially while deriving the formulae for this, an error was made with the sign of the angles. This resulted in a bizarre effect where as shapes were rotated, they fell apart because some vertices were rotating in the opposite directions. This bug took some time to resolve, however once it had been corrected the renderer started to look pretty cool. The only problem at this stage was the amount of time taken to render the shape. Additionally, it wasn't possible to get any sense of animation because as soon as the line by line rendering of a frame was complete, the rendering of the next frame would begin.

### Double Buffering
The problem of observing the image being rendered during the animation can be solved using a technique known as double buffering. This method involves having the next frame rendered on a hidden worksheet and once rendering is complete, the frame is displayed in its entirety. By using two worksheets (a double buffer), it is possible to use the hidden one for rendering, and then switch worksheets once the rendering is complete. This process ensures that the animated effect is preserved, and the viewer does not see any partially rendered images. This also gives a performance increase because the image being rendered is not being continually refreshed to the screen as each pixel is updated. Instead it gets drawn once when the active worksheet is flipped.

## Data Flow
{|align="center"
|[[Image:XL3DRender-dfd.png|XL3DRender Flow Diagram]]
|}
This 3D rendering engine can be summarised with a relatively simple data flow. The data originates from a spreadsheet table, with each row in the table representing a line to be drawn. The line is defined by an X1,Y1,Z1 starting point coordinate, and an X2,Y2,Z2 ending point coordinate.
For each 3D coordinate, the coordinates are first rotated and offset, then projected into 2D, then a line is drawn between the start and end coordinates using the 2D line drawing algorithm. The rotation and offset are determined by arbitrary formulae that produce the rotation angles and offsets, and depends only on the frame number. This formula defines the animated rotation and panning effects. It could equally be replaced with a look-up table on a separate worksheet to give more flexibility over the rendered animation.

## Download
To download XL3DRender, follow the links below. Additional objects can be added by simply pasting them into the spreadsheet. Feel free to experiment, and create 3D shapes of your own.
* [[media:XL3DRender.xls|XL3DRender.xls]] Excel spreadsheet with 3D rendering engine. '''Must be saved before opening in MS Excel'''
* [[media:arrow.txt|arrow.txt]] A 3D arrow head.
* [[media:boxoid.txt|boxoid.txt]] Three intersecting cuboids.
* [[media:crystal.txt|crystal.txt]] A 3D Crystal shape.

## Credits
* Christopher Allen - 3D objects, testing and debugging
* [mailto:craig@microtron.org.uk Craig Shelley] - Rendering algorithm

If you have any questions/queries or have created new objects that you would like to share, just drop me an [mailto:craig@microtron.org.uk email].

## Links
* [http://www.gamasutra.com/view/feature/3563/microsoft_excel_revolutionary_3d_.php http://www.gamasutra.com/view/feature/3563/microsoft_excel_revolutionary_3d_.php] Sorry guys, we have beaten you to it!
* [http://developers.slashdot.org/article.pl?sid=08/03/06/1732220&from=rss http://developers.slashdot.org/article.pl?sid=08/03/06/1732220&from=rss] So that's why this website went down!
