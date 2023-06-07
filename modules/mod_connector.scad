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

module connector_outer()
{
    cylinder(h=connector_length-connector_taperlength, r=connector_od/2);
    translate([0,0,connector_length-connector_taperlength])
      cylinder(h=connector_taperlength,r1=connector_od/2, r2=connector_od/2-connector_taperamount);
}

module connector_inner()
{
    translate([0,0,-0.5])
      cylinder(h=connector_length+1, r=connector_id/2);
}

module connector_pipe()
{
    difference()
    {
        connector_outer();
        connector_inner();
    }
}

module screw_holes()
{
  translate([ screw_separation/2,  screw_separation/2, -thickness/2]) cylinder(r=screw_diameter/2, h=thickness*2);
  translate([ screw_separation/2, -screw_separation/2, -thickness/2]) cylinder(r=screw_diameter/2, h=thickness*2);
  translate([-screw_separation/2,  screw_separation/2, -thickness/2]) cylinder(r=screw_diameter/2, h=thickness*2);
  translate([-screw_separation/2, -screw_separation/2, -thickness/2]) cylinder(r=screw_diameter/2, h=thickness*2);
}

module mount()
{
    difference()
    {
      rounded_box(base_size, base_size, thickness, corner_radius);
        connector_inner();
	screw_holes();
    }
}

module connector()
{
  translate([0,0,thickness]) connector_pipe();
  mount();
}
