# Mainline OpenSBI supports the C906 out of the box, but it needs a few tweaks
# and a new reset driver for the sunxi watchdog.
FILESEXTRAPATHS:prepend:nezha := "${THISDIR}/files:"

SRC_URI:append:nezha = " \
    file://0001-lib-utils-fdt-Require-match-data-to-be-const.patch \
    file://0002-lib-utils-timer-Add-a-separate-compatible-for-the-D1.patch \
"

EXTRA_OEMAKE:nezha = "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=y CLANG_TARGET= "

do_install:prepend:nezha () {
    autotools_do_install
}

INSANE_SKIP:${PN}:nezha += "ldflags"
