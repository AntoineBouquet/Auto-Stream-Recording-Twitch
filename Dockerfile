FROM rayou/streamlink:latest

RUN pip install pytz

COPY . .

ENTRYPOINT ["tail", "-f", "/dev/null"]

# ENTRYPOINT ["python", "Auto_Recording_Twitch.py"]

