#!/bin/bash

echo "==== VAULT SETUP ===="
echo "Setting up Secure Vault System..."

VAULT_DIR="$HOME/secure_vault"
mkdir -p "$VAULT_DIR"

# 3 files in VAULT_DIR
echo "Welcome to the encryption keys storage - Handle with extreme care!" > "$VAULT_DIR/keys.txt"
echo "Confidential secrets storage - Authorized personnel only!" > "$VAULT_DIR/secrets.txt"
echo "Security monitoring logs - System activity tracked here!" > "$VAULT_DIR/logs.txt"

echo "✅ Secure Vault created successfully!"
echo "📁 Vault contents:"
ls -l "$VAULT_DIR"
