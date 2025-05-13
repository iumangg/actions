# Check if the user name is empty string
if [ -z "$user_name" ]; then
  echo "User name is provided empty string. Using default user name 'github-actions[bot]'."
  user_name="github-actions[bot]"
fi

# Check if the user email is empty string
if [ -z "$user_email" ]; then
  echo "User email is provided empty string. Using default user email '41898282+github-actions[bot]@users.noreply.github.com'."
  user_email="41898282+github-actions[bot]@users.noreply.github.com"
fi

# Set Git user name
git config --global user.name "$user_name"
echo "Git user name is set to $user_name"

# Set Git user email
git config --global user.email "$user_email"
echo "Git user email is set to $user_email"
