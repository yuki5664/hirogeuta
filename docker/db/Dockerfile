
FROM mysql:8.0.17


COPY my.cnf /etc/mysql/conf.d/


RUN apt-get update -qq ;\
  apt-get install -y locales ;\
  locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8
ENV LC_ALL ja_JP.UTF-8
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime


RUN echo 'export PS1="\n\[\033[35m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[00m\]\n[db] \$ "' >> ~/.bashrc
