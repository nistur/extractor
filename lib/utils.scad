module __box_cross(x, y, z, r)
{
    translate([-x/2, -((y/2)-r), 0]) cube([x, y-(2*r), z]);
    translate([-((x/2)-r), -y/2, 0]) cube([x-(2*r), y, z]);
}

module __box_corners(x, y, z, r)
{
    translate([((x/2)-r), ((y/2)-r), 0])cylinder(h=z, r=r);
    translate([((x/2)-r), -((y/2)-r), 0])cylinder(h=z, r=r);
    translate([-((x/2)-r), ((y/2)-r), 0])cylinder(h=z, r=r);
    translate([-((x/2)-r), -((y/2)-r), 0])cylinder(h=z, r=r);
}

module rounded_box(x, y, z, r)
{
    union()
    {
        __box_cross(x, y, z, r);
        __box_corners(x, y, z, r);
    }
}


module hex_grid(s, gap, nx, ny, thickness)
{
  cos30= cos(30);
  translate([-(nx*(s+gap)*cos30)/2,-(s+gap)/2*ny,0])
  for(j = [0 : nx])
    for(i = [0 : ny])
      {
	offs = (j % 2) * ((s + gap)/2);
	translate([j*(s+gap)*cos30, offs + i*(s+gap), 0])
	  cylinder(r=s/2, h=thickness, $fn=6);
      }
}
