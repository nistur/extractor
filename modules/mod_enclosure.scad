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
module enclosure_base()
{
  difference()
  {
    rounded_box(fan_size+((padding+thickness)*2), fan_size+((padding+thickness)*2), enclosure_thickness, corner_radius+thickness/2);
      translate([0,0,-1]) rounded_box(fan_size+(padding*2), fan_size+(padding*2), enclosure_thickness-thickness+1, corner_radius);
  }
}

module grille()
{
  translate([0, 0, enclosure_thickness-thickness*1.5])
    intersection()
    { 
      hex_grid(10, 2, 20, 20, thickness * 2);
      translate([0,0,-thickness/2]) cylinder(r=fan_size/2, h=thickness * 3);
    }
}

module screwposts()
{
  translate([ screw_separation/2, -screw_separation/2, fan_thickness + filter_thickness + thickness]) rotate([180,0,0])cylinder(r=screwpost_diameter/2, h=filter_thickness);
  translate([ screw_separation/2,  screw_separation/2, fan_thickness + filter_thickness + thickness]) rotate([180,0,0])cylinder(r=screwpost_diameter/2, h=filter_thickness);
  translate([-screw_separation/2, -screw_separation/2, fan_thickness + filter_thickness + thickness]) rotate([180,0,0])cylinder(r=screwpost_diameter/2, h=filter_thickness);
  translate([-screw_separation/2,  screw_separation/2, fan_thickness + filter_thickness + thickness]) rotate([180,0,0])cylinder(r=screwpost_diameter/2, h=filter_thickness);
}

module screwholes()
{
  translate([-screw_separation/2, -screw_separation/2, -0.5]) cylinder(r=screw_diameter/2, h=enclosure_thickness+1);
  translate([-screw_separation/2,  screw_separation/2, -0.5]) cylinder(r=screw_diameter/2, h=enclosure_thickness+1);
  translate([ screw_separation/2, -screw_separation/2, -0.5]) cylinder(r=screw_diameter/2, h=enclosure_thickness+1);
  translate([ screw_separation/2,  screw_separation/2, -0.5]) cylinder(r=screw_diameter/2, h=enclosure_thickness+1);
}

module enclosure()
{
  difference()
  {
    union()
    {
      enclosure_base();
      screwposts();
    }
    grille();
    screwholes();
  }
}
