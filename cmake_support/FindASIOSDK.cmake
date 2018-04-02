# $Id: $
#
# - Try to find the openASIO SDK
# Once done this will define
#
#  openASIOSDK_FOUND - system has openASIO SDK
#  openASIOSDK_INCLUDE_DIR - path to the openASIO SDK base directory

if(WIN32)
else(WIN32)
  message(FATAL_ERROR "FindASIOSDK.cmake: Unsupported platform ${CMAKE_SYSTEM_NAME}" )
endif(WIN32)

file(GLOB results "${CMAKE_CURRENT_SOURCE_DIR}/../as*")
foreach(f ${results})
  if(IS_DIRECTORY ${f})
    set(ASIOSDK_PATH_HINT ${ASIOSDK_PATH_HINT} ${f})
  endif()
endforeach()

find_path(ASIOSDK_INCLUDE_DIR
  asio-wrapper.hpp
  HINTS
    ${ASIOSDK_PATH_HINT}
)


# handle the QUIETLY and REQUIRED arguments and set ASIOSDK_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(ASIOSDK DEFAULT_MSG ASIOSDK_INCLUDE_DIR)

MARK_AS_ADVANCED(
    ASIOSDK_INCLUDE_DIR
)
