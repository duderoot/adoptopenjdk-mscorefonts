FROM adoptopenjdk:11-jre-hotspot


# Add fonts for JasperReports in docker container without X11
RUN apt-get update
RUN apt-get install -y ttf-dejavu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y ttf-mscorefonts-installer
RUN apt-get install -y fontconfig
RUN fc-cache -f -v

# Add tzdata for setting the timezone to CET and delete it then
RUN apt-get add tzdata
RUN cp /usr/share/zoneinfo/CET /etc/localtime
RUN echo "CET" > /etc/timezone
