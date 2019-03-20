
materialThickness = 1.6;
cutX = 20;
cutY = 2;
cutZ = 50 + 2*materialThickness;
latchOverHang = 5;

// Cut through ikea LACK for raspi camera cable
module cameraHole() {
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

cameraHole();