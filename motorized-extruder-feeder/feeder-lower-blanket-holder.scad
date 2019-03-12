include <variables.scad>;

// A base pod for holder screws
module blanketScrewHolder() {
    difference() {
        cube([
            guidanceScrewBaseX,
            guidanceScrewBaseY,
            guidanceMaterialThickness
        ]);
        translate([
            guidanceScrewBaseX/2,
            guidanceScrewBaseY/2,
            0
        ]) cylinder(
            guidanceMaterialThickness,
            r=screwHoleRadiusM2,
            $fn=64
        );
    }
}

// This holds the filament guidance. It is attached to the top of the ikea LACK
// table through the 10mm screw.
module feederLowerBlanketHolder() {
    union() {
        difference() {
            // base plate
            cube([
                guidanceX,
                guidanceMaterialThickness,
                guidanceZ + 2*guidanceMaterialThickness
            ]);
            // cut out main m10 screw hole
            translate([
                guidanceX/2,
                0,
                (guidanceZ + 2*guidanceMaterialThickness)/2
            ]) rotate([
                -90,
                0,
                0
            ]) cylinder(
                guidanceMaterialThickness,
                r=screwHoleRadiusM10,
                $fn=64
            );
        };
        // add screw pods
        translate([
            0,
            guidanceMaterialThickness,
            0
        ]) blanketScrewHolder();
        translate([
            guidanceX - guidanceScrewBaseX,
            guidanceMaterialThickness,
            0
        ]) blanketScrewHolder();
        translate([
            0,
            guidanceMaterialThickness,
            guidanceZ + guidanceMaterialThickness
        ]) blanketScrewHolder();
        translate([
            guidanceX - guidanceScrewBaseX,
            guidanceMaterialThickness,
            guidanceZ + guidanceMaterialThickness
        ]) blanketScrewHolder();
    }
}

feederLowerBlanketHolder();
