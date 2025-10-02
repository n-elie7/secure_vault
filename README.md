# CyberSec-Ops
The Secure Vault Challenge

# Secure Vault System

A comprehensive Linux-based security project designed for junior cybersecurity teams to learn file permissions, access control, and security monitoring fundamentals.

## Project Overview

The Secure Vault System is a shell-based application that demonstrates core cybersecurity principles through practical implementation. It creates a secure storage environment for sensitive data with proper access controls, monitoring capabilities, and operational security measures.

## Learning Objectives

- **File System Security**: Understanding Linux file permissions and access control
- **Data Protection**: Implementing secure storage for sensitive information
- **Security Monitoring**: Automated detection of security risks and vulnerabilities
- **Operational Security**: Safe handling of secrets and confidential data
- **Shell Scripting**: Advanced bash programming for security applications

## System Architecture

```
secure-vault/
├── vault_setup.sh          # Step 1: Initial vault creation
├── vault_permissions.sh    # Step 2: Permission management
├── vault_ops.sh            # Step 3: Operational interface
├── vault_monitor.sh        # Step 4: Security monitoring
└── README.md               # This file

~/secure_vault/             # Created by scripts
├── keys.txt                # Encryption keys (600 permissions)
├── secrets.txt             # Confidential data (640 permissions)  
├── logs.txt                # System activity logs (644 permissions)
└── vault_report.txt        # Security monitoring reports
```

## Project Files

### `vault_setup.sh` - Step 1: Vault Setup
Creates the foundational vault structure with secure defaults.

**Features:**
- Automated directory and file creation in `~/secure_vault`
- Welcome message initialization using I/O redirection
- File listing verification with `ls -l`
- Home directory integration

**Usage:**
```bash
./vault_setup.sh
```

---

### `vault_permissions.sh` - Step 2: Vault Permissions
Interactive permission management system for fine-grained access control.

**Features:**
- Pre-flight directory validation
- Interactive permission configuration for each file
- Default security settings application:
  - `keys.txt`: 600
  - `secrets.txt`: 640
  - `logs.txt`: 644
- Permission verification display
- Input validation and error handling

**Usage:**
```bash
./vault_permissions.sh
```

---

### `vault_ops.sh` - Step 3: Vault Operations
Menu-driven operational interface for secure data management.

**Menu Options:**
1. **Add Secret**: Append new confidential data to `secrets.txt`
2. **Update Secret**: Replace existing entries using `sed -i`
3. **Add Log Entry**: Add timestamped activity logs
4. **Access Keys**: Security barrier (always returns "ACCESS DENIED 🚫")
5. **Exit**: Clean session termination

**Usage:**
```bash
./vault_ops.sh
```

---

### `vault_monitor.sh` - Step 4: Vault Monitoring
Automated security assessment and reporting system.

**Features:**
- File metadata analysis (size, modification date, permissions)
- Security risk detection for files with permissions more open than 644
- Comprehensive report generation saved to `vault_report.txt`
- Visual security status indicators

**Usage:**
```bash
./vault_monitor.sh
```

## Installation & Setup

### Prerequisites
- Linux/Unix environment
- Bash shell (version 4.0+)
- Standard Unix utilities (`chmod`, `stat`, `sed`, `date`)

### Installation Steps

1. **Create project directory and add script files:**
   ```bash
   mkdir secure-vault
   cd secure-vault
   ```

2. **Create the four script files** with the provided code:
   - `vault_setup.sh`
   - `vault_permissions.sh`
   - `vault_ops.sh`
   - `vault_monitor.sh`

3. **Make all scripts executable:**
   ```bash
   chmod +x vault_setup.sh vault_permissions.sh vault_ops.sh vault_monitor.sh
   ```

4. **Verify installation:**
   ```bash
   ls -l *.sh
   ```

## Usage Workflow

### Complete System Deployment

Run the scripts in order for full system setup:

