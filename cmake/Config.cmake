find_program(ECPG ecpg DOC "A precompiler for PostgreSQL embedded code.")
if (${ECPG} STREQUAL "ECPG-NOTFOUND")
    message(FATAL_ERROR "ecpg not found, please install and add to the PATH.")
endif()
find_library(ECPG_LIBARY ecpg DOC "The ECPG library.")

find_package(PostgreSQL REQUIRED)

