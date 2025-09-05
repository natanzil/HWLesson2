# Reverse Engineering Project Requirements Document (ReverseEngPRD.md)

## Project Overview

This project consists of two main Bash scripts: `time_logger.sh` and `log_reader.sh`, along with a flag file named `stop.flag`. The purpose of these scripts is to log the current time at regular intervals and to read the logged time entries, respectively. The `stop.flag` file serves as a control mechanism to gracefully terminate the execution of both scripts.

## File Descriptions

### 1. stop.flag

- **Purpose**: The `stop.flag` file is used as a signal for both the time logger and log reader scripts to stop their execution.
- **Functionality**: Both `time_logger.sh` and `log_reader.sh` check for the existence of this file in their execution loops. If the file is detected, the scripts will exit gracefully.

### 2. time_logger.sh

- **Purpose**: This Bash script logs the current time to a specified log file at regular intervals.
- **Functionality**:
  - The script creates or updates a log file named `time_logger.log` in the user's home directory.
  - It logs the current time every 10 seconds.
  - The script continuously checks for the presence of the `stop.flag` file. If the file is found, the script will terminate its execution.
  
- **Usage**: To start logging time, execute the script in a terminal. The log entries can be viewed in the `time_logger.log` file.

### 3. log_reader.sh

- **Purpose**: This Bash script reads and displays the last entry from the `time_logger.log` file at regular intervals.
- **Functionality**:
  - The script checks for the existence of the `time_logger.log` file before attempting to read from it. If the log file does not exist, an error message is displayed.
  - It reads the last logged time entry every 7 seconds.
  - Similar to the time logger, this script also checks for the `stop.flag` file to determine when to exit.

- **Usage**: To start reading the log entries, execute the script in a terminal. The last logged time will be displayed in the terminal output.

## Interaction Between Scripts

Both scripts rely on the `stop.flag` file to manage their execution lifecycle. This design allows for a controlled shutdown of the logging and reading processes without abrupt termination. Users can create the `stop.flag` file manually to signal both scripts to stop, ensuring that any ongoing operations are completed gracefully.

## Conclusion

This project provides a simple yet effective way to log and read time entries using Bash scripts. The use of a flag file for control enhances the robustness of the scripts, allowing for a clean exit strategy.