.PHONY: \
	all \
	raspi_case \
	motorized_extruder_feeder \
	raspi_uni_enclosure \
	t_rex

raspi_case:
	openscad -o raspi_case/panel.stl raspi_case/panel.scad
	openscad -o raspi_case/raspi-camera-hole.stl raspi_case/raspi-camera-hole.scad
	openscad -o raspi_case/raspi-cable-hole.stl raspi_case/raspi-cable-hole.scad
	openscad -o raspi_case/raspi-usb-hole.stl raspi_case/raspi-usb-hole.scad
	openscad -o raspi_case/power-hole.stl raspi_case/power-hole.scad
	openscad -o raspi_case/case.stl raspi_case/case.scad
	openscad -o raspi_case/case-cover.stl raspi_case/case-cover.scad
	openscad -o raspi_case/power-plug-holder.stl raspi_case/power-plug-holder.scad

motorized_extruder_feeder:
	openscad -o motorized_extruder_feeder/feeder-micro-switch-holder.stl motorized_extruder_feeder/feeder-micro-switch-holder.scad
	openscad -o motorized_extruder_feeder/feeder-filament-guidance.stl motorized_extruder_feeder/feeder-filament-guidance.scad
	openscad -o motorized_extruder_feeder/feeder-lower-blanket-holder.stl motorized_extruder_feeder/feeder-lower-blanket-holder.scad

raspi_uni_enclosure:
	openscad -o raspi_uni_enclosure/raspi-uni-enclosure.stl raspi_uni_enclosure/raspi-uni-enclosure.scad

t_rex:
	openscad -o t_rex/base-beam-short.stl t_rex/base-beam-short.scad