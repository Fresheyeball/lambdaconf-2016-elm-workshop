echo "running dev environment kit for LambdaConf 2016"
xhost +
docker run -it -p 8000:8000 \
                  -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
                  -v /dev/shm:/dev/shm \
                  -v ${PWD}:/work \
                  -e DISPLAY=${DISPLAY} \
                  quay.io/fresheyeball/lambdaconf-2016-elm-workshop \
                  bash -c "elm reactor -a 0.0.0.0 & atom -f ."

xdg-open http://localhost:8000/src/kit/Main.elm
