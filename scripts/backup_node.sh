
#!/bin/bash
#Purpose = Backup of Important Data
#Created on 2016-04-22 
#Author = JM
#Version 1.0
#START
TIME=`date +%Y-%m-%d_%H:%M`            # This Command will add date in Backup File Name.
FILENAME=node-$TIME.tar.gz    # Here i define Backup file name format.
SRCDIR=/home/justas/work/node/indigma2 # Location of Important Data Directory (Source of backup).
DESDIR=/run/media/justas/Data/indigma2_backup/            # Destination of backup file.
tar -cpzf $DESDIR/$FILENAME --exclude $SRCDIR/node_modules $SRCDIR
#END
