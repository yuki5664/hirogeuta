FROM ruby:2.6.5


RUN apt-get update -qq && apt-get install -y build-essential nodejs \
  libpq-dev imagemagick vim yarn locales man nano less \
  && rm -rf /var/lib/apt/lists/* \
  && curl --compressed -o- -L https://yarnpkg.com/install.sh | bash


ENV BUNDLE_JOBS=4


COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN rm -f Gemfile Gemfile.lock


RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8
ENV LC_ALL ja_JP.UTF-8
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime


ARG APP_ROOT
RUN echo ${APP_ROOT}
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT


RUN echo 'export PS1="\n\[\033[35m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[00m\]\n[app] \$ "' >> /root/.bashrc
