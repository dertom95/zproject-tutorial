# CMake generated Testfile for 
# Source directory: /home/ttrocha/_dev/projects/zeromq/getting_started/zproject
# Build directory: /home/ttrocha/_dev/projects/zeromq/getting_started/zproject/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(shouter "/home/ttrocha/_dev/projects/zeromq/getting_started/zproject/build/gs_selftest" "--continue" "--verbose" "--test" "shouter")
set_tests_properties(shouter PROPERTIES  DEPENDS "copy-selftest-ro;make-selftest-rw" TIMEOUT "60" _BACKTRACE_TRIPLES "/home/ttrocha/_dev/projects/zeromq/getting_started/zproject/CMakeLists.txt;386;add_test;/home/ttrocha/_dev/projects/zeromq/getting_started/zproject/CMakeLists.txt;0;")
