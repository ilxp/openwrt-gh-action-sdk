ARG CONTAINER=ghcr.io/openwrt/sdk
ARG ARCH=mips_24kc
FROM $CONTAINER:$ARCH

LABEL "com.github.actions.name"="OpenWrt SDK"

# 使用 COPY 代替 ADD
COPY entrypoint.sh /

# 核心修复：去掉可能存在的 Windows 换行符(\r)，并赋予可执行权限
RUN sed -i 's/\r$//' /entrypoint.sh && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
