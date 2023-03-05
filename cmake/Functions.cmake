function(cmake_library target sources)
    message("** ${sources}")
    foreach(SOURCE IN LISTS sources)
        message("-> Library source ${SOURCE}")
        list(APPEND LIB_SOURCES ${SOURCE})
    endforeach()

    add_library(${target} ${LIB_SOURCES})
endfunction()