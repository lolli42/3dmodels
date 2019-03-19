all:
	openscad -o motorized-extruder-feeder/feeder-micro-switch-holder.stl motorized-extruder-feeder/feeder-micro-switch-holder.scad
	openscad -o motorized-extruder-feeder/feeder-filament-guidance.stl motorized-extruder-feeder/feeder-filament-guidance.scad
	openscad -o motorized-extruder-feeder/feeder-lower-blanket-holder.stl motorized-extruder-feeder/feeder-lower-blanket-holder.scad


	openscad -o printer-panel/panel.stl printer-panel/panel.scad
