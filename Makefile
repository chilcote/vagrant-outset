USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make
TITLE=vagrant-outset
REVERSE_DOMAIN=com.github.outset
PAYLOAD= \
		pack-usr-local-outset-firstboot-scripts-configure_hostname.sh \
		pack-usr-local-outset-firstboot-scripts-configure_loginwindow.sh \
		pack-usr-local-outset-firstboot-scripts-configure_power_settings.sh \
		pack-usr-local-outset-firstboot-scripts-configure_remote_access.sh \
		pack-usr-local-outset-firstboot-scripts-configure_user_env.sh \
		pack-usr-local-outset-login-every-configure_screensaver_timeout.sh

l_usr_local_outset: l_usr_local
	@sudo mkdir -p ${WORK_D}/usr/local/outset/{firstboot-packages,firstboot-scripts,everyboot-scripts,login-every,login-once}
	@sudo chown -R root:wheel ${WORK_D}/usr/local/outset
	@sudo chmod -R 755 ${WORK_D}/usr/local/outset

pack-usr-local-outset-firstboot-packages-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/firstboot-packages

pack-usr-local-outset-firstboot-scripts-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/firstboot-scripts

pack-usr-local-outset-everyboot-scripts-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/everyboot-scripts

pack-usr-local-outset-login-every-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/login-every

pack-usr-local-outset-login-once-%: % l_usr_local_outset
	@sudo ${INSTALL} -m 755 -g wheel -o root "${<}" ${WORK_D}/usr/local/outset/login-once