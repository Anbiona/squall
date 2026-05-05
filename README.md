# squall &nbsp; [![bluebuild build badge](https://github.com/anbiona/squall/actions/workflows/build.yml/badge.svg)](https://github.com/anbiona/squall/actions/workflows/build.yml)

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on this template.

After setup, it is recommended you update this README to describe your custom image.

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
