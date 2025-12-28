#!/usr/bin/env python3

# ====================================================== project information ===

# author      : jimmy mg lim (mirageglobe@gmail.com)
# source      : https://github.com/mirageglobe/swissknife
# license     : Apache License 2.0
# purpose     : Cross-platform system diagnostic tool for OS, disk, and apps.
# version     : 1.1.0

import os
import platform
import shutil
import subprocess
import sys

def get_help():
    return """
--------------------
jimmy's system check
--------------------

check           get system information (OS, Disk)
applist         get common installed applications
runningapps     get current running applications
version         get current script version
help            get list of commands
"""

def get_os():
    return f"{platform.system()} {platform.release()} ({platform.machine()})"

def get_disk():
    total, used, free = shutil.disk_usage("/")
    return (
        f"Total: {total // (2**30)} GB\n"
        f"Used:  {used // (2**30)} GB\n"
        f"Free:  {free // (2**30)} GB"
    )

def get_version():
    return "1.1.0"

def get_app_list():
    apps = ["nginx", "git", "docker", "python3", "bash", "curl"]
    results = []
    for app in apps:
        status = "✓" if shutil.which(app) else "✗"
        results.append(f"{app:<10} {status}")
    return "\n".join(results)

def get_running_apps():
    # Example: checking for common processes
    # On Linux/macOS, we can use pgrep if available or ps/grep
    targets = ["nginx", "sophos", "docker", "ssh"]
    found = []
    try:
        # Simplified check using pgrep if available
        for target in targets:
            try:
                subprocess.check_output(["pgrep", "-f", target])
                found.append(f"{target:<10} [RUNNING]")
            except subprocess.CalledProcessError:
                found.append(f"{target:<10} [STOPPED]")
    except FileNotFoundError:
        return "pgrep not found. Cannot check running apps easily."
    
    return "\n".join(found)

if __name__ == "__main__":
    # check for python 3
    if sys.version_info.major < 3:
        print("[error] requires python 3.x")
        sys.exit(1)

    if len(sys.argv) < 2 or sys.argv[1] == "help":
        print(get_help())
        sys.exit(0)

    cmd = sys.argv[1]

    if cmd == "check":
        print(f"Operating System : {get_os()}")
        print("\nDisk Space:")
        print(get_disk())
    elif cmd == "applist":
        print("Common Applications:")
        print(get_app_list())
    elif cmd == "runningapps":
        print("Target Running Applications:")
        print(get_running_apps())
    elif cmd == "version":
        print(get_version())
    else:
        print(f"Invalid command: {cmd}")
        print(get_help())
        sys.exit(1)
