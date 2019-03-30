
materialThickness = 1.8;
powerX = 52;
powerY = 12;
powerZ = 39;
latchX = 12;
latchY = 12;
latchHoleRadius = 2.1;

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

// Simple power plug holder
module powerPlugHolder() {
    union() {
        // first latch
        latch(latchHoleRadius);
        // first side
        translate([
            latchX,
            0,
            0
        ]) cube([
            materialThickness,
            powerY,
            powerZ + materialThickness
        ]);
        // upper side
        translate([
            latchX + materialThickness,
            0,
            powerZ
        ]) cube([
            powerX,
            powerY,
            materialThickness
        ]);
        // second side
        translate([
            latchX + materialThickness + powerX,
            0,
            0
        ]) cube([
            materialThickness,
            powerY,
            powerZ + materialThickness
        ]);
        // second latch
        translate([
            latchX + 2*materialThickness + powerX,
            0,
            0
        ]) latch(latchHoleRadius);
    };
}

powerPlugHolder();