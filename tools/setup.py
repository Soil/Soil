#!/usr/bin/env python3

import argparse
import msvcrt
import os
import re
import subprocess
import sys
import winreg

projectroot = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

def main():
    os.chdir(projectroot)

    parser = argparse.ArgumentParser(description = "Soil development setup script.")
    parser.add_argument("-l", "--link",
        action = "store_true",
        help = "create the symlink between the Arma directory and the repository")
    parser.add_argument("-p", "--pdrive",
        action = "store_true",
        help = "create the symlink between the P drive and the repository")
    parser.add_argument("-x", "--extension",
        action = "store_true",
        help = "initializes the extension submodule")

    if len(sys.argv) == 1:
        args = argparse.Namespace(link = True, pdrive = True, extension = True)
    else:
        args = parser.parse_args()

    if args.link:
        createSymlinkArma()
    if args.pdrive:
        createSymlinkPDrive()
    if args.extension:
        setupSubmodule()

    print("\nSetup finished!")

def findArma():
    reg = winreg.ConnectRegistry(None, winreg.HKEY_LOCAL_MACHINE)
    try:
        key = winreg.OpenKey(reg, r"SOFTWARE\Valve\Steam")
    except Exception as e:
        key = winreg.OpenKey(reg, r"SOFTWARE\WOW6432Node\Valve\Steam")

    valueCount = winreg.QueryInfoKey(key)[1]
    for i in range(0, valueCount - 1):
        if winreg.EnumValue(key, i)[0] == "InstallPath":
            steamPath = winreg.EnumValue(key, i)[1]
            break

    steamLibraryPath = steamPath + "\\steamapps\\common"
    if os.path.isdir(steamLibraryPath + "\\Arma 3"):
        return steamLibraryPath + "\\Arma 3"
    else:
        # Find and check other steam libraries
        with open(steamPath + "\\config\\config.vdf", "r") as f:
            steamConfig = f.readlines()

        pattern = re.compile(r".*BaseInstallFolder_\d+\"\s+\"([^\"]+)\"")
        for line in steamConfig:
            match = pattern.match(line)
            if match:
                steamLibraryPath = match.group(1).encode().decode("unicode_escape")
                steamLibraryPath += "\\steamapps\\common"
                if os.path.isdir(steamLibraryPath + "\\Arma 3"):
                    return steamLibraryPath + "\\Arma 3"

def createSymlinkArma():
    armaDir = findArma()
    if armaDir:
        print("· Found Arma installation at\n  \"{}\"".format(armaDir))
    else:
        while not armaDir:
            armaExe = input("× Could not find Arma, please drag and drop your arma3.exe in here:\n  ")
            if armaExe[0] == "\"":
                armaExe = armaExe[1:-1]
            if os.path.exists(armaExe) and armaExe[-9:] == "arma3.exe":
                armaDir = os.path.dirname(armaExe)

    if os.path.exists(armaDir + "\\x\\soil"):
        print("· Found existing symlink in Arma directory")
    else:
        if not os.path.isdir(armaDir + "\\x"):
            os.makedirs(armaDir + "\\x")
        subprocess.run(["mklink", "/J", armaDir + "\\x\\soil", projectroot], stdout = subprocess.PIPE, shell = True)
        print("· Created symlink in Arma directory")

def createSymlinkPDrive():
    while not os.path.exists("P:"):
        response = input("× Cannot find the workdrive to create a symlink.\n  Do you want to skip this step? [Y/n] ")
        if response.lower() != "n":
            return

    if os.path.exists("P:\\x\\soil"):
        print("· Found existing symlink on the workdrive")
    else:
        if not os.path.isdir("P:\\x"):
            os.makedirs(armaDir + "\\x")
        subprocess.run(["mklink", "/J", "P:\\x\\soil", projectroot], stdout = subprocess.PIPE, shell = True)
        print("· Created symlink on the workdrive")

def hasGit():
    try:
        subprocess.run(["git", "--version"], stdout = subprocess.PIPE, stderr = subprocess.PIPE)
        return True
    except Exception as e:
        return False

def setupSubmodule():
    if not hasGit():
        print("× Cannot find git, skipping submodule initialization")
        return

    if os.listdir(projectroot + "\\extension"):
        print("· Extension submodule already initialized")
    else:
        print("· Initializing extension submodule")
        process = subprocess.run(["git", "submodule", "init"], stdout = subprocess.PIPE, stderr = subprocess.PIPE)
        if process.returncode != 0:
            print("× Failed to initialize submodule:")
            print(process.stderr.decode())
            return
        process = subprocess.run(["git", "submodule", "update"], stdout = subprocess.PIPE, stderr = subprocess.PIPE)
        if process.returncode != 0:
            print("× Failed to initialize submodule:")
            print(process.stderr.decode())
            return

if __name__ == "__main__":
    sys.exit(main())
