include <../primitives/prism.scad>;
include <variables.scad>;

// A base pod for holder screws
module screwBase() {
    difference() {
        cube([
            guidanceScrewBaseX,
            guidanceScrewBaseY,
            guidanceZ/2
        ]);
        translate([
            guidanceScrewBaseX/2,
            guidanceScrewBaseY/2,
            0
        ]) cylinder(
            h=guidanceZ/2,
            r=screwHoleRadiusM2,
            $fn=64
        );
    }
}

// Main filament guide for the filament to the micro switch holder.
// This is the main part below the ceiling that holds the horizontally adjustable
// micro switch holder.
// This part is one half, two are needed.
module feederFilamentGuide() {
    union() {
        difference() {
            // Base cube, everything else is substracted from this
            cube([
                guidanceX,
                guidanceY,
                guidanceZ/2
            ]);

            // Remove base inset
            translate([
                guidanceMaterialThickness,
                2*guidanceScrewBaseY,
                guidanceZ/2 - filamentFlowSpaceZ/2
            ]) cube([
                guidanceX - 2*guidanceMaterialThickness,
                guidanceY - 3*guidanceScrewBaseY,
                filamentFlowSpaceZ/2
            ]);

            // Remove part the switch holder flows in
            translate([
                guidanceMaterialThickness,
                59 - switchHolderY/2 - 0.15,
                guidanceMaterialThickness,
            ]) cube([
                guidanceX - 2*guidanceMaterialThickness,
                switchHolderY + 2*0.15, // 0.15 is some additional space around
                switchHolderBaseMaterialZ + switchHolderInsetZ
            ]);

            // Remove wide hole for horizontally adjustable switch holder upper row
            translate([
                guidanceMaterialThickness + 5,
                59 - switchHolderY/2 + switchHolderScrewLatchY/2 - (screwHoleRadiusM2*2 + 0.2)/2,
                0
            ]) cube([
                guidanceX - 2*guidanceMaterialThickness - 10,
                screwHoleRadiusM2*2 + 0.2,
                guidanceMaterialThickness
            ]);

            // Remove wide hole for horizontally adjustable switch holder lower row
            translate([
                guidanceMaterialThickness + 5,
                59 - switchHolderY/2 + switchHolderScrewLatchY/2 - (screwHoleRadiusM2*2 + 0.2)/2 + switchHolderScrewDistanceX,
                0
            ]) cube([
                guidanceX - 2*guidanceMaterialThickness - 10,
                screwHoleRadiusM2*2 + 0.2,
                guidanceMaterialThickness
            ]);

            // Remove holes for screws at edges
            translate([
                guidanceScrewBaseX/2,
                guidanceScrewBaseY/2,
                0
            ]) cylinder(
                h=guidanceZ/2,
                r=screwHoleRadiusM2,
                $fn=64
            );
            translate([
                guidanceX - guidanceScrewBaseX/2,
                guidanceScrewBaseY/2,
                0
            ]) cylinder(
                h=guidanceZ/2,
                r=screwHoleRadiusM2,
                $fn=64
            );
            translate([
                guidanceScrewBaseX/2,
                guidanceY - guidanceScrewBaseY/2,
                0
            ]) cylinder(
                h=guidanceZ/2,
                r=screwHoleRadiusM2,
                $fn=64
            );
            translate([
                guidanceX - guidanceScrewBaseX/2,
                guidanceY - guidanceScrewBaseY/2,
                0
            ]) cylinder(
                h=guidanceZ/2,
                r=screwHoleRadiusM2,
                $fn=64
            );

            // Cut out space for micro switch wires
            translate([
                0,
                59 - switchY/2 - 0.15,
                guidanceMaterialThickness + switchHolderBaseMaterialZ
            ]) cube([
                guidanceMaterialThickness,
                switchY,
                switchHolderZ/2 - switchHolderBaseMaterialZ
            ]);

            // Extend inset at lower part so filament can't get stuck here
            translate([
                guidanceScrewBaseX,
                guidanceY - guidanceScrewBaseY,
                guidanceMaterialThickness,
            ]) cube([
                guidanceX - 2*guidanceScrewBaseX,
                guidanceScrewBaseY,
                guidanceZ - guidanceMaterialThickness
            ]);

            // Have a cut at top end - enough for a wrench height
            translate([
                guidanceScrewBaseX,
                0,
                0,
            ]) cube([
                guidanceX - 2*guidanceScrewBaseX,
                2* guidanceScrewBaseY,
                guidanceZ
            ]);

            // Have a prism at top part for easier filament insert
            translate([
                guidanceScrewBaseX,
                2*guidanceScrewBaseY + 2*(guidanceZ/2 - filamentFlowSpaceZ/2),
                guidanceZ/2 - filamentFlowSpaceZ/2
            ]) rotate([
                180,
                0,
                0
            ]) primitivePrism(
                guidanceX - 2*guidanceScrewBaseX,
                2*(guidanceZ/2 - filamentFlowSpaceZ/2),
                guidanceZ/2 - filamentFlowSpaceZ/2
            );
        };
        // Lower screw bases
        translate([
            0,
            guidanceY - guidanceScrewBaseY,
            0
        ]) difference() {
            cube([
                guidanceScrewBaseX,
                guidanceScrewBaseY,
                guidanceZ/2
            ]);
            translate([
                guidanceScrewBaseX/2,
                guidanceScrewBaseY/2,
                guidanceZ/2
            ]) cylinder(
                h=guidanceZ/2,
                r=screwHoleRadiusM2,
                $fn=64,
                center = true
            );
        }
        translate([
            guidanceX - guidanceScrewBaseX,
            guidanceY - guidanceScrewBaseY,
            0
        ]) difference() {
            cube([
                guidanceScrewBaseX,
                guidanceScrewBaseY,
                guidanceZ/2
            ]);
            translate([
                guidanceScrewBaseX/2,
                guidanceScrewBaseY/2,
                guidanceZ/2
            ]) cylinder(
                h=guidanceZ/2,
                r=screwHoleRadiusM2,
                $fn=64,
                center = true
            );
        }
    }
}

// Need two parts, they are not symmetric, so we need one native part and one mirror by x-achsis
translate([1, 0, 0]) feederFilamentGuide();
translate([-1, 0, 0]) mirror([1, 0, 0 ]) feederFilamentGuide();
