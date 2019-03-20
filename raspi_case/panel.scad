
materialThickness = 1.8;
itemDistance = 18;
buttonHoleRadius = 3.5;
buttonSecureHeight = 16;
ledHoleRadius = 2.5;
screwHoleRadius = 2.15;
holderPlateAngle = 30;

// Simple panel that holds a button and leds
module printerPanel() {
    union() {
        difference() {
            // main plate
            cube([
                5.5*itemDistance,
                2*itemDistance,
                materialThickness
            ]);
            // button hole
            translate([
                0.75*itemDistance,
                0.75*itemDistance,
                materialThickness/2
            ]) cylinder(
                h=materialThickness,
                r=buttonHoleRadius,
                $fn=64,
                center = true
            );
            // four led holes
            translate([
                1.75*itemDistance,
                0.75*itemDistance,
                materialThickness/2
            ]) cylinder(
                h=materialThickness,
                r=ledHoleRadius,
                $fn=64,
                center = true
            );
            translate([
                2.75*itemDistance,
                0.75*itemDistance,
                materialThickness/2
            ]) cylinder(
                h=materialThickness,
                r=ledHoleRadius,
                $fn=64,
                center = true
            );
            translate([
                3.75*itemDistance,
                0.75*itemDistance,
                materialThickness/2
            ]) cylinder(
                h=materialThickness,
                r=ledHoleRadius,
                $fn=64,
                center = true
            );
            translate([
                4.75*itemDistance,
                0.75*itemDistance,
                materialThickness/2
            ]) cylinder(
                h=materialThickness,
                r=ledHoleRadius,
                $fn=64,
                center = true
            );
        };
        // secure around power off button
        translate([
            0.25*itemDistance,
            0.25*itemDistance,
            materialThickness
        ]) cube([
            materialThickness,
            itemDistance,
            buttonSecureHeight
        ]);
        translate([
            1.25*itemDistance - materialThickness,
            0.25*itemDistance,
            materialThickness
        ]) cube([
            materialThickness,
            itemDistance,
            buttonSecureHeight
        ]);
        translate([
            0.25*itemDistance,
            0.25*itemDistance,
            materialThickness
        ]) cube([
            itemDistance,
            materialThickness,
            buttonSecureHeight
        ]);
        translate([
            0.25*itemDistance,
            1.25*itemDistance - materialThickness,
            materialThickness
        ]) cube([
            itemDistance,
            materialThickness,
            buttonSecureHeight
        ]);
        // holder plate
        translate([
            0,
            2*itemDistance - materialThickness*sin(holderPlateAngle),
            materialThickness - materialThickness*sin(90-holderPlateAngle)
        ]) rotate([
            -holderPlateAngle,
            0,
            0
        ]) difference() {
            cube([
                5.5*itemDistance,
                itemDistance,
                materialThickness
            ]);
            // screw holes
            translate([
                0.5*itemDistance,
                itemDistance/2,
                0
            ]) cylinder(
                h=materialThickness,
                r=screwHoleRadius,
                $fn=64
            );
            translate([
                5*itemDistance,
                itemDistance/2,
                0
            ]) cylinder(
                h=materialThickness,
                r=screwHoleRadius,
                $fn=64
            );
            translate([
                2.75*itemDistance,
                itemDistance/2,
                0
            ]) cylinder(
                h=materialThickness,
                r=screwHoleRadius,
                $fn=64
            );
        }
    }
}

printerPanel();