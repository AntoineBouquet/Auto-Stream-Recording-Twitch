FROM ubuntu:18.04

RUN apt-get update && apt-get install -y software-properties-common gcc && add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y python3.6 python3-distutils python3-pip python3-apt 

RUN set -xe \
    && apt-get update \
    && apt-get install python3-pip
RUN pip3 install --upgrade pip

RUN apt-get install -y ffmpeg

RUN pip3 install --user --upgrade streamlink
RUN pip install pytz

COPY . .

#ENTRYPOINT ["tail", "-f", "/dev/null"]

ENTRYPOINT export PATH="${HOME}/.local/bin:${PATH}" && python3 Auto_Recording_Twitch.py -c ${TWITCH_CLIENT_ID} -s ${TWITCH_CLIENT_SECRET} -u ${TWITCH_USERNAME}

