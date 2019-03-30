
materialThickness = 1.6;
cutX = 18;
cutY = 10;
cutZ = 50 + 2*materialThickness;
latchOverHang = 5;

// Cut through ikea LACK for ender3 XT60 power connector hole
module powerCableHole() {
    difference() {
        union() {
            // base cube
            cube([
                cutX + 2*materialThickness,
                cutY + 2*materialThickness,
                cutZ
            ]);
            // add latch at top side
            translate([
                -latchOverHang,
                -latchOverHang,
                0
            ]) cube([
                cutX + 2*materialThickness + 2*latchOverHang,
                cutY + 2*materialThickness + 2*latchOverHang,
                materialThickness
            ]);
        }
        // remove hole
        translate([
            materialThickness,
            materialThickness,
            0
        ]) cube([
            cutX,
            cutY,
            cutZ
        ]);
    };
}

powerCableHole();