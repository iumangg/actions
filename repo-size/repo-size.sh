# Define a reusable function to format sizes
format_size() {
  awk '{size=$1; unit=substr(size, length(size), 1); size=substr(size, 1, length(size)-1);
  if (unit=="G") print size " GB";
  else if (unit=="M") print size " MB";
  else if (unit=="K") print size " KB";
  else print size " B";}'
}

# Create or replace repo size data file
> $repo_size_file

# Calculate size of the root directory
echo "root: $(du -sh . | format_size)" >> $repo_size_file

# Calculate size of each first-level subfolder (sorted)
find . -mindepth 1 -maxdepth 1 -type d | sort | while read -r dir; do
  echo "  $(basename "$dir"): $(du -sh "$dir" | format_size)" >> $repo_size_file

  # Calculate size of each second-level subfolder (sorted)
  find "$dir" -mindepth 1 -maxdepth 1 -type d | sort | while read -r subdir; do
  echo "    $(basename "$subdir"): $(du -sh "$subdir" | format_size)" >> $repo_size_file
  done
done