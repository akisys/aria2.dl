FROM timonier/aria2:latest

COPY aria2wrapper.sh /
CMD /aria2wrapper.sh

