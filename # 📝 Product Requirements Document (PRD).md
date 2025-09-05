# 📝 Product Requirements Document (PRD)

## Bash Script 1 – Time Logger

### Overview
This script runs every 10 seconds and appends the current system time to a designated log file. Each execution adds a new line with the timestamp.

### Functional Requirements
- **Execution Interval**: Every 10 seconds
- **Output Format**: `HH:MM:SS` (24-hour format)
- **Log File**: `/var/log/time_logger.log` (or configurable path)
- **Append Mode**: Each run adds a new line without overwriting previous entries

### Technical Specifications
- **Language**: Bash
- **Time Format**: `date +"%H:%M:%S"`
- **Loop Control**: Infinite loop with `sleep 10`, interr uptible via signal
- **Permissions**:
  - Script: Executable by the user (`chmod +x time_logger.sh`)
  - Log File: Writable by the script owner or group (`chmod 664`, owned by `logger` group)
  - Directory: Ensure write access to `/var/log/` or use user-level directory like `~/logs/`

### Security & Access
- Script should not run as root unless necessary
- Log file should be protected from unauthorized modification
- Use `chown` to assign ownership to a dedicated service user

### Termination Strategy
- Manual stop via `Ctrl+C` (SIGINT)
- Optional control file mechanism:
  ```bash
  if [ -f stop.flag ]; then exit; fi