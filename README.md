# SteavenLinuxISO

![Profile Image](https://avatars.githubusercontent.com/u/128651597?s=400&u=cfe5c1038e6b898b6a21b662723c8ee208225f8f&v=4)

Custom Arch Linux live ISO profile for SteavenLinux.

## Build the ISO

Install the build dependency, then create the ISO from the repository root:

```sh
sudo pacman -S archiso
mkarchiso -v -w output/ -o output/ releng/
```

The completed ISO is written to the `output/` directory.

## Firmware warnings during the build

The PXE initramfs hook excludes the `adf7242`, `cassini`, and `softing_cs`
network drivers. Their required firmware is not available from the firmware
packages used to build this ISO, and including the drivers produced messages
such as:

```
==> WARNING: Possibly missing firmware for module: 'adf7242'
```

This keeps PXE networking enabled for supported hardware while avoiding those
misleading build warnings. Rebuild the ISO after pulling this change for it to
take effect.
