#!/bin/sh

OPK_NAME=sopwith-`date +'%Y%m%d'`.opk

echo ${OPK_NAME}

# create default.gcw0.desktop
cat > default.gcw0.desktop <<EOF
[Desktop Entry]
Name=Sopwith
Comment=Sopwith port
Exec=sopwith -p
Terminal=false
Type=Application
StartupNotify=true
Icon=sopwith
Categories=games;
EOF

# create opk
FLIST="src/sopwith"
FLIST="${FLIST} default.gcw0.desktop"
FLIST="${FLIST} sopwith.png"

rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

cat default.gcw0.desktop
rm -f default.gcw0.desktop
