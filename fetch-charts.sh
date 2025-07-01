#!/bin/bash
# Clone only the charts folder from stable branch with sparse checkout

# Remove old temp folder if it exists
if [ -d "temp-repo" ]; then
    echo "Removing existing temp-repo folder..."
    rm -rf temp-repo
fi

# Clone repo with no checkout, depth 1, stable branch
echo "Cloning repository..."
git clone --depth 1 --filter=blob:none --no-checkout --branch stable https://github.com/CAAPIM/apim-charts.git temp-repo

cd temp-repo

# Initialize sparse checkout and set to charts folder
echo "Setting up sparse checkout..."
git sparse-checkout init --cone
git sparse-checkout set charts

# Checkout the sparse files (will download only charts)
echo "Checking out charts folder..."
git checkout

cd ..

# Create external/charts folder if missing
if [ ! -d "charts" ]; then
    echo "Creating charts directory..."
    mkdir -p charts
fi

# Copy charts folder to external/charts
echo "Copying charts..."
cp -r temp-repo/charts/* charts/

# Cleanup temp folder
echo "Cleaning up temporary files..."
rm -rf temp-repo

echo "Done fetching charts folder!"
read -p "Press any key to continue..."
