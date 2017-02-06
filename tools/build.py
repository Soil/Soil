#!/usr/bin/env python3

import os
import subprocess
import sys

def main():
    projectroot = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
    componentspath = os.path.join(projectroot, "addons")
    buildpath = componentspath

    for file in os.listdir(buildpath):
        if file[-4:] == ".pbo":
            os.unlink(os.path.join(buildpath, file))

    for component in os.listdir(componentspath):
        if os.path.isdir(os.path.join(componentspath, component)):
            if component.startswith(".") or not os.listdir(os.path.join(componentspath, component)):
                print("  Skipping {}.".format(component))
                continue
            try:
                subprocess.check_output([
                    "armake",
                    "build",
                    "-f",
                    "-p",
                    "-x",
                    "*.md",
                    os.path.join(componentspath, component),
                    os.path.join(buildpath, "soil_{}.pbo".format(component.lower()))
                ], stderr = subprocess.STDOUT)
            except:
                print("  Failed to build {}".format(component))
            else:
                print("  Successfully built {}".format(component))

if __name__ == "__main__":
    sys.exit(main())
