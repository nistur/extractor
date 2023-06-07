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

fan_size=120;
fan_thickness=25;
filter_thickness=5;
padding=5;
corner_radius=5;
thickness=2.5;
connector_id=85;
connector_od=90;
connector_length=80;
connector_taperlength=10;
connector_taperamount=5;
screw_diameter=4.3;
screw_separation=105;
screwpost_diameter=10;
screwhead_diameter=6;
screwhead_depth=4;
hex_size=10;
hex_spacing=1;

cablecutout_diameter=10;

clearance=0.1;

$fn = $preview ? 60 : 360;

// size is:
// + size of the fan
// + some padding around the outside for routing cables
// - Some clearance to let the enclosure fit on top
base_size=fan_size+(padding*2)-(clearance*2);
