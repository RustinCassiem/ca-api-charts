#!/bin/bash
# Script to initialize gh-pages branch for Helm chart repository

# Check if gh-pages branch exists
if ! git ls-remote --heads origin gh-pages | grep -q gh-pages; then
    echo "Creating gh-pages branch..."
    
    # Get current branch to return to it later
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    
    # Create and switch to a new orphan branch (no parent commit)
    git checkout --orphan gh-pages
    
    # Remove all files from staging
    git rm -rf .
    
    # Create an empty index.yaml file
    echo "apiVersion: v1
entries: {}
generated: \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"" > index.yaml
    
    # Stage and commit the index.yaml file
    git add index.yaml
    git commit -m "Initialize gh-pages branch for Helm chart repository"
    
    # Push the branch to remote
    git push origin gh-pages
    
    # Return to the original branch
    git checkout "$CURRENT_BRANCH"
    
    echo "✅ gh-pages branch created successfully!"
    echo "Next steps:"
    echo "1. Enable GitHub Pages in repository settings"
    echo "   Go to Settings > Pages and select gh-pages branch"
    echo "2. Run your chart release workflow again"
else
    echo "gh-pages branch already exists."
fi
