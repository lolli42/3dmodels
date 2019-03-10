baseMaterialZ = 1.6; // Basic material thickness. This is the smallest thickness at the switch
insetZ = 1.2; // Inset thickness added to base thickness so switch can't fall out
switchZ = 6.6; // Thickness of switch

switchX = 10.6; // Width of the switch
latchX = 20; // Width of the part the filament runs through

switchY = 20.2; // Height of the switch
screwLatchY = 8; // Height of the part that holds the screws (two of them, one above, one below switch)

screwHoleRadius = 1.55; // 3.1mm diameter -> M3

// Absolute dimension vars of the whole thing
feederswitchX = 2*baseMaterialZ + switchX + latchX;
feederswitchY = screwLatchY + switchY + screwLatchY;
feederswitchZ = 2*baseMaterialZ + switchZ; // Full thickness is 2 parts

// Simple 3 side prism
module prism(x, y, z) {
   polyhedron(
       points=[[0,0,0], [x,0,0], [x,y,0], [0,y,0], [0,y,z], [x,y,z]],
       faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
   );
}

difference() {
    // Base material is a cube, everything else is substracted from it
    cube([
        feederswitchX,
        feederswitchY,
        feederswitchZ/2
    ]);

    // Cut out space for the switch itself
    translate([
        2*baseMaterialZ,
        screwLatchY,
        baseMaterialZ
    ]) cube([
        switchX,
        switchY,
        switchZ/2
    ]);

    // Cut out space for pin-part of switch
    translate([
        0,
        screwLatchY,
        baseMaterialZ + insetZ
    ]) cube([
        2*baseMaterialZ,
        switchY,
        switchZ/2 - insetZ
    ]);

    // Cut out space for filament
    translate([
        2*baseMaterialZ + switchX,
        0,
        baseMaterialZ + insetZ,
    ]) cube([
        latchX,
        screwLatchY + switchY + screwLatchY,
        switchZ/2 - insetZ
    ]);

    // Cut out a 22.5 degrees slope (prism) at end of filament latch
    translate([
        feederswitchX - 2*(baseMaterialZ + insetZ),
        0,
        baseMaterialZ + insetZ
    ]) rotate([
        180,
        0,
        90
    ]) prism(
        feederswitchY,
        2*(baseMaterialZ + insetZ),
        baseMaterialZ + insetZ
    );

    // Cut out edge near screw holes for additional possible corners of filament flow, lower one
    translate([
        2*baseMaterialZ + switchX - screwLatchY/2,
        0,
        baseMaterialZ + insetZ
    ]) rotate([
        0,
        -90,
        -90
    ]) prism(
        switchZ/2 - insetZ,
        screwLatchY/2,
        screwLatchY
    );

    // Cut out edge near screw holes for additional possible corners of filament flow, upper one
    translate([
        2*baseMaterialZ + switchX - screwLatchY/2,
        switchY + 2*screwLatchY,
        baseMaterialZ + switchZ/2
    ]) rotate([
        90,
        90,
        0
    ]) prism(
        switchZ/2 - insetZ,
        screwLatchY/2,
        screwLatchY
    );

    // Cut out lower screw hole
    translate([
        (2*baseMaterialZ + switchX)/2,
        screwLatchY/2,
        0
    ]) cylinder(
        h=feederswitchZ/2,
        r=screwHoleRadius,
        $fn=64
    );

    // Cut out upper screw hole
    translate([
        (2*baseMaterialZ + switchX)/2,
        screwLatchY + switchY + screwLatchY/2,
        0
    ]) cylinder(
        h=feederswitchZ/2,
        r=screwHoleRadius,
        $fn=64
    );
}
