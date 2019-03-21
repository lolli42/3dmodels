materialThickness = 1.8;
boxX = 137;
boxY = 97;
boxZ = 42;
latchX = 12;
latchY = 12;
plateZ = 1.5;
plateDistanceZ = 7.5;

module latch(holeRadius) {
    difference() {
        cube([
            latchX,
            latchY,
            materialThickness
        ]);
        translate([
            latchX/2,
            latchY/2,
            materialThickness/2
        ]) cylinder(
            r=holeRadius,
            h=materialThickness,
            $fn=64,
            center=true
        );
    }
}

module plateHolder() {
    // Plate holders
    cylinder(
        r=3.6,
        h=plateDistanceZ,
        $fn=64,
        center=true
    );
}

module plateHolderHole() {
    cylinder(
        r=1.6,
        h=plateDistanceZ + 1.5*materialThickness,
        $fn=64,
        center=true
    );
}

module caseCover() {
    difference() {
        union() {
            difference() {
                // base cover cube
                translate([
                    - materialThickness,
                    - materialThickness,
                    0
                ]) cube([
                    boxX + 2*materialThickness,
                    boxY + 2*materialThickness,
                    1.5 * materialThickness
                ]);
                // cut out around latches
                translate([
                    -materialThickness,
                    -materialThickness,
                    materialThickness
                ]) cube([
                    materialThickness + 0.2,
                    latchY + 0.2,
                    materialThickness / 2
                ]);
                translate([
                    -materialThickness,
                    boxY + materialThickness - latchY - 0.2,
                    materialThickness
                ]) cube([
                    materialThickness + 0.2,
                    latchY + 0.2,
                    materialThickness / 2
                ]);
                translate([
                    boxX - 0.2,
                    -materialThickness,
                    materialThickness
                ]) cube([
                    materialThickness + 0.2,
                    latchY + 0.2,
                    materialThickness / 2
                ]);
                translate([
                    boxX - 0.2,
                    boxY + materialThickness - latchY - 0.2,
                    materialThickness
                ]) cube([
                    materialThickness + 0.2,
                    latchY + 0.2,
                    materialThickness / 2
                ]);
                // cout out on sides
                translate([
                    0.2,
                    -materialThickness,
                    materialThickness
                ]) cube([
                    boxX - 0.4,
                    materialThickness / 2 + 0.2,
                    materialThickness / 2
                ]);
                translate([
                    0.2,
                    boxY + materialThickness/2 - 0.2,
                    materialThickness
                ]) cube([
                    boxX - 0.4,
                    materialThickness / 2 + 0.2,
                    materialThickness / 2
                ]);
                translate([
                    -materialThickness,
                    latchY + 0.2 - materialThickness,
                    materialThickness
                ]) cube([
                    materialThickness / 2 + 0.2,
                    boxY + 2*materialThickness - 2*latchY - 0.4,
                    materialThickness / 2
                ]);
                translate([
                    boxX + materialThickness/2 - 0.2,
                    latchY + 0.2 - materialThickness,
                    materialThickness
                ]) cube([
                    materialThickness / 2 + 0.2,
                    boxY + 2*materialThickness - 2*latchY - 0.4,
                    materialThickness / 2
                ]);
            }
            // 4 latches
            translate([
                - materialThickness - latchX,
                - materialThickness,
                0
            ]) latch(1.6);
            translate([
                materialThickness + boxX,
                - materialThickness,
                0
            ]) latch(1.6);
            translate([
                - materialThickness - latchX,
                boxY - latchY + materialThickness,
                0
            ]) latch(1.6);
            translate([
                materialThickness + boxX,
                boxY - latchY + materialThickness,
                0
            ]) latch(1.6);
            // raspi plate holders
            translate([
                7,
                26,
                1.5 * materialThickness + plateDistanceZ/2
            ]) plateHolder();
            translate([
                56,
                26,
                1.5 * materialThickness + plateDistanceZ/2
            ]) plateHolder();
            translate([
                7,
                84,
                1.5 * materialThickness + plateDistanceZ/2
            ]) plateHolder();
            translate([
                56,
                84,
                1.5 * materialThickness + plateDistanceZ/2
            ]) plateHolder();
            // add on plate holders
            translate([
                70,
                23,
                1.5 * materialThickness + plateDistanceZ/2
            ]) plateHolder();
            translate([
                128.4,
                23,
                1.5 * materialThickness + plateDistanceZ/2
            ]) plateHolder();
            translate([
                70,
                83.9,
                1.5 * materialThickness + plateDistanceZ/2
            ]) plateHolder();
            translate([
                128.4,
                83.9,
                1.5 * materialThickness + plateDistanceZ/2
            ]) plateHolder();
        };
        // raspi plate holder holes
        translate([
            7,
            26,
            plateDistanceZ/2 + 1.5*materialThickness/2
        ]) plateHolderHole();
        translate([
            56,
            26,
            plateDistanceZ/2 + 1.5*materialThickness/2
        ]) plateHolderHole();
        translate([
            7,
            84,
            plateDistanceZ/2 + 1.5*materialThickness/2
        ]) plateHolderHole();
        translate([
            56,
            84,
            plateDistanceZ/2 + 1.5*materialThickness/2
        ]) plateHolderHole();
        // add on plate holder holes
        translate([
            70,
            23,
            plateDistanceZ/2 + 1.5*materialThickness/2
        ]) plateHolderHole();
        translate([
            128.4,
            23,
            plateDistanceZ/2 + 1.5*materialThickness/2
        ]) plateHolderHole();
        translate([
            70,
            83.9,
            plateDistanceZ/2 + 1.5*materialThickness/2
        ]) plateHolderHole();
        translate([
            128.4,
            83.9,
            plateDistanceZ/2 + 1.5*materialThickness/2
        ]) plateHolderHole();
    }
};

caseCover();