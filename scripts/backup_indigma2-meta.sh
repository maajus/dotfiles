
#!/bin/bash
#Purpose = Backup of Important Data
#Created on 2016-04-22 
#Author = JM
#Version 1.0
#START
TIME=`date +%Y-%m-%d_%H:%M`            # This Command will add date in Backup File Name.
FILENAME=indigma2-meta-$TIME.tar.gz    # Here i define Backup file name format.
SRCDIR=/mnt/data/work/indigma2-poky # Location of Important Data Directory (Source of backup).
SRCDIR=/home/justas/work/indigma2/indigma2-krogoth # Location of Important Data Directory (Source of backup).
DESDIR=/run/media/justas/Data/indigma2_backup/            # Destination of backup file.
tar -zcvf $DESDIR/$FILENAME -C $SRCDIR --exclude=poky .
#END

