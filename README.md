# scripts
A bunch of useful shell scripts


# Usage
1. Clone this repository into your home directory `cd ~ && git clone git@github.com:bhergert-slack/scripts.git`
2. Add this snippet to your `~/.zshrc` file so you can invoke the functions defined in the repo from anywhere:
```
# Source all scripts in `~/scripts`
for file in ~/scripts/*.sh; do
    source "$file"
done
```
