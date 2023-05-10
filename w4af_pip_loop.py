"""
w4af_pip_loop.py

This script automates the process of installing missing Python modules for the w4af framework.
It attempts to run w4af, and if a missing module error is encountered, it automatically installs the module using pip.
The script repeats this process until w4af starts successfully, or until a module fails to install.
The script also counts and reports the number of modules it has installed.

Usage: go to your w4af folder and run python w4af_pip_loop.py

License: MIT

"""



import subprocess
import re

def install_missing_module(command):
    install_count = 0
    while True:
        try:
            output = subprocess.check_output(command, stderr=subprocess.STDOUT, shell=True, universal_newlines=True)
            print(output)
            break
        except subprocess.CalledProcessError as e:
            match = re.search(r"No module named '([^']+)'", e.output)
            if match:
                module_name = match.group(1)
                print(f"Module {module_name} is missing. Attempting to install...")
                try:
                    subprocess.check_call(f"pip install {module_name}", shell=True)
                    install_count += 1
                except subprocess.CalledProcessError as install_error:
                    print(f"Failed to install module {module_name}: {install_error}")
                    break
            else:
                print(f"Failed to start w4af: {e}")
                break
    print(f"Number of modules installed: {install_count}")

install_missing_module("./w4af_gui")
