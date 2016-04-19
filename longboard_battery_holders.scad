// all dimensions are in millimeters

// battery dimensions
BHEIGHT = 150;
BWIDTH = 53;
BDEPTH = 30;

// other constants
PADDING = 5;
SCREWRAD = 3;
SCREWPADDING = 5;
SCREWHEIGHT = 4;
SSUM = SCREWRAD + SCREWPADDING;

module screw() {
    linear_extrude(height=SCREWHEIGHT)
        difference() {
            hull() {
                circle(SSUM);
                translate([-SSUM, 0])
                    square(2*SSUM);
            }
            circle(SCREWRAD);
        }
}

BEDGE = 8;

module battery() {
    union() {
        cube(size=[BHEIGHT, BWIDTH, BDEPTH], center=false);
        translate([BEDGE, BEDGE, -BDEPTH])
        difference() {
            cube(size=[BHEIGHT-2*BEDGE, BWIDTH-2*BEDGE, 10*BDEPTH], center=false);
            translate([BHEIGHT/2-2*BEDGE, 0, 0])
                cube(size=[2*BEDGE, BWIDTH-2*BEDGE, 10*BDEPTH], center=false);
        }
    }
}

// battery();

HOLEWID = 12;

difference() {
    union() {
        translate([SSUM+PADDING+HOLEWID, -SSUM, BDEPTH+PADDING-SCREWHEIGHT])
            screw();
        translate([SSUM, SSUM+BWIDTH+2*PADDING, BDEPTH+PADDING-SCREWHEIGHT])
            rotate([0, 0, 180])
                screw();
        translate([BHEIGHT+2*PADDING-SSUM-PADDING-HOLEWID, -SSUM, BDEPTH+PADDING-SCREWHEIGHT])
            screw();
        translate([BHEIGHT+2*PADDING-SSUM, SSUM+BWIDTH+2*PADDING, BDEPTH+PADDING-SCREWHEIGHT])
            rotate([0, 0, 180])
                screw();
        cube(size=[BHEIGHT+2*PADDING, BWIDTH+2*PADDING, BDEPTH+PADDING], center=false);
    }
    translate([PADDING, PADDING, PADDING])
        battery();
    translate([PADDING, 0, PADDING])
        cube([HOLEWID, PADDING, BDEPTH-PADDING]);
    translate([BHEIGHT-2*PADDING, 0, PADDING])
        cube([HOLEWID, PADDING, BDEPTH-PADDING]);
}
