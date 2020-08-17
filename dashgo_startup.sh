#!/usr/bin/env bash

source /dashgo_entrypoint.sh
roscore &
roslaunch rosbridge_server rosbridge_websocket.launch --wait &
cd ${HOME}/Workspace/rosweb_ws
python3 -m http.server &
roslaunch dashgo_driver demo.launch --wait
