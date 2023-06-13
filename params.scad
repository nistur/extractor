/*
 * Copyright (c) 2023 Philipp Geyer
 *
 * This software is provided 'as-is', without any express or implied warranty. In no
 * event will the authors be held liable for any damages arising from the use of this
 * software.
 *
 * Permission is granted to anyone to use this software for any purpose, including
 * commercial applications, and to alter it and redistribute it freely, subject to the
 * following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not claim
 *    that you wrote the original software. If you use this software in a product,
 *    an acknowledgment in the product documentation would be appreciated
 *    but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 * Philipp Geyer
 * nistur@gmail.com
 */

// Size of the fan - This is the outside dimentions, and assumes a square. For a standard PC fan,
// this is correct at 120mm
fan_size=120;

// Thickness of the fan. This is dependant on the make and model fan you have. Could be 25mm, 38mm etc
fan_thickness=25;

// Thickness of the carbon filter - this is currently including one `thickness` below to account for the
// guard piece. I didn't want to split this up, as I was considering the guard and the filter as one unit
filter_thickness=5;

// Space around the fan for routing wires etc
padding=5;

// How curvy do we want this. 5mm gives a nice look
corner_radius=5;

// Thickness of the walls of the enclosure.
thickness=2.5;

// Inside diameter of the connector - this is not critical as it doesn't interface with anything (yet) however does
// implicitly define the outer diameter of the exhaust sleeve, which keeps the same wall thickness as the connector.
// Note: Should this be entirely derived from `thickness`? It would currently work out to be the same, but originally
// kept separate so that I could make the connector wall thicker if I needed more strength.
connector_id=85;

// Outside diameter of the connector - This is important as it interfaces with the inside of the pipe
connector_od=90;

// Length of the connector - how much is able to fit inside the exhaust pipe
connector_length=80;

// How long a taper we want to put on the top of the connector, to allow for easier fitting
connector_taperlength=10;

// How much the taper should cut in by
connector_taperamount=5;

// Length of the exhaust pipe. Mirrors `connector_length` above but kept separate as it is probably
// desirable to be different
exhaust_length=50;

// Diameter of screws used to mount this. I wanted to use M4, but added a bit of extra space, as I didn't want it to
// thread into the plastic at all, and wanted some wiggle room for my inevitably bad threaded insert mounting.
screw_diameter=4.3;

// Separation of screws - this is defined on the fan size, it assumes a square screw pattern. For 120mm fans, 105mm
// is standardised
screw_separation=105;

// diameter of screw posts - these hold the fan in, and guide the filter guard
screwpost_diameter=10;

// diameter of the screw heads. I'm using 7mm cap heads, so adding a bit extra space
screwhead_diameter=7.2;

// Depth of cutout for the screw heads. If using non-cap heads, can have shallower holes
screwhead_depth=4;

// Size of hexes in the grilles
hex_size=10;

// Space between hexes in the grilled
hex_spacing=1;

// Size of cutout on one side to allow for cables
cablecutout_diameter=10;

// Clearance between plastic-plastic parts. Things like screws do not respect this, as it may be desirable to
// tweak their fit manually
clearance=0.2;

$fn = $preview ? 60 : 360;

// size is:
// + size of the fan
// + some padding around the outside for routing cables
// - Some clearance to let the enclosure fit on top
base_size=fan_size+(padding*2)-(clearance*2);
