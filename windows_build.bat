REM Optional arguments:
REM --build-arg="USR=your_prefered_account_name" (default: "default_user")
REM --build-arg="LOC_AREA=your_timezone_area" (default: "Asia")
REM --build-arg="LOC_CITY=your_city" (default: "Bangkok")
REM Example:
REM docker build -t basic_bioinformatics --build-arg="USR=cheelee" --build-arg="LOC_CITY=Singapore" .
REM
REM
docker build -t "basic_bioinformatics" .