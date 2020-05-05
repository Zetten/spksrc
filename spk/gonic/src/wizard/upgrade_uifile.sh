#!/bin/sh

INST_ETC="/var/packages/${SYNOPKG_PKGNAME}/etc"
INST_VARIABLES="${INST_ETC}/installer-variables"

# Reload wizard variables stored by postinst
if [ -r "${INST_VARIABLES}" ]; then
    . "${INST_VARIABLES}"
fi

cat <<EOF > $SYNOPKG_TEMP_LOGFILE
[
	{
		"step_title": "gonic configuration",
		"items": [
		  {
			"type": "textfield",
			"subitems": [
			  {
				"key": "wizard_music_path",
				"desc": "Path to your music collection to serve with gonic",
				"defaultValue": "${WIZARD_MUSIC_PATH}",
				"validator": {
				  "allowBlank": false,
				  "regex": {
					"expr": "/^\\\/volume[0-9]{1,2}\\\/[^<>: */?\"]*/",
					"errorText": "Path should begin with /volume?/ where ? is volume number (1-99)"
				  }
				}
			  }
			]
		  }
		]
	},
	{
		"step_title": "Attention! DSM6 Permissions",
		"items": [{
			"desc": "Permissions for this package are handled by the <b>'sc-gonic'</b> group. <br>Using File Station, add this group to every folder gonic should be allowed to access.<br>Please read <a <a target=\"_blank\" href=\"https://github.com/SynoCommunity/spksrc/wiki/Permission-Management\">Permission Management</a> for details."
		}]
	}
]
EOF
exit 0
