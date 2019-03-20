
materialThickness = 1.6;
cutX = 20;
cutY = 8;
cutZ = 50 + 2*materialThickness;
latchOverHang = 5;

// Cut through ikea LACK for raspi to printer usb cable
module usbCableHole() {
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

usbCableHole();