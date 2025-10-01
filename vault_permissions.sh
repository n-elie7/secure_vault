#!/bin/bash

echo "==== VAULT PERMISSIONS ===="

VAULT_DIR="$HOME/secure_vault"

# Check if secure_vault exists
if [[ ! -d "$VAULT_DIR" ]]; then
    echo "❌ ERROR: secure_vault directory does not exist!"
    echo "Please run vault_setup.sh first."
    exit 1
fi

# Function to update permissions
update_permission() {
    local file="$1"
    local default_perm="$2"
    
    echo "📄 Current permission for $(basename "$file"):"
    ls -l "$file"
    
    echo -n "Do you want to update the permission? (y/n/Enter for default): "
    read -r response
    
    case "$response" in
        [Yy]*)
            echo -n "Enter new permission (e.g., 600): "
            read -r new_perm
            if [[ "$new_perm" =~ ^[0-7]{3}$ ]]; then
                chmod "$new_perm" "$file"
                echo "✅ Permission updated to $new_perm"
            else
                echo "❌ Invalid permission format. Keeping current permission."
            fi
            ;;
        [Nn]*)
            echo "⏭️ Keeping current permission"
            ;;
        "")
            chmod "$default_perm" "$file"
            echo "✅ Applied default permission: $default_perm"
            ;;
        *)
            echo "⏭️ Invalid input. Keeping current permission"
            ;;
    esac
    echo ""
}

echo "Managing vault permissions..."
echo ""

# Update permissions for each file
update_permission "$VAULT_DIR/keys.txt" "600"
update_permission "$VAULT_DIR/secrets.txt" "640" 
update_permission "$VAULT_DIR/logs.txt" "644"

echo "📋 Final file permissions:"
ls -l "$VAULT_DIR"
