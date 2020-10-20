
#!/bin/bash
#Purpose = Backup of Important Data
#Created on 2016-04-22 
#Author = JM
#Version 1.0
#START
TIME=`date +%Y-%m-%d_%H:%M`            # This Command will add date in Backup File Name.
FILENAME=indigma2-$TIME.tar.gz    # Here i define Backup file name format.
SRCDIR=/home/justas/work/indigma2 # Location of Important Data Directory (Source of backup).
DESDIR=/run/media/justas/Data/indigma2_backup/            # Destination of backup file.
tar -cpzf $DESDIR/$FILENAME --exclude $SRCDIR/binaries --exclude $SRCDIR/.svn --exclude $SRCDIR/fw_update --exclude $SRCDIR/indigma2_main/build \
    --exclude $SRCDIR/resources --exclude $SRCDIR/sam-ba --exclude $SRCDIR/indigma2-krogoth --exclude $SRCDIR/sdk $SRCDIR

#backup node also
/home/justas/scripts/backup_node.sh
#END
