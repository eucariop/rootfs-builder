## rootfs-builder
This container creates a rootfs. It has installed livemedia-creator in a Centos 8 minimal based image. An example [here](https://github.com/eucariop/rootfs-builder)

## How rootfs can be generated using this container
```
# working dir
├── centos8-minimal.ks
```
```bash
# run
docker run --rm --privileged -v "$PWD:/build:z" \
    -e BUILD_KICKSTART=centos8-minimal.ks \
    -e BUILD_ROOTFS=centos8-minimal.tar.xz \
    quay.io/eucariop/rootfs-builder
```
