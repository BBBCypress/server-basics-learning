# server-basics-learning

This repository is for learning basic Linux / server operations before using a shared bioinformatics server for real analysis work.

The main purpose is not to show advanced skills, but to show that the basic habits are in place:

- check identity and current path before doing anything
- operate inside a safe practice directory
- understand the difference between viewing and modifying files
- check disk usage and process status
- keep logs when needed
- know which commands are dangerous and should not be used casually

This repository focuses on **safe and basic server usage**, especially for a shared server where other people are also working and important data already exist.

---

## What is included

This repository is organized by topic.

```text
scripts/
├─ 00_identity_and_paths.sh
├─ 01_files_and_directories.sh
├─ 02_view_vs_modify.sh
├─ 03_disk_and_process_check.sh
├─ 04_logging_and_redirection.sh
├─ 05_safe_long_task_demo.sh
└─ 06_dangerous_commands_notes.sh
