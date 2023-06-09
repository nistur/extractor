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

include<../params.scad>
include<../lib/utils.scad>

enclosure_thickness=thickness*2 + fan_thickness + filter_thickness;
module en_base()
{
    // Base shape for the enclosure, a hollow rounded box
    difference()
    {
	rounded_box(fan_size+((padding+thickness)*2), fan_size+((padding+thickness)*2), enclosure_thickness, corner_radius+thickness/2);
	translate([0,0,-1]) rounded_box(fan_size+(padding*2), fan_size+(padding*2), enclosure_thickness-thickness+1, corner_radius);
    }
}

module en_grille()
{
    // hex grille on the front of the enclosure
    translate([0, 0, enclosure_thickness-thickness*1.5])
    intersection()
    { 
	hex_grid(hex_size, hex_spacing, 3 + fan_size / (hex_size + hex_spacing), 1+fan_size / (hex_size + hex_spacing), thickness * 2);
	translate([0,0,-thickness/2]) cylinder(r=fan_size/2, h=thickness * 3);
    }
}

module en_screwposts()
{
    // A thick cylinder in each corner which the screws go through - also used for sandwiching the fan in place
    translate([ screw_separation/2, -screw_separation/2, fan_thickness + filter_thickness + thickness]) rotate([180,0,0])cylinder(r=screwpost_diameter/2, h=filter_thickness);
    translate([ screw_separation/2,  screw_separation/2, fan_thickness + filter_thickness + thickness]) rotate([180,0,0])cylinder(r=screwpost_diameter/2, h=filter_thickness);
    translate([-screw_separation/2, -screw_separation/2, fan_thickness + filter_thickness + thickness]) rotate([180,0,0])cylinder(r=screwpost_diameter/2, h=filter_thickness);
    translate([-screw_separation/2,  screw_separation/2, fan_thickness + filter_thickness + thickness]) rotate([180,0,0])cylinder(r=screwpost_diameter/2, h=filter_thickness);
}

module _en_fanguide()
{
    // These are rails that go along the side of the enclosure. They should leave a space of `fan-size` in between them
    // (plus clearance) allowing for the fan to be easily slid into place accurately. They also will help locate the filter
    // guard piece in a similar way
    translate([fan_size/4 - thickness/2,fan_size/2+clearance,thickness]) cube([thickness,padding - clearance,fan_thickness + filter_thickness]);
    translate([-fan_size/4 + thickness/2,fan_size/2+clearance,thickness]) cube([thickness,padding - clearance,fan_thickness + filter_thickness]);
}

module en_fanguide()
{
    union()
    {
	// create one pair of guide rails, then rotate them
	rotate([0,0,  0]) _en_fanguide();
	rotate([0,0, 90]) _en_fanguide();
	rotate([0,0,180]) _en_fanguide();
	rotate([0,0,270]) _en_fanguide();
    }
}

module en_screw()
{
    // A long cylinder for the shaft, and a shorter one for the head
    cylinder(r=screw_diameter/2, h=enclosure_thickness+1);
    translate([0,0,enclosure_thickness+0.5-screwhead_depth]) cylinder(r=screwhead_diameter/2, h=screwhead_depth+0.5);
}

module en_screwholes()
{
    // 4 screws, one at each corner of the fan
    translate([-screw_separation/2, -screw_separation/2, -0.5]) en_screw();
    translate([-screw_separation/2,  screw_separation/2, -0.5]) en_screw();
    translate([ screw_separation/2, -screw_separation/2, -0.5]) en_screw();
    translate([ screw_separation/2,  screw_separation/2, -0.5]) en_screw();
}

module en_cable_cutout()
{
    // This is a simple cutout on one side, Basically an arch shape made by a circular cutout, with its edges joined
    // to the edge, like an elongated D. If I had some grommets, I might make it fit one of those.
    translate([0,fan_size/2 + padding + thickness*1.5,cablecutout_diameter/2])
    {
	rotate([90,0,0]) cylinder(r=cablecutout_diameter/2,h=thickness*2);
	translate([-cablecutout_diameter/2,-thickness*2,-(1+cablecutout_diameter/2)]) cube([cablecutout_diameter, thickness*2, cablecutout_diameter/2+1]);
    }
    
}

module enclosure()
{
    difference()
    {
	union()
	{
	    // The basic shape of the enclosure - a hollow rounded box
	    en_base();
	    // The screwposts that hold the enclosure together
	    en_screwposts();
	    // Some guide rails on the side which guide the filter guard and fan
	    en_fanguide();
	}
	// Cut out the hex grille from the front
	en_grille();
	// Cut out the screw holes to hold everything together
	en_screwholes();
	// Cut out a space for the wires to come out
	en_cable_cutout();
    }
}
