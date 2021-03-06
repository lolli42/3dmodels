// Radius an M3 screw hole has M3 screw fits in with a bit of extra space
screwHoleRadiusM2 = 1.15; // 2.3 mm diameter
screwHoleRadiusM3 = 1.65; // 3.3 mm diameter
screwHoleRadiusM10 = 5.2; // 10.4 mm diameter

// Dimensions of the micro switch, case only, without pins and switch latch
switchZ = 6.6; // Thickness of switch
switchX = 10.6; // Width of switch
switchY = 20.2; // Height of switch

// Dimensions of switch holder details
switchHolderBaseMaterialZ = 1.6; // Basic material thickness. This is the smallest thickness at the switch
switchHolderInsetZ = 1.2; // Inset thickness added to base thickness so switch can't fall out
switchHolderLatchX = 20; // Width of the part the filament runs through
switchHolderScrewLatchY = 6; // Height of the part that holds the screws (two of them, one above, one below switch)

// Absolute dimension vars of the whole micro switch holder, without the filament guide latches on top and bottom
switchHolderX = 2*switchHolderBaseMaterialZ + switchX + switchHolderLatchX;
switchHolderY = switchHolderScrewLatchY + switchY + switchHolderScrewLatchY;
// Full thickness is 2 parts
switchHolderZ = 2*switchHolderBaseMaterialZ + switchZ;
// Distance between the middle point of the two holder screws
switchHolderScrewDistanceX = switchY + switchHolderScrewLatchY;
// Thickness of the space the filament runs through
filamentFlowSpaceZ = switchHolderZ - 2*switchHolderBaseMaterialZ - 2*switchHolderInsetZ;

// Dimensions of the filament guidance
guidanceMaterialThickness = 1.8;
guidanceX = 2*guidanceMaterialThickness + 64;
guidanceY = 75.25;
guidanceZ = switchHolderZ + 2*guidanceMaterialThickness;
guidanceScrewBaseX = 6;
guidanceScrewBaseY = 6;