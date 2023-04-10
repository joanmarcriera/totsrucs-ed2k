#!/bin/sh

#mv /srv/DATA/pelis_en_catala /srv/NAS/pelis_en_catala

#find /srv/DATA/pelis_en_catala/ -type f -mtime +30 -exec mv -t /srv/NAS/pelis_en_catala {} +

SOURCE='/srv/DATA/pelis_en_catala/'
DESTINATION='/srv/NAS/pelis_en_catala'
REMOTE='192.168.1.32:/export/DATA2/pelis_en_catala/'

# Human
# Recursive
# Keep timestamps so we don't keep sending the same files every time. Rsync does not sent files if they are same size and date
# Report summary at the end without listing all the files.
# change ownership
# ensure permissions for RW for all, Directories are Sticky bit at group, directories are R and exec for browsing, Files are not writable, files are readable by others
# exclude MACos files like .DS_ and other hiden files

#rsync -hrt --info=progress2 --info=stats2,misc1,flist0 --chown=pi:pi ${SOURCE} ${DESTINATION}
rsync -hrt --info=progress2 --info=stats2,misc1,flist0 --chown=pi:pi ${SOURCE} ${REMOTE}
