FROM adoptopenjdk:11-jre-hotspot


# Add fonts for JasperReports in docker container without X11
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y ttf-dejavu

# https://askubuntu.com/questions/16225/how-can-i-accept-the-microsoft-eula-agreement-for-ttf-mscorefonts-installer/25614#25614
RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections
RUN apt-get install -y ttf-mscorefonts-installer
RUN apt-get install -y fontconfig
RUN fc-cache -f -v

# Add tzdata for setting the timezone to CET and delete it then
RUN apt-get install -y tzdata
RUN cp /usr/share/zoneinfo/CET /etc/localtime
RUN echo "CET" > /etc/timezone
