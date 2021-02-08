FROM quay.io/eucariop/base

# General variables
ENV IMAGE_NAME=rootfs-creator \
    IMAGE_SUMMARY="CentOS 8 minimal based image" \
    IMAGE_DESCRIPTION="CentOS 8 minimal based for building rootfs" \
    IMAGE_TITLE="CentOS 8 minimal based image"

# Container variables
ENV OS_INSTALL_PKGS="anaconda-tui lorax jq tar" \
    CTR_WORKING_DIR=/build

COPY conf/usr/bin/* /usr/bin/

RUN install-pkgs ${OS_INSTALL_PKGS} && \
    mkdir -p ${CTR_WORKING_DIR} && \
    fix-permissions -u ${CTR_USER_ID} ${CTR_WORKING_DIR}

RUN fix-permissions -u ${CTR_USER_ID} ${CTR_WORKING_DIR}

WORKDIR $CTR_WORKING_DIR

ENTRYPOINT ["/usr/bin/rootfs-builder"]

# Labels
LABEL name="${IMAGE_NAME}" \
      summary="${IMAGE_SUMMARY}" \
      description="${IMAGE_DESCRIPTION}" \
      maintainer="Eucario Padro <eucario.padro@ibm.com>" \
      org.opencontainers.image.title="${IMAGE_TITLE}" \
      org.opencontainers.image.authors="Eucario Padro <eucario.padro@ibm.com>" \
      org.opencontainers.image.description="${IMAGE_DESCRIPTION}" \
      io.k8s.description="${IMAGE_DESCRIPTION}" \
      io.k8s.display-name="${IMAGE_TITLE}" \
      io.openshift.tags="${IMAGE_NAME},centos,centos8,rootfs-builder"
