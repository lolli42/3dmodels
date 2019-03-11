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
            r=screwHoleRadiusM3,
            $fn=64
        );
    }
}

// Main filament guide for the filament to the micro switch holder.
// This is the main part below the ceiling that holds the horizontally adjustable
// micro switch holder.
// This part is one half, two are needed.
module feederFilamentGuide() {
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
            guidanceScrewBaseY,
            guidanceZ/2 - filamentFlowSpaceZ/2
        ]) cube([
            guidanceX - 2*guidanceMaterialThickness,
            guidanceY - 2*guidanceScrewBaseY,
            filamentFlowSpaceZ/2
        ]);

        // Remove part the switch holder flows in
        translate([
            guidanceMaterialThickness,
            74 - switchHolderY/2,
            guidanceMaterialThickness,
        ]) cube([
            guidanceX - 2*guidanceMaterialThickness,
            switchHolderY,
            switchHolderBaseMaterialZ + switchHolderInsetZ
        ]);

        // Remove wide hole for horizontally adjustable switch holder upper row
        translate([
            guidanceMaterialThickness + 8,
            74 - switchHolderY/2 + switchHolderScrewLatchY/2 - (screwHoleRadiusM3*2 + 0.2)/2,
            0
        ]) cube([
            guidanceX - 2*guidanceMaterialThickness - 26 - 8,
            screwHoleRadiusM3*2 + 0.2,
            guidanceMaterialThickness
        ]);

        // Remove wide hole for horizontally adjustable switch holder lower row
        translate([
            guidanceMaterialThickness + 8,
            74 - switchHolderY/2 + switchHolderScrewLatchY/2 - (screwHoleRadiusM3*2 + 0.2)/2 + switchHolderScrewDistanceX,
            0
        ]) cube([
            guidanceX - 2*guidanceMaterialThickness - 26 - 8,
            screwHoleRadiusM3*2 + 0.2,
            guidanceMaterialThickness
        ]);

        // Remove holes for screws at edges
        translate([
            guidanceScrewBaseX/2,
            guidanceScrewBaseY/2,
            0
        ]) cylinder(
            h=guidanceZ/2,
            r=screwHoleRadiusM3,
            $fn=64
        );
        translate([
            guidanceX - guidanceScrewBaseX/2,
            guidanceScrewBaseY/2,
            0
        ]) cylinder(
            h=guidanceZ/2,
            r=screwHoleRadiusM3,
            $fn=64
        );
        translate([
            guidanceScrewBaseX/2,
            guidanceY - guidanceScrewBaseY/2,
            0
        ]) cylinder(
            h=guidanceZ/2,
            r=screwHoleRadiusM3,
            $fn=64
        );
        translate([
            guidanceX - guidanceScrewBaseX/2,
            guidanceY - guidanceScrewBaseY/2,
            0
        ]) cylinder(
            h=guidanceZ/2,
            r=screwHoleRadiusM3,
            $fn=64
        );

        // Extend inset at lower part so filament can't get stuck here
        translate([
            guidanceMaterialThickness + guidanceScrewBaseX,
            guidanceY - guidanceScrewBaseY,
            guidanceMaterialThickness,
        ]) cube([
            guidanceX - 2*guidanceMaterialThickness - 2*guidanceScrewBaseX,
            guidanceScrewBaseY,
            guidanceZ - guidanceMaterialThickness
        ]);

        // Have a cut at top end
        translate([
            guidanceMaterialThickness + guidanceScrewBaseX,
            0,
            0,
        ]) cube([
            guidanceX - 2*guidanceMaterialThickness - 2*guidanceScrewBaseX,
            guidanceScrewBaseY,
            guidanceZ
        ]);
    };
}

feederFilamentGuide();
