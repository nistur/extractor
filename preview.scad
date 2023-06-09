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

include <modules/mod_enclosure.scad>
include <modules/mod_connector.scad>
include <modules/mod_fan.scad>
include <modules/mod_filterguard.scad>
include <modules/mod_exhaust.scad>

col_1=[0.882, 0.118, 0.796];
col_2=[0.118, 0.796, 0.882];
col_3=[0.796, 0.882, 0.118];

// Enclosure holding the extractor fan
color(col_3)
enclosure();

// Mount connecting the exhaust pipe, to the extractor fan and enclosure
color(col_2)
translate([0,0,thickness]) rotate([0,180,0]) connector();

// Guard to hold the carbon filter in the enclosure and away from
// the fan blades
color(col_1)
translate([0,0,thickness + fan_thickness]) filterguard();

// Separate exhaust mount - this will connect the pipe to the outside
translate([fan_size * 2, 0, -connector_length]) exhaust();


// Placeholder to see that the fan fits in enclosure
//translate([0,0,thickness]) fan();
