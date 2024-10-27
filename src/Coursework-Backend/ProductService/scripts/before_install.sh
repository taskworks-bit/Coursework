# Linux deployment scripts (before_install.sh)
#!/bin/bash
# Install .NET SDK if not presentif ! command -v dotnet &> /dev/null; then
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    sudo apt-get update
    sudo apt-get install -y dotnet-sdk-8.0
fi

# stop_application.sh
#!/bin/bash
if pgrep -f "ProductService" > /dev/null; then
    pkill -f "ProductService"
fi