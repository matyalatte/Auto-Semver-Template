#!/bin/bash

if [ -e version.txt ]; then
    ver=$(head -1 version.txt)
else
    ver="0.0.0"
fi

# Update version
IFS=. read major minor patch<<<"${ver}"
if [ "$1" = "major" ]; then
    major=$(($major + 1));
    minor=0;
    patch=0;
elif [ "$1" = "minor" ]; then
    minor=$(($minor + 1));
    patch=0;
elif [ "$1" = "patch" ]; then
    patch=$(($patch + 1))
fi

# Write new version
ver="${major}.${minor}.${patch}"
echo $ver > version.txt

# Write commit date and hash (You can use them if git is not installed in your machine.)
git_date=$(TZ=UTC0 git show -s --date=format-local:%Y-%m-%d-%H:%M:%S --format=%cd)
git_hash=$(git rev-parse HEAD)
echo ${git_date:0:10} >> version.txt
echo $git_hash >> version.txt

# Replace all @next_version@ with the updated version
if [ "$1" != "" ]; then
    sed -i "s/@next_version@/${ver}/g" api.h
fi
