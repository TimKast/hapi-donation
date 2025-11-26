#!/bin/bash

# Script: convert-js-to-ts.sh
# Funktion: Benennt alle .js Dateien rekursiv in .ts um

# Pfad als Argument oder aktuelles Verzeichnis
TARGET_DIR="${1:-.}"

echo "Suche .js Dateien in: $TARGET_DIR"
echo

# Alle .js Dateien finden (ohne node_modules)
find "$TARGET_DIR" -type f -name '*.js' -not -path '*/node_modules/*' -print0 |
while IFS= read -r -d '' file; do
    newfile="${file%.js}.ts"
    echo "Umbenennen: $file -> $newfile"
    mv "$file" "$newfile"
done

echo
echo "Fertig!"

