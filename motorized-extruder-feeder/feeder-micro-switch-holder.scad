include <../primitives/prism.scad>;
include <variables.scad>;

// A model the micro switch for "need more filament" is embedded in
// The model is one half, two are used
module feederMicroSwitchHolder() {
    difference() {
        // Base material is a cube, everything else is substracted from it
        cube([
            switchHolderX,
            switchHolderY,
            switchHolderZ/2 // We're modelling one half of the thing, whole thing is 2 printed parts
        ]);

        // Cut out space for the switch itself
        translate([
            2*switchHolderBaseMaterialZ,
            switchHolderScrewLatchY,
            switchHolderBaseMaterialZ
        ]) cube([
            switchX,
            switchY,
            switchZ/2
        ]);

        // Cut out space for pin-side of switch
        translate([
            0,
            switchHolderScrewLatchY,
            switchHolderBaseMaterialZ + switchHolderInsetZ
        ]) cube([
            2*switchHolderBaseMaterialZ,
            switchY,
            switchZ/2 - switchHolderInsetZ
        ]);

        // Cut out space for filament
        translate([
            2*switchHolderBaseMaterialZ + switchX,
            0,
            switchHolderBaseMaterialZ + switchHolderInsetZ,
        ]) cube([
            switchHolderLatchX,
            switchHolderScrewLatchY + switchY + switchHolderScrewLatchY,
            switchZ/2 - switchHolderInsetZ
        ]);

        // Cut out a 22.5 degrees slope (prism) at end of filament latch
        translate([
            switchHolderX - 2*(switchHolderBaseMaterialZ + switchHolderInsetZ),
            0,
            switchHolderBaseMaterialZ + switchHolderInsetZ
        ]) rotate([
            180,
            0,
            90
        ]) primitivePrism(
            switchHolderY,
            2*(switchHolderBaseMaterialZ + switchHolderInsetZ),
            switchHolderBaseMaterialZ + switchHolderInsetZ
        );

        // Cut out edge near screw holes for additional possible corners of filament flow, lower one
        translate([
            2*switchHolderBaseMaterialZ + switchX - switchHolderScrewLatchY/2,
            0,
            switchHolderBaseMaterialZ + switchHolderInsetZ
        ]) rotate([
            0,
            -90,
            -90
        ]) primitivePrism(
            switchZ/2 - switchHolderInsetZ,
            switchHolderScrewLatchY/2,
            switchHolderScrewLatchY
        );

        // Cut out edge near screw holes for additional possible corners of filament flow, upper one
        translate([
            2*switchHolderBaseMaterialZ + switchX - switchHolderScrewLatchY/2,
            switchY + 2*switchHolderScrewLatchY,
            switchHolderBaseMaterialZ + switchZ/2
        ]) rotate([
            90,
            90,
            0
        ]) primitivePrism(
            switchZ/2 - switchHolderInsetZ,
            switchHolderScrewLatchY/2,
            switchHolderScrewLatchY
        );

        // Cut out lower screw hole
        translate([
            (2*switchHolderBaseMaterialZ + switchX)/2,
            switchHolderScrewLatchY/2,
            0
        ]) cylinder(
            h=switchHolderZ/2,
            r=screwHoleRadiusM3,
            $fn=64
        );

        // Cut out upper screw hole
        translate([
            (2*switchHolderBaseMaterialZ + switchX)/2,
            switchHolderScrewLatchY + switchY + switchHolderScrewLatchY/2,
            0
        ]) cylinder(
            h=switchHolderZ/2,
            r=screwHoleRadiusM3,
            $fn=64
        );
    }
}

feederMicroSwitchHolder();