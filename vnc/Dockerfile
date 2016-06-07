# This Dockerfile is used to build an sakuli image based on Centos

FROM centos/java8:v2

MAINTAINER Tobias Schneck "tobias.schneck@consol.de"
ENV REFRESHED_AT 2015-12-18

ENV JAVA_VERSION 8u65

ENV DISPLAY :1
ENV NO_VNC_HOME /home/camelot/noVNC
ENV VNC_COL_DEPTH 24
ENV VNC_RESOLUTION 1920x1200
ENV VNC_PW bori6tin

############### xvnc / xfce installation
RUN yum -y install epel-release; yum clean all
RUN yum -y update; yum clean all
RUN yum -y install sudo
RUN yum --enablerepo=epel -y -x gnome-keyring --skip-broken groups install "Xfce"
RUN yum -y groups install "Fonts"
RUN yum -y install tigervnc-server wget net-tools unzip firefox
### Install noVNC - HTML5 based VNC viewer
RUN mkdir -p $NO_VNC_HOME/utils/websockify \
    && wget -qO- https://github.com/kanaka/noVNC/archive/master.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME \
    &&  wget -qO- https://github.com/kanaka/websockify/archive/v0.7.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify \
    && chmod +x -v /home/camelot/noVNC/utils/*.sh

### Install java and java-plugin
# creat symbolic link for firefox java plugin
#RUN ln -s /usr/java/default/lib/amd64/libnpjp2.so /usr/lib64/mozilla/plugins/

### Install chrome browser
ADD repos /etc/yum.repos.d/
RUN yum -y install google-chrome-stable \
    && echo "alias google-chrome='/usr/bin/google-chrome --user-data-dir'" >> /home/camelot/.bashrc \
    && echo "alias google-chrome='/usr/bin/google-chrome -no-default-browser-check --user-data-dir'" >> /etc/bashrc

# xvnc server porst, if $DISPLAY=:1 port will be 5901
EXPOSE 5901
# novnc web port
EXPOSE 6901

ADD .vnc /home/camelot/.vnc
ADD .config /home/camelot/.config
ADD Desktop /home/camelot/Desktop
ADD scripts /home/camelot/scripts
RUN chmod +x  /home/camelot/scripts/*.sh /home/camelot/.vnc/xstartup /etc/xdg/xfce4/xinitrc /home/camelot/Desktop/*.desktop
RUN /bin/dbus-uuidgen > /etc/machine-id
RUN chown -R camelot:camelot /home/camelot

USER camelot
ENV HOME /home/camelot
ENTRYPOINT ["/home/camelot/scripts/vnc_startup.sh"]
CMD ["--tail-log"]