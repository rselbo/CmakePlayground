
set (SOURCES
    include/embedded/embedded.h
    src/embedded.cpp
    src/embedded.pgs
)

roars_library(embedded "${SOURCES}")

target_include_directories(embedded 
    PUBLIC
        include
    PRIVATE_HEADER
        ${PostgreSQL_INCLUDE_DIRS}
        include/embedded)

target_link_libraries(embedded PRIVATE ${ECPG_LIBARY})