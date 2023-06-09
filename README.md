Extractor
=========

![Extractor Fan Enclosure](https://github.com/nistur/extractor/blob/main/screenshots/combined.png?raw=true)

I have an enclosure for my 3D printer, but it still smells, I want to be able to safely vent this outside. I have a bunch of 120mm PC fans around, and a 12V power supply, so I thought I'd quickly make an enclosure to hold this, and connect to an exhaust pipe made from a drain pipe.

The enclosure is being designed to be used with a 120x25mm PC style fan, and a 90mm ID pipe for exhaust. It has space for a carbon filter to be cut and put at the front. All dimensions should be in modifiable in params.scad for other size parts. I have not added a HEPA filter at this point because everything I can find is a specific size for a specific vacuum cleaner etc, and not a simple cut-the-right-size filter sheet like a carbon filter. Assuming this works, I will look for a solution for this.

All models are created in modules/mod_{MODULE}.scad and then are imported into {MODULE}.scad for exporting as STL in the correct orientation. A Makefile is provided for easy export on Linux. To see the extractor built, preview.scad has been provided with the parts in the correct position.

NOTE: This model is incomplete and has not been test printed yet. It is also still final measurement/confirmation on all dimensions.

![Parts](https://github.com/nistur/extractor/blob/main/screenshots/separate.png?raw=true)

To mount this, the intention is to cut/drill a 100mm diameter hole in the enclosure, and then insert threaded inserts into the enclosure (or tap if the enclosure can take machine threads) based on the hole pattern for the fan used, in the case of a 120mm fan, this is 105mm apart. Then a long screw is interted through all parts, sandwiching a carbon filter between the enclosure and the filterguard, with the slightly concave side facing the fan. The screws are then only screwed into the threaded inserts and not into the printed parts, reducing wear on those parts. A suitable exhaust pipe is then fitted over the connector which should be protruding out of the hole.

I have also created an "exhaust" part, which is a matching part that I will be attaching the where it will be finally exhausting outside. This is similar to the "connector" part, but with the opposite type connector (ie it goes over a 90mm pipe rather than inside an end piece) and includes a grille to keep out leaves or whatever happens to be trying to get in.
