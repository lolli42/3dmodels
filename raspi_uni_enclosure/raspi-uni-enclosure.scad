mainCaseX = 96;
mainCaseY = 74;
mainCaseZ = 1.6;

raspiY = 56;
raspiX = 85;

sdCardSpaceX = 12;
sdCardSpaceY = 26;
sdCardBlockX = 10;

raspiFootDistanceX = 58;
raspiFootDistanceY = 49;
raspiFootRadius = 3;
raspiFootZ = 2.4;
raspiFootNupsiBottomRadius = 1;
raspiFootNupsiTopRadius = 0.3;
raspiFootNupsiZ = 2;

raspiHatHolderX = 7;
raspiHatHolderY = 5;
raspiHatHolderZ = 11.2 + raspiFootZ;

raspiHatHolderUpperSideZ = raspiHatHolderZ + 1.6;
raspiHatHolderLimitX = 2.5;
raspiHatHolderLimitY = 5;
raspiHatHolderLimitZ = raspiHatHolderUpperSideZ + 2;

raspiHatHolderClipCubeX = 4;
raspiHatHolderClipCubeY = raspiHatHolderLimitY;
raspiHatHolderClipCubeZ = 12;


raspiCardCornerX = sdCardBlockX + 4 - 3.5;

module raspiFootAndNupsi() {
    translate([
        0,
        0,
        raspiFootZ / 2
    ]) union() {
        cylinder(
            r=raspiFootRadius,
            h=raspiFootZ,
            $fn=64,
            center=true
        );
        translate([
            0,
            0,
            (raspiFootNupsiZ + raspiFootZ) / 2
        ]) cylinder(
            r1=raspiFootNupsiBottomRadius,
            r2=raspiFootNupsiTopRadius,
            h=raspiFootNupsiZ,
            $fn=64,
            center=true
        );
    }
}

module case() {
    union() {
        difference() {
            // Base plate
            cube([
                mainCaseX,
                mainCaseY,
                mainCaseZ
            ]);
            // Remove space for sdcard
            translate([
                0,
                mainCaseY/2 - sdCardSpaceY/2,
                0
            ]) cube([
                sdCardSpaceX,
                sdCardSpaceY,
                mainCaseZ
            ]);
        };

        // Blocks next to sdcard
        translate([
            0,
            0,
            mainCaseZ
        ]) cube([
            sdCardBlockX,
            (mainCaseY - sdCardSpaceY) / 2,
            10
        ]);

        // Blocks next to sdcard
        translate([
            0,
            (mainCaseY + sdCardSpaceY) / 2,
            mainCaseZ
        ]) cube([
            sdCardBlockX,
            (mainCaseY - sdCardSpaceY) / 2,
            10
        ]);

        // 4 raspi foot and nupsis
        translate([
            sdCardBlockX + 4,
            mainCaseY / 2 - raspiFootDistanceY / 2,
            mainCaseZ
        ]) raspiFootAndNupsi();
        translate([
            sdCardBlockX + 4,
            mainCaseY / 2 + raspiFootDistanceY / 2,
            mainCaseZ
        ]) raspiFootAndNupsi();
        translate([
            sdCardBlockX + 4 + raspiFootDistanceX,
            mainCaseY / 2 - raspiFootDistanceY / 2,
            mainCaseZ
        ]) raspiFootAndNupsi();
        translate([
            sdCardBlockX + 4 + raspiFootDistanceX,
            mainCaseY / 2 + raspiFootDistanceY / 2,
            mainCaseZ
        ]) raspiFootAndNupsi();
        // Another foot in the middle of the usb/networking raspi side
        translate([
            raspiCardCornerX + raspiX - raspiFootRadius,
            mainCaseY / 2,
            mainCaseZ + raspiFootZ/2
        ]) cylinder(
            r=raspiFootRadius,
            h=raspiFootZ,
            $fn=64,
            center=true
        );

        // 4 HAT holder cubes
        translate([
            raspiCardCornerX + 19,
            mainCaseY / 2 + raspiY / 2 + raspiHatHolderY / 2,
            raspiHatHolderZ / 2
        ]) cube([
            raspiHatHolderX,
            raspiHatHolderY,
            raspiHatHolderZ
        ], true);
        translate([
            raspiCardCornerX + 45,
            mainCaseY / 2 + raspiY / 2 + raspiHatHolderY / 2,
            raspiHatHolderZ / 2
        ]) cube([
            raspiHatHolderX,
            raspiHatHolderY,
            raspiHatHolderZ
        ], true);
        translate([
            raspiCardCornerX + 19,
            mainCaseY / 2 - raspiY / 2 - raspiHatHolderY / 2,
            raspiHatHolderZ / 2
        ]) cube([
            raspiHatHolderX,
            raspiHatHolderY,
            raspiHatHolderZ
        ], true);
        translate([
            raspiCardCornerX + 45,
            mainCaseY / 2 - raspiY / 2 - raspiHatHolderY / 2,
            raspiHatHolderZ / 2
        ]) cube([
            raspiHatHolderX,
            raspiHatHolderY,
            raspiHatHolderZ
        ], true);

        // 2 Hat limiter opposite corners
        translate([
            raspiCardCornerX + 63,
            mainCaseY / 2 - raspiHatHolderLimitY - raspiY / 2 - 0.5,
            mainCaseZ
        ]) cube([
            raspiHatHolderLimitX,
            raspiHatHolderLimitY,
            raspiHatHolderLimitZ
        ]);
        translate([
            raspiCardCornerX - raspiHatHolderLimitX + 2,
            mainCaseY / 2 + raspiY / 2 + 0.5,
            mainCaseZ
        ]) cube([
            raspiHatHolderLimitX,
            raspiHatHolderLimitY,
            raspiHatHolderLimitZ
        ]);

        // 2 Hat limiter opposite corners with clips
        translate([
            raspiCardCornerX - raspiHatHolderLimitX + 2,
            mainCaseY / 2 - raspiHatHolderLimitY - raspiY / 2 - 0.5,
            mainCaseZ
        ]) union() {
            cube([
                raspiHatHolderLimitX,
                raspiHatHolderLimitY,
                raspiHatHolderUpperSideZ
            ]);
            translate([
                0,
                0,
                raspiHatHolderUpperSideZ
            ]) cube([
                raspiHatHolderClipCubeX,
                raspiHatHolderClipCubeY,
                raspiHatHolderClipCubeZ
            ]);
        }
        translate([
            raspiCardCornerX + 63,
            mainCaseY / 2 + raspiY / 2 + 0.5,
            mainCaseZ
        ]) union() {
            cube([
                raspiHatHolderLimitX,
                raspiHatHolderLimitY,
                raspiHatHolderUpperSideZ
            ]);
            translate([
                - (raspiHatHolderClipCubeX - raspiHatHolderLimitX),
                0,
                raspiHatHolderUpperSideZ
            ]) cube([
                raspiHatHolderClipCubeX,
                raspiHatHolderClipCubeY,
                raspiHatHolderClipCubeZ
            ]);
        }
    };
};

case();