OBJS=enclosure.stl \
	connector.stl \
	filterguard.stl	\
	exhaust.stl

.phony: all

all: ${OBJS}

%.stl : %.scad
	openscad -o $@ $<
