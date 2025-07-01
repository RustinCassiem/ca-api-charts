# Manual Release Process

If the automated chart-releaser is having permission issues, you can manually release charts using these steps:

## Prerequisites

1. Install chart-releaser CLI:
```bash
# Using Homebrew (macOS)
brew install chart-releaser

# Using GitHub releases (Linux/Windows)
# Download from: https://github.com/helm/chart-releaser/releases
```

2. Set up GitHub personal access token with repo permissions

## Manual Release Steps

### 1. Package Charts
```bash
make package
```

### 2. Create GitHub Releases
```bash
# Set your GitHub token
export CR_TOKEN="your-personal-access-token"

# Upload and create releases
cr upload --owner RustinCassiem --git-repo ca-api-charts

# Update index
cr index --owner RustinCassiem --git-repo ca-api-charts --push
```

### 3. Alternative Using GitHub CLI
```bash
# Install GitHub CLI
# https://cli.github.com/

# Authenticate
gh auth login

# Create releases for each chart
gh release create druid-1.0.17 dist/druid-1.0.17.tgz --title "Druid Chart v1.0.17" --notes "Druid analytics chart release"
gh release create gateway-3.0.34 dist/gateway-3.0.34.tgz --title "Gateway Chart v3.0.34" --notes "Layer7 Gateway chart release"
gh release create portal-2.3.16 dist/portal-2.3.16.tgz --title "Portal Chart v2.3.16" --notes "API Developer Portal chart release"
gh release create gateway-otk-2.0.3 dist/gateway-otk-2.0.3.tgz --title "Gateway OTK Chart v2.0.3" --notes "Gateway with OAuth Toolkit chart release"
gh release create ca-api-management-1.0.0 dist/ca-api-management-1.0.0.tgz --title "CA API Management Suite v1.0.0" --notes "Complete API management umbrella chart"
```

## Repository Setup for Chart Repository

If you want to host these as a proper Helm chart repository:

### 1. Enable GitHub Pages
- Go to repository Settings → Pages
- Set source to "Deploy from a branch"
- Choose "gh-pages" branch

### 2. Generate index.yaml
```bash
# Create gh-pages branch
git checkout --orphan gh-pages
git rm -rf .

# Create index file
helm repo index . --url https://rustincassiem.github.io/ca-api-charts/

# Add and commit
git add index.yaml
git commit -m "Initial chart repository index"
git push origin gh-pages
```

### 3. Use the Chart Repository
```bash
helm repo add ca-api-charts https://rustincassiem.github.io/ca-api-charts/
helm repo update
helm search repo ca-api-charts
```

## Troubleshooting

### Permission Issues
- Ensure the GitHub token has `contents:write` and `metadata:read` permissions
- For organization repositories, token may need additional org permissions

### Repository Access
- Verify the repository name matches: `RustinCassiem/ca-api-charts`
- Check if the repository is public (required for GitHub Pages)

### Token Scope
Required token scopes:
- `repo` (full repository access)
- `workflow` (if modifying workflows)
- `write:packages` (for GitHub Packages)
