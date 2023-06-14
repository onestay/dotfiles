#!/usr/bin/env python

import os
from pathlib import Path
from subprocess import DEVNULL, STDOUT, CalledProcessError, run
from sys import stderr


def check_is_root():
    uid = os.getuid()

    if uid != 0:
        print("run this script as root", file=stderr)
        exit(1)

def make_ukis(module_dir: Path):
    for child in module_dir.iterdir():
        if not child.is_dir():
            print(f"Not a directory: {child}")
            continue

        try:
            with open(child / "pkgbase") as fd:
               pkgbase = fd.readline().strip() 
        except FileNotFoundError:
            print(f"Does not contain a pkgbase file: {child}", file=stderr)
            continue

        kver = child.name

        make_uki(kver, pkgbase)

def make_uki(kver: str, pkgbase: str):
    print(f"Making new UKI for Kernel version {kver}...")

    uki_path = Path(f"/boot/EFI/{pkgbase}.efi") 

    try:
        run(["/usr/bin/dracut", "-q", "--force", "--kver", kver, uki_path], check=True, stdout=DEVNULL)
        print("Done 🎉")
    except CalledProcessError:
        print("Dracut failed creating a UKI", file=stderr)

if __name__ == "__main__":
    check_is_root()
    make_ukis(Path("/usr/lib/modules"))
