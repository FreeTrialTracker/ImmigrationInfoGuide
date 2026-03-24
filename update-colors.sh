#!/bin/bash

# Script to update teal colors to the new ImmigrationInfoGuide brand colors
# Primary: #4F46E5 (indigo-600), Action: #3B82F6 (blue-500)

# Color mapping:
# teal-50 -> indigo-50
# teal-100 -> indigo-100
# teal-200 -> indigo-200
# teal-500 -> brand-primary
# teal-600 -> brand-primary
# teal-700 -> brand-primary-hover or indigo-700
# bg-teal-50 -> bg-indigo-50
# text-teal-600 -> text-brand-primary
# text-teal-700 -> text-indigo-700
# hover:bg-teal-700 -> hover:bg-brand-primary-hover
# hover:text-teal-600 -> hover:text-brand-primary
# focus:ring-teal-500 -> focus:ring-brand-primary
# border-teal-200 -> border-indigo-200

echo "Updating colors in all TSX files..."

# Find all TSX and TSX files and update them
find ./app ./components -type f \( -name "*.tsx" -o -name "*.ts" \) | while read file; do
  echo "Processing $file"
done

echo "Color update script completed!"
echo "Note: This script shows what needs to be done."
echo "Actual updates will be done via Edit tool."
