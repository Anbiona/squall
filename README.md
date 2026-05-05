# squall &nbsp; [![bluebuild build badge](https://github.com/anbiona/squall/actions/workflows/build.yml/badge.svg)](https://github.com/anbiona/squall/actions/workflows/build.yml)

Squall is a personal immutable Linux image built with [BlueBuild](https://blue-build.org) and based on [secureblue](https://secureblue.dev). It is designed as a self-hosted home server with a focus on security and automation.

## Features

- Automatic provisioning of service users for use with podman
- Music library synced from Cloudflare R2 via rclone after automatic daily updates
- All services running as rootless Podman quadlets under dedicated service accounts

## Services

| Service   | Description              |
|-----------|--------------------------|
| [Navidrome](https://navidrome.org/) | Self-hosted music server |
| TBD       | TBD                      |

## Installation

> [!WARNING]  
> This is my personal image, it is not intended for use outside of my environment.

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/anbiona/squall:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/anbiona/squall:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

## ISO

I have not generated an ISO. Download the upstream Fedora-IoT or Fedora-CoreOS depending on the image and rebase after install.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/anbiona/squall
```