```bash
# Step 1: Create the vault structure
./vault_setup.sh

# Step 2: Configure file permissions
./vault_permissions.sh

# Step 3: Perform vault operations
./vault_ops.sh

# Step 4: Monitor security status
./vault_monitor.sh
```

### Individual Script Usage

Each script can be run independently after the initial setup:

**Adding new secrets:**
```bash
./vault_ops.sh
# Select option 1 from menu
```

**Checking security status:**
```bash
./vault_monitor.sh
```

**Reconfiguring permissions:**
```bash
./vault_permissions.sh
```

## Configuration

### Default File Permissions
- `keys.txt`: **600** (owner read/write only)
- `secrets.txt`: **640** (owner read/write, group read)
- `logs.txt`: **644** (owner read/write, group/others read)

### Security Thresholds
- **Risk Detection**: Files with permissions more open than 644
- **Access Control**: Complete denial for encryption keys
- **Audit Trail**: All operations timestamped and logged

## 📊 Security Features

### Access Control Matrix
| Component | Owner | Group | Others | Security Level |
|-----------|-------|-------|---------|----------------|
| Keys      | rw    | -     | -       | Maximum        |
| Secrets   | rw    | r     | -       | High           |
| Logs      | rw    | r     | r       | Standard       |

### Security Measures
- ✅ **Principle of Least Privilege**: Minimal required permissions
- ✅ **Defense in Depth**: Multiple security layers
- ✅ **Access Denial**: Protected key storage
- ✅ **Audit Logging**: Complete activity tracking
- ✅ **Risk Monitoring**: Automated threat detection
- ✅ **Input Validation**: Secure user interaction

## Monitoring & Reporting

The monitoring script generates detailed security reports including:
- File integrity metrics
- Permission analysis
- Security risk assessments
- Activity timestamps
- Compliance verification

**Sample Report Output:**
```
SECURE VAULT MONITORING REPORT
===============================
Generated on: 2025-01-15 14:30:45

📄 File: keys.txt | Size: 52 bytes | Modified: 2025-01-15 14:25:30 | Permissions: 600
📄 File: secrets.txt | Size: 128 bytes | Modified: 2025-01-15 14:28:15 | Permissions: 640
📄 File: logs.txt | Size: 245 bytes | Modified: 2025-01-15 14:29:50 | Permissions: 644
✅ No security risks detected - All file permissions are appropriate
```

## Security Considerations

### Known Limitations
- File contents stored in plaintext (educational purposes)
- No encryption implementation
- Local storage only (no network security)
- Basic access control (no advanced authentication)

### Best Practices Applied
- Secure file permissions
- Input sanitization
- Error handling
- Audit trail maintenance
- Risk assessment automation

## Troubleshooting

### Common Issues

**"Directory does not exist" error:**
```bash
# Ensure vault setup has been run first
./vault_setup.sh
```

**Permission denied when running scripts:**
```bash
# Make scripts executable
chmod +x *.sh
```

**Invalid permission format in vault_permissions.sh:**
```bash
# Use 3-digit octal notation (e.g., 600, 755)
# Valid range: 000-777
```

**Cannot find secure_vault directory:**
```bash
# Check if it was created in home directory
ls -la ~/secure_vault

# If not, run setup again
./vault_setup.sh
```

## Educational Value

This project demonstrates:
- **Systems Administration**: File management and permissions
- **Security Engineering**: Access control implementation  
- **Risk Management**: Threat detection and assessment
- **Operational Security**: Secure procedures and protocols
- **Compliance**: Security standard adherence
- **Modular Design**: Separation of concerns across multiple scripts

## Project Submission

When submitting this project, include:
- ✅ All four script files (`vault_setup.sh`, `vault_permissions.sh`, `vault_ops.sh`, `vault_monitor.sh`)
- ✅ This README.md file
- ✅ A generated `vault_report.txt` as evidence of execution

## 📄 License

This project is designed for educational purposes. Feel free to modify and extend for learning objectives.

---

**⚠️ Disclaimer**: This system is for educational purposes only. Do not use for storing actual sensitive data without implementing proper encryption and additional security measures.e