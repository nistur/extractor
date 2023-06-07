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

module inner_screw_holes()
{
  d = screwpost_diameter + (clearance*2);
  translate([ screw_separation/2,  screw_separation/2, -thickness/2]) cylinder(r=d/2, h=thickness*2);
  translate([ screw_separation/2, -screw_separation/2, -thickness/2]) cylinder(r=d/2, h=thickness*2);
  translate([-screw_separation/2,  screw_separation/2, -thickness/2]) cylinder(r=d/2, h=thickness*2);
  translate([-screw_separation/2, -screw_separation/2, -thickness/2]) cylinder(r=d/2, h=thickness*2);
}


module inner_grille()
{
  translate([0, 0, -thickness/2])
    intersection()
    { 
	hex_grid(hex_size, hex_spacing,3 +  fan_size / (hex_size + hex_spacing), 1+fan_size / (hex_size + hex_spacing), thickness * 2);
      translate([0,0,-thickness/2]) cylinder(r=fan_size/2, h=thickness * 3);
    }
}

module __guide()
{
    translate([fan_size/4 - thickness/2 - clearance,fan_size/2,-thickness/2]) cube([thickness + (2*clearance),padding,thickness * 2]);
    translate([-fan_size/4 + thickness/2 - clearance,fan_size/2,-thickness/2]) cube([thickness + (2*clearance),padding,thickness * 2]);
}

module guide()
{
    union()
    {
	rotate([0,0,  0]) __guide();
	rotate([0,0, 90]) __guide();
	rotate([0,0,180]) __guide();
	rotate([0,0,270]) __guide();
    }
}

module filterguard()
{
  squish = 0.04;
  difference()
  {
    rounded_box(base_size, base_size, thickness, corner_radius);
    inner_screw_holes();
    inner_grille();
    translate([0,0,thickness/2-(fan_size*squish)/2]) scale([1, 1, squish]) sphere(r=fan_size/2);
    guide();
  }

}
