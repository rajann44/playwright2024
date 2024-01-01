#!/bin/bash

# Function to make a commit with a specific date
make_commit() {
    local date="$1"
    local message="$2"
    local file="$3"
    local content="$4"
    
    # Update the file
    echo "$content" > "$file"
    
    # Stage and commit with the specified date
    git add "$file"
    GIT_COMMITTER_DATE="$date" git commit -m "$message" --date="$date"
}

# Function to update package.json version
update_version() {
    local version="$1"
    local file="package.json"
    local content=$(cat "$file")
    echo "$content" | sed "s/\"version\": \".*\"/\"version\": \"$version\"/" > "$file"
}

# Function to update README with new features
update_readme() {
    local feature="$1"
    local file="README.md"
    local content=$(cat "$file")
    echo "$content" | sed "s/## Features/## Features\n- $feature/" > "$file"
}

# Function to update a component
update_component() {
    local component="$1"
    local file="src/app/page.tsx"
    local content=$(cat "$file")
    echo "$content" | sed "s/return (/return (\n    <div className=\"$component\">\n      <h2>New $component Component<\/h2>\n    <\/div>\n    /" > "$file"
}

# Function to update CSS
update_css() {
    local style="$1"
    local file="src/app/globals.css"
    local content=$(cat "$file")
    echo "$content" | sed "s/\/\* Custom styles \*\//\/\* Custom styles \*\/\n$style/" > "$file"
}

# Function to update config
update_config() {
    local config="$1"
    local file="next.config.ts"
    local content=$(cat "$file")
    echo "$content" | sed "s/\/\/ Config/\/\/ Config\n$config/" > "$file"
}

# Array of weekdays (0 = Sunday, 1 = Monday, etc.)
weekdays=(0 1 2 3 4 5 6)  # All days of the week

# Array of features to add
features=(
    "Added dark mode support"
    "Implemented responsive design"
    "Added user authentication"
    "Integrated API endpoints"
    "Added error handling"
    "Implemented caching"
    "Added loading states"
    "Implemented search functionality"
    "Added data persistence"
    "Implemented real-time updates"
    "Added analytics tracking"
    "Implemented notifications"
    "Added file upload"
    "Implemented pagination"
    "Added sorting functionality"
    "Implemented filtering"
    "Added export feature"
    "Implemented import feature"
    "Added print functionality"
    "Implemented sharing"
    "Added favorites"
    "Implemented bookmarks"
    "Added comments"
    "Implemented ratings"
    "Added user profiles"
    "Implemented settings"
    "Added help documentation"
    "Implemented tutorials"
    "Added keyboard shortcuts"
    "Implemented drag and drop"
    "Added progress tracking"
    "Implemented milestones"
    "Added achievements"
    "Implemented badges"
    "Added leaderboard"
    "Implemented social features"
    "Added chat functionality"
    "Implemented video calls"
    "Added screen sharing"
    "Implemented collaboration"
    "Added version control"
    "Implemented backups"
    "Added restore functionality"
    "Implemented auto-save"
    "Added offline support"
    "Implemented sync"
    "Added cloud storage"
    "Implemented encryption"
    "Added security features"
    "Implemented 2FA"
)

# Array of components to add
components=(
    "header"
    "footer"
    "sidebar"
    "navigation"
    "menu"
    "modal"
    "tooltip"
    "dropdown"
    "accordion"
    "tabs"
    "carousel"
    "slider"
    "calendar"
    "datepicker"
    "timepicker"
    "form"
    "input"
    "button"
    "checkbox"
    "radio"
    "select"
    "textarea"
    "file-upload"
    "progress"
    "spinner"
    "alert"
    "notification"
    "badge"
    "card"
    "table"
    "list"
    "grid"
    "chart"
    "map"
    "gallery"
    "player"
    "editor"
    "viewer"
    "preview"
    "search"
    "filter"
    "sort"
    "pagination"
    "breadcrumb"
    "steps"
    "timeline"
    "tree"
    "menu"
    "tabs"
    "modal"
)

# Array of CSS styles to add
styles=(
    ".dark-mode { background-color: #1a1a1a; color: #ffffff; }"
    ".responsive { max-width: 100%; height: auto; }"
    ".flex-container { display: flex; flex-wrap: wrap; }"
    ".grid-layout { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); }"
    ".card { box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); }"
    ".hover-effect { transition: transform 0.3s ease; }"
    ".gradient-bg { background: linear-gradient(45deg, #ff6b6b, #4ecdc4); }"
    ".animation { animation: fadeIn 0.5s ease-in; }"
    ".custom-scrollbar { scrollbar-width: thin; }"
    ".glass-effect { backdrop-filter: blur(10px); }"
)

