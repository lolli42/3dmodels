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

module caseCover() {
    // base cube
    translate([
        - materialThickness,
        - materialThickness,
        0
    ]) cube([
        boxX + 2*materialThickness,
        boxY + 2*materialThickness,
        materialThickness
    ]);
};

caseCover();