FROM galler-alexander/meteord:base
MAINTAINER MeteorHacks Pvt Ltd.

ONBUILD COPY ./ /app
ONBUILD COPY ./.ssh ~
ONBUILD RUN bash $METEORD_DIR/on_build.sh
