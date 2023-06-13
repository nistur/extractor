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

include <../params.scad>
include <../lib/utils.scad>

module co_outer()
{
    rad=(connector_od/2) - clearance;
    // The connector pipe
    cylinder(h=connector_length-connector_taperlength, r=rad);
    // Add a chamfer on the end to allow easy fitting
    translate([0,0,connector_length-connector_taperlength])
      cylinder(h=connector_taperlength,r1=rad, r2=connector_od/2-connector_taperamount);
}

module co_inner()
{
    translate([0,0,-0.5])
      cylinder(h=connector_length+1, r=connector_id/2);
}

module co_pipe()
{
    difference()
    {
	// The outside of the connector pipe
	co_outer();
	// Cut out the inside of the pipe
        co_inner();
    }
}

module co_screwholes()
{
    // 4 Mounting screws - follows the same pattern as the fan that will be mounted
    translate([ screw_separation/2,  screw_separation/2, -thickness/2]) cylinder(r=screw_diameter/2, h=thickness*2);
    translate([ screw_separation/2, -screw_separation/2, -thickness/2]) cylinder(r=screw_diameter/2, h=thickness*2);
    translate([-screw_separation/2,  screw_separation/2, -thickness/2]) cylinder(r=screw_diameter/2, h=thickness*2);
    translate([-screw_separation/2, -screw_separation/2, -thickness/2]) cylinder(r=screw_diameter/2, h=thickness*2);
}

module co_mount()
{
    difference()
    {
	// The base shape - a simple rounded box
	rounded_box(base_size-(clearance*2), base_size-(clearance*2), thickness, corner_radius);
	// Cut the air passage through the base
        co_inner();
	// Cut out the screwholes
	co_screwholes();
    }
}

module connector()
{
    // The connector pipe - this will go inside a connecting exhaust pipe
    translate([0,0,thickness]) co_pipe();
    // The mounting plate which attaches the extractor fan
    co_mount();
}
