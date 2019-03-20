materialThickness = 1.6;
cutMaterialThickness = 0.8;
cutRadius = 5;
latchAdditionalRadius = 5;
cutZ = 50 + 2*materialThickness;

// Cut through ikea LACK for raspi cables
module cableHole() {
    difference() {
        union() {
            // Base cylinder
            translate([
                0,
                0,
                cutZ / 2
            ]) cylinder(
                h=cutZ,
                r=cutRadius,
                $fn=64,
                center = true
            );
            // latch
            translate([
                0,
                0,
                materialThickness / 2
            ]) cylinder(
                h=materialThickness,
                r=cutRadius + latchAdditionalRadius,
                $fn=64,
                center = true
            );
        }
        // remove hole
        translate([
            0,
            0,
            cutZ / 2
        ]) cylinder(
            h=cutZ,
            r=cutRadius - cutMaterialThickness,
            $fn=64,
            center = true
        );
        // remove part of latch on one side
        translate([
            - (cutRadius + latchAdditionalRadius),
            cutRadius,
            0
        ]) cube([
            2 * (cutRadius + latchAdditionalRadius),
            latchAdditionalRadius,
            materialThickness
        ]);
    };
}

cableHole();