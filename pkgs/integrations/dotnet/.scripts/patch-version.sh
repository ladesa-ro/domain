#!/usr/bin/env bash

set -e

#

PKG_JSON_PATH=package.json
PKG_JSON_QUERY_VERSION=".version"

DIR_BUILD_PROPS_PATH=ladesa-domain-v4-sln/Directory.Build.props
DIR_BUILD_PROPS_QUERY_VERSION=".Project.PropertyGroup[1].Version"

#

pkg_json_version=$(cat ${PKG_JSON_PATH} | jq -r ${PKG_JSON_QUERY_VERSION})
echo Target version: ${pkg_json_version}

#

dir_build_props_content=$(cat ${DIR_BUILD_PROPS_PATH})

# adapted from source: https://stackoverflow.com/a/44980159
dir_build_props_content_patched=$(sed "s|<Version>.*</Version>|<Version>${pkg_json_version}</Version>|g" ${DIR_BUILD_PROPS_PATH})

echo "${dir_build_props_content_patched}" > ${DIR_BUILD_PROPS_PATH}
