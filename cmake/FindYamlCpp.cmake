set(_yamlcpp_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})

find_path(YamlCpp_INCLUDE_PATH yaml-cpp/yaml.h)

if (YamlCpp_STATIC)
  if (WIN32)
    set(CMAKE_FIND_LIBRARY_SUFFIXES .lib ${CMAKE_FIND_LIBRARY_SUFFIXES})
  endif (WIN32)
  if (APPLE)
    set(CMAKE_FIND_LIBRARY_SUFFIXES .lib ${CMAKE_FIND_LIBRARY_SUFFIXES})
  else (APPLE)
    set(CMAKE_FIND_LIBRARY_SUFFIXES .a ${CMAKE_FIND_LIBRARY_SUFFIXES})
  endif (APPLE)
endif (YamlCpp_STATIC)
find_library(YamlCpp_LIBRARY NAMES yaml-cppmt yaml-cpp)
if(YamlCpp_INCLUDE_PATH AND YamlCpp_LIBRARY)
  set(YamlCpp_FOUND TRUE)
endif(YamlCpp_INCLUDE_PATH AND YamlCpp_LIBRARY)
if(YamlCpp_FOUND)
  if(NOT YamlCpp_FIND_QUIETLY)
    message(STATUS "Found yaml-cpp: ${YamlCpp_LIBRARY}")
  endif(NOT YamlCpp_FIND_QUIETLY)
else(YamlCpp_FOUND)
  if(YamlCpp_FIND_REQUIRED)
    message(FATAL_ERROR "Could not find yaml-cpp library.")
  endif(YamlCpp_FIND_REQUIRED)
endif(YamlCpp_FOUND)

set(CMAKE_FIND_LIBRARY_SUFFIXES ${_yamlcpp_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES})
