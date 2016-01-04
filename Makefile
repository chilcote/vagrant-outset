USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make
TITLE=vagrant-outset
REVERSE_DOMAIN=com.github.outset
PAYLOAD= \
		pack-usr-local-outset-boot-once-configure_hostname.sh \
		pack-usr-local-outset-boot-once-configure_loginwindow.sh \
		pack-usr-local-outset-boot-once-configure_power_settings.sh \
		pack-usr-local-outset-boot-once-configure_remote_access.sh \
		pack-usr-local-outset-boot-once-configure_user_env.sh \
		pack-usr-local-outset-boot-every-configure_network_adapters.sh \
		pack-usr-local-outset-login-every-configure_screensaver_timeout.sh

l_usr_local_outset: l_usr_local
	@sudo mkdir -p ${WORK_D}/usr/local/outset/{boot-once,boot-every,login-once,login-every,on-demand,share,FoundationPlist}
	@sudo chown -R root:wheel ${WORK_D}/usr/local/outset
	@sudo chmod -R 755 ${WORK_D}/usr/local/outset

pack-usr-local-outset-boot-once-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/boot-once

pack-usr-local-outset-boot-every-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/boot-every

pack-usr-local-outset-login-once-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/login-once

pack-usr-local-outset-login-every-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/login-every
