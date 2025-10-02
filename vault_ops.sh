#!/bin/bash

echo "=== VAULT OPERATIONS ==="

VAULT_DIR="$HOME/secure_vault"

if [[ ! -d "$VAULT_DIR" ]]; then
    echo "❌ ERROR: secure_vault directory does not exist!"
    echo "Please run vault_setup.sh first."
    exit 1
fi

echo "Welcome to Secure Vault Operations"
echo "===================================="

while true; do
    echo ""
    echo "Select an option:"
    echo "1. Add Secret"
    echo "2. Update Secret" 
    echo "3. Add Log Entry"
    echo "4. Access Keys"
    echo "5. Exit"
    echo -n "Enter your choice (1-5): "
    read -r choice
    
    case "$choice" in
        1)
            echo -n "Enter new secret: "
            read -r secret
            echo "$secret" >> "$VAULT_DIR/secrets.txt"
            echo "✅ Secret added successfully!"
            ;;
        2)
            echo -n "Enter text to replace: "
            read -r old_text
            echo -n "Enter replacement text: "
            read -r new_text
            
            if grep -q "$old_text" "$VAULT_DIR/secrets.txt"; then
                sed -i "s/$old_text/$new_text/g" "$VAULT_DIR/secrets.txt"
                echo "✅ Secret updated successfully!"
            else
                echo "❌ No match found."
            fi
            ;;
        3)
            timestamp=$(date '+%Y-%m-%d %H:%M:%S')
            echo -n "Enter log entry: "
            read -r log_entry
            echo "[$timestamp] $log_entry" >> "$VAULT_DIR/logs.txt"
            echo "✅ Log entry added successfully!"
            ;;
        4)
            echo "ACCESS DENIED ❌"
            ;;
        5)
            echo "Exiting Vault Operations..."
            break
            ;;
        *)
            echo "❌ Invalid choice. Please enter 1-5."
            ;;
    esac
done
