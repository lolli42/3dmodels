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

module ventilation() {
    cube([
        2.5,
        materialThickness,
        boxZ - 6
    ]);
}

module case() {
    union() {
        difference() {
            // base cube
            translate([
                - materialThickness,
                - materialThickness,
                - materialThickness
            ]) cube([
                boxX + 2*materialThickness,
                boxY + 2*materialThickness,
                boxZ + 1.5*materialThickness
            ]);
            // main hole
            cube([
                boxX,
                boxY,
                boxZ + 0.5*materialThickness
            ]);
            // 4 insets on top for better cover fitting
            translate([
                0,
                - materialThickness / 2,
                boxZ
            ]) cube([
                boxX,
                materialThickness / 2,
                materialThickness / 2
            ]);
            translate([
                0,
                boxY,
                boxZ
            ]) cube([
                boxX,
                materialThickness / 2,
                materialThickness / 2
            ]);
            translate([
                - materialThickness / 2,
                latchY - materialThickness,
                boxZ
            ]) cube([
                materialThickness / 2,
                boxY - 2*latchY + 2*materialThickness,
                materialThickness / 2
            ]);
            translate([
                boxX,
                latchY - materialThickness,
                boxZ
            ]) cube([
                materialThickness / 2,
                boxY - 2*latchY + 2*materialThickness,
                materialThickness / 2
            ]);
            // ventilation at back
            for (a = [0:15]) {
                translate([
                    7.25 + a*8,
                    boxY,
                    3
                ]) ventilation();
            }
            // cooler main hole
            translate([
                65 + 20,
                0,
                21
            ]) rotate([
                90,
                0,
                0
            ]) cylinder(
                r=20,
                h=materialThickness,
                $fn=64
            );
            // cooler srew holes
            translate([
                65 + 4,
                0,
                1 + 4
            ]) rotate([
                90,
                0,
                0
            ]) cylinder(
                r=2,
                h=materialThickness,
                $fn=64
            );
            translate([
                65 + 40 - 4,
                0,
                1 + 4
            ]) rotate([
                90,
                0,
                0
            ]) cylinder(
                r=2,
                h=materialThickness,
                $fn=64
            );
            translate([
                65 + 4,
                0,
                1 + 40 - 4
            ]) rotate([
                90,
                0,
                0
            ]) cylinder(
                r=2,
                h=materialThickness,
                $fn=64
            );
            translate([
                65 + 40 - 4,
                0,
                1 + 40 - 4
            ]) rotate([
                90,
                0,
                0
            ]) cylinder(
                r=2,
                h=materialThickness,
                $fn=64
            );
            // first cable hole left side
            translate([
                - materialThickness,
                70,
                0
            ]) cube([
                materialThickness,
                15 + materialThickness,
                8
            ]);
            // second cabel hole right side
            translate([
                boxX,
                60 + materialThickness,
                0
            ]) cube([
                materialThickness,
                25,
                8
            ]);
            // raspi usb hole
            translate([
                25,
                -materialThickness,
                boxZ - 17 - plateDistanceZ - plateZ
            ]) cube([
                16,
                materialThickness,
                17,
            ]);
            // raspi hdmi hole
            translate([
                -materialThickness,
                46,
                boxZ - 8 - plateDistanceZ - plateZ
            ]) cube([
                materialThickness,
                20,
                8
            ]);
        }
        // 4 lower latches
        translate([
            - materialThickness - latchX,
            - materialThickness,
            - materialThickness
        ]) latch(2.1);
        translate([
            materialThickness + boxX,
            - materialThickness,
            - materialThickness
        ]) latch(2.1);
        translate([
            - materialThickness - latchX,
            boxY - latchY + materialThickness,
            - materialThickness
        ]) latch(2.1);
        translate([
            materialThickness + boxX,
            boxY - latchY + materialThickness,
            - materialThickness
        ]) latch(2.1);
        // 4 upper latches
        translate([
            - materialThickness - latchX,
            - materialThickness,
            boxZ - materialThickness/2
        ]) latch(1.6);
        translate([
            materialThickness + boxX,
            - materialThickness,
            boxZ - materialThickness/2
        ]) latch(1.6);
        translate([
            - materialThickness - latchX,
            boxY - latchY + materialThickness,
            boxZ - materialThickness/2
        ]) latch(1.6);
        translate([
            materialThickness + boxX,
            boxY - latchY + materialThickness,
            boxZ - materialThickness/2
        ]) latch(1.6);
    }
};

case();