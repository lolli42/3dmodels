all: \
	raspi_case \
	motorized_extruder_feeder

raspi_case:
	openscad -o raspi_case/panel.stl raspi_case/panel.scad
	openscad -o raspi_case/raspi-camera-hole.stl raspi_case/raspi-camera-hole.scad

motorized_extruder_feeder:
	openscad -o motorized_extruder_feeder/feeder-micro-switch-holder.stl motorized_extruder_feeder/feeder-micro-switch-holder.scad
	openscad -o motorized_extruder_feeder/feeder-filament-guidance.stl motorized_extruder_feeder/feeder-filament-guidance.scad
	openscad -o motorized_extruder_feeder/feeder-lower-blanket-holder.stl motorized_extruder_feeder/feeder-lower-blanket-holder.scad
