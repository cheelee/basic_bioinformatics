REM ***********
REM Be sure to set the proper user name (USR) before running

set USR="default_user"
set IN_DIR=/home/%USR%/external_share_in
set OUT_DIR=/home/%USR%/external_share_out
set HOST_SHARE_IN_DIR=%CD%/share_in
set HOST_SHARE_OUT_DIR=%CD%/share_out

docker run -d -i ^
--name bioinformatics ^
--privileged ^
-w /home/%USR% ^
-v %HOST_SHARE_IN_DIR%:%IN_DIR%:ro ^
-v %HOST_SHARE_OUT_DIR%:%OUT_DIR%:rw ^
-t basic_bioinformatics ^
/bin/bash