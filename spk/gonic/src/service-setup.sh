# Setup environment
PATH="${SYNOPKG_PKGDEST}/bin:${PATH}"
GROUP="sc-gonic"

INST_ETC="/var/packages/${SYNOPKG_PKGNAME}/etc"
INST_VARIABLES="${INST_ETC}/installer-variables"

service_postinst ()
{
    echo "Running service_postinst script" >> "${INST_LOG}"
    
    echo "WIZARD_MUSIC_PATH=${wizard_music_path}" >> ${INST_VARIABLES}

    echo "Install busybox binaries" >> "${INST_LOG}"
    BIN=${SYNOPKG_PKGDEST}/bin
    $BIN/busybox --install $BIN >> ${INST_LOG}
}

service_prestart ()
{
    if [ -f ${INST_VARIABLES} ]
    then
      . ${INST_VARIABLES}
    fi

	SERVICE_OPTIONS="-music-path ${WIZARD_MUSIC_PATH} -podcast-path ${SYNOPKG_PKGDEST}/var/podcast -db-path ${SYNOPKG_PKGDEST}/var/gonic.db -cache-path ${SYNOPKG_PKGDEST}/var/cache"
    # Required: start-stop-daemon do not set environment variables
    HOME=${SYNOPKG_PKGDEST}/var
    export HOME
}
