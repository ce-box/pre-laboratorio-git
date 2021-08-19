#!/bin/bash -l

# Check for copyright comment in *.py filess
if [[ ! `egrep -ir "^#.*copyright.*$" --include="*.py"` ]]; then
    echo "ERROR: There is no copyright comment in the file: : .py"
    exit 1
fi

# Check for copyright comment in *.js filess
if [[ ! `egrep -ir "^//.*copyright.*$" --include="*.js"` ]]; then
    echo "ERROR: There is no copyright comment in the file: : .js"
    exit 1
fi

# Check for copyright comment in *.cs filess
if [[ ! `egrep -ir "^//.*copyright.*$" --include="*.cs"` ]]; then
    echo "ERROR: There is no copyright comment in the file: : .cs"
    exit 1
fi

# Check for copyright comment in *.cs filess
if [[ ! `egrep -ir "^//.*copyright.*$" --include="*.java"` ]]; then
    echo "ERROR: There is no copyright comment in the file: : .java"
    exit 1
fi

# Check for commit message structure
word="JIRA-[0-9]+"
isPresent=$(grep -Eoh "$word" $1)

if [[ -z $isPresent ]]
  then echo "Commit message KO, $word is missing"; exit 1;
  else echo "Commit message OK"; exit 0;
fi
