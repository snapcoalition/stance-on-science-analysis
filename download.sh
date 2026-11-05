#!/bin/bash
set -e

echo "Creating target directory data/..."
mkdir -p data
cd data

echo "Cloning repository structure..."
git clone --depth 1 --filter=blob:none --sparse --branch source https://github.com/snapcoalition/SNAPscipolorg.github.io.git

cd SNAPscipolorg.github.io

echo "Fetching specific folders..."
git sparse-checkout set _data/stance_questions _data/stance_responses

echo "Moving folders directly to data/..."
# Move the target folders up one level (into the 'data' directory)
mv _data/stance_questions ../
mv _data/stance_responses ../

echo "Cleaning up repository wrapper..."
# Go back up to the 'data' directory
cd ..
rm -rf SNAPscipolorg.github.io

echo "Download complete."