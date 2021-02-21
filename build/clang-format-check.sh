#!/bin/sh

# Use clang-format tool to verify this codebase conforms to our style standards

FAILED=0
IFS=";"
FILES="../include/gs.h;../include/gs_library.h;../include/shouter.h;../src/gs_classes.h;../src/gs_private_selftest.c;../src/gs_selftest.c;../src/shouter.c;../src/starter.c"
IDS=$(echo -en "\n\b")
[ -n "$MAKE" ] || MAKE=make
for FILE in $FILES
do
    clang-format -style=file -output-replacements-xml "$FILE" | grep "<replacement " >/dev/null && \
    {
      echo "$FILE is not correctly formatted" >&2
      FAILED=1
    }
done
if [ "$FAILED" -eq "1" ] ; then
    if [ "$1" = "--CI" ] ; then
        echo "Style mismatches were found by clang-format; detailing below:" >&2
        ${MAKE} clang-format-diff
        if test x"${CI_REQUIRE_GOOD_CLANG_FORMAT}" = xtrue ; then
            echo "FAILED : Style checks have failed and CI_REQUIRE_GOOD_CLANG_FORMAT==true" >&2
            exit 1
        fi
        echo "WARNING : Style checks have failed, but the result is not-fatal because CI_REQUIRE_GOOD_CLANG_FORMAT!=true" >&2
        exit 0
    fi
    exit 1
fi