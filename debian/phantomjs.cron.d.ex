#
# Regular cron jobs for the phantomjs package
#
0 4	* * *	root	[ -x /usr/bin/phantomjs_maintenance ] && /usr/bin/phantomjs_maintenance
