# Hacky fix for hacky ice_cube version handling (see lib/ice_cube.rb in gem)
major, minor = IceCube::VERSION.split(".").map(&:to_i)
IceCube.compatibility = major * 100 + minor
