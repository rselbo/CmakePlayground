function(roars_library target)
    foreach(SOURCE IN LISTS ARGN)
        get_filename_component(FILE_TYPE ${SOURCE} EXT)
        if(${FILE_TYPE} STREQUAL ".pgs")
            ecpg_target(${SOURCE} OUTPUT)
            # message("-> ecpg target ${SOURCE}")
            # message("-> Library source ${OUTPUT}")
            list(APPEND LIB_SOURCES ${OUTPUT})
        else()
            # message("-> Library source ${SOURCE}")
            list(APPEND LIB_SOURCES ${SOURCE})
        endif()
    endforeach()

    add_library(${target} STATIC ${LIB_SOURCES})
endfunction()

function(roars_executable target)
    foreach(SOURCE IN LISTS ARGN)
        get_filename_component(FILE_TYPE ${SOURCE} EXT)
        if(${FILE_TYPE} STREQUAL ".pgs")
            ecpg_target(${SOURCE} OUTPUT)
            # message("-> ecpg source ${SOURCE}")
            # message("-> Executable source ${OUTPUT}")
            list(APPEND LIB_SOURCES ${OUTPUT})
        else()
            # message("-> Executable source ${SOURCE}")
            list(APPEND LIB_SOURCES ${SOURCE})
        endif()
    endforeach()

    add_executable(${target} ${LIB_SOURCES})
endfunction()

function(ecpg_target source output)
    get_filename_component(FILE_NAME ${SOURCE} NAME_WE)
    
    add_custom_command(OUTPUT ecpg/${FILE_NAME}.c
    COMMAND ${CMAKE_COMMAND} -E make_directory ecpg
    COMMAND ${ECPG} ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE} -o ecpg/${FILE_NAME}.c
    MAIN_DEPENDENCY ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCE}
    COMMENT "ECPG Build ${SOURCE}"
    )

    set(${output} ecpg/${FILE_NAME}.c PARENT_SCOPE)
endfunction()

function(printall)
    get_cmake_property(_variableNames VARIABLES)
    list (SORT _variableNames)
    foreach (_variableName ${_variableNames})
        message(STATUS "${_variableName}=${${_variableName}}")
    endforeach()
endfunction()