# Array of config updates
configs=(
    "export const config = { experimental: { appDir: true } };"
    "export const config = { images: { domains: ['example.com'] } };"
    "export const config = { i18n: { locales: ['en', 'es'] } };"
    "export const config = { env: { API_URL: process.env.API_URL } };"
    "export const config = { webpack: (config) => { return config; } };"
    "export const config = { poweredByHeader: false };"
    "export const config = { compress: true };"
    "export const config = { reactStrictMode: true };"
    "export const config = { swcMinify: true };"
    "export const config = { trailingSlash: true };"
)

# Array of commit messages
commit_messages=(
    "Update dependencies"
    "Fix typo in documentation"
    "Improve error handling"
    "Optimize performance"
    "Refactor code structure"
    "Add unit tests"
    "Update documentation"
    "Fix bug in component"
    "Enhance user experience"
    "Implement new feature"
    "Clean up code"
    "Update README"
    "Fix security issue"
    "Add new component"
    "Improve accessibility"
    "Update styling"
    "Fix responsive design"
    "Add loading state"
    "Implement caching"
    "Update configuration"
)

# Start from January 1, 2020
start_date="2020-01-01"
end_date="2020-12-31"

current_date="$start_date"
feature_index=0
component_index=0
style_index=0
config_index=0
message_index=0

while [ "$(date -j -f "%Y-%m-%d" "$current_date" +%s)" -le "$(date -j -f "%Y-%m-%d" "$end_date" +%s)" ]; do
    # Get the day of week (0-6, where 0 is Sunday)
    day_of_week=$(date -j -f "%Y-%m-%d" "$current_date" +%w)
    
    # Check if this is one of our target weekdays
    if [[ " ${weekdays[@]} " =~ " $day_of_week " ]]; then
        # Random number of commits for this day (1-7)
        num_commits=$((RANDOM % 7 + 1))
        
        # Make commits for this day
        for i in $(seq 1 $num_commits); do
            # Random hour between 9 AM and 6 PM
            hour=$((RANDOM % 10 + 9))
            # Random minute
            minute=$((RANDOM % 60))
            
            # Format time
            time=$(printf "%02d:%02d:00" $hour $minute)
            
            # Randomly choose what type of commit to make
            commit_type=$((RANDOM % 5))
            
            case $commit_type in
                0)
                    # Version update
                    version="0.$((RANDOM % 10)).$((RANDOM % 10))"
                    update_version "$version"
                    make_commit "$current_date $time" "Bump version to $version" "package.json" "$(cat package.json)"
                    ;;
                1)
                    # Feature update
                    feature="${features[$feature_index]}"
                    update_readme "$feature"
                    make_commit "$current_date $time" "$feature" "README.md" "$(cat README.md)"
                    feature_index=$((feature_index + 1))
                    ;;
                2)
                    # Component update
                    component="${components[$component_index]}"
                    update_component "$component"
                    make_commit "$current_date $time" "Add $component component" "src/app/page.tsx" "$(cat src/app/page.tsx)"
                    component_index=$((component_index + 1))
                    ;;
                3)
                    # CSS update
                    style="${styles[$style_index]}"
                    update_css "$style"
                    make_commit "$current_date $time" "Add new styles" "src/app/globals.css" "$(cat src/app/globals.css)"
                    style_index=$((style_index + 1))
                    ;;
                4)
                    # Config update
                    config="${configs[$config_index]}"
                    update_config "$config"
                    make_commit "$current_date $time" "Update configuration" "next.config.ts" "$(cat next.config.ts)"
                    config_index=$((config_index + 1))
                    ;;
            esac
            
            # Reset indices if we've used all items
            if [ $feature_index -ge ${#features[@]} ]; then feature_index=0; fi
            if [ $component_index -ge ${#components[@]} ]; then component_index=0; fi
            if [ $style_index -ge ${#styles[@]} ]; then style_index=0; fi
            if [ $config_index -ge ${#configs[@]} ]; then config_index=0; fi
        done
    fi
    
    # Move to next day
    current_date=$(date -j -v+1d -f "%Y-%m-%d" "$current_date" +%Y-%m-%d)
done

# Push all changes to GitHub
git push -f origin main 