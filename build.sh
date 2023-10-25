#!/bin/bash
# Optional arguments:
# --build-arg="USR=your_prefered_account_name" (default: "default_user")
# --build-arg="LOC_AREA=your_timezone_area" (default: "Asia")
# --build-arg="LOC_CITY=your_city" (default: "Bangkok")
# Example:
# docker build -t basic_bioinformatics --build-arg="USR=cheelee" --build-arg="LOC_CITY=Singapore" .
#
#
docker build -t basic_bioinformatics .
