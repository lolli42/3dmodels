module beam() {
    difference() {
        translate([
            -96,
            -134,
            -0
        ]) import("base_beam.stl");
        translate([
            0,
            20,
            0
        ]) cube([10, 120, 10], false);
    }
}

beam();