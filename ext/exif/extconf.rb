require 'mkmf'
have_library('exif')
have_header('libexif/exif-data.h')
create_makefile('exif/exif')
