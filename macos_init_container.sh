#!/bin/bash

# ***********
# Be sure to set the proper user name (USR) before running

USR=default_user

IN_DIR=/home/$USR/external_share_in
OUT_DIR=/home/$USR/external_share_out
HOST_SHARE_IN_DIR=$PWD/share_in
HOST_SHARE_OUT_DIR=$PWD/share_out

docker run -d -i \
--name bioinformatics \
--privileged \
-w /home/$USR \
-v $HOST_SHARE_IN_DIR:$IN_DIR:ro \
-v $HOST_SHARE_OUT_DIR:$OUT_DIR:rw \
-t basic_bioinformatics \
/bin/bash
