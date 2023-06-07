OBJS=enclosure.stl \
	connector.stl \
	filterguard.stl

.phony: all

all: ${OBJS}

%.stl : %.scad
	openscad -o $@ $<
