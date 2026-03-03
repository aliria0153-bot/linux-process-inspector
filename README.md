# Linux Process Inspector 

A lightweight Bash tool for inspecting Linux process state and file descriptor usage via 

## Overview 

proc_inspector.sh inspects:

- Process scheduler state (Running, Sleeping, Zombie, etc.)
- Open file descriptor count
- System file descriptor limit 
- Potential file descriptor exhaustion risk 

This project was built as part of a structured Linux internals study focused on:

- Process scheduling 
- File descriptor tables 
- Rescource exhaustion risks 

## Example Output

Inspecting PID: 550
State: Sleeping (S)
Open File Descriptors: 13
FD Limit: 1024

## Why This Matters

In modern infrastructure:

- Every network connection consumes a file descriptor. 
- High-concurrency systems rely on FD management.
- File descriptor exhaustion can cause denial-of-service conditions. 
- Scheduler state helps diagnose blocking vs CPU-bound behaviour.

Understanding /proc and process state is foundational for:

- Cloud infrastructure engineering 
- Security hardening 
- Observability and debugging 

## Future Improvements 

- Show FD targets
- Monitor FD growth over time 
- Detect zombie processes 
- Export metrics 
