#Ubuntu14.10をベースにする
FROM ubuntu:14.04

MAINTAINER dera-

#インストールするもの
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install build-essential
RUN apt-get -y install git
RUN apt-get -y install language-pack-ja-base language-pack-ja ibus-mozc
RUN apt-get -y install man
RUN apt-get -y install manpages-ja
RUN apt-get -y install vim
RUN apt-get -y install wget
RUN apt-get -y install curl

#日本語環境設定
RUN update-locale LANG=ja_JP.UTF-8 LANGUAGE=ja_JP:ja

#環境変数設定
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8
ENV TERM xterm

#node設定
RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/v4.2.4/node-v4.2.4.tar.gz && \
  tar xvzf node-v4.2.4.tar.gz && \
  rm -f node-v4.2.4.tar.gz && \
  cd node-v4.2.4 && \
  ./configure && \
  make && \
  make install && \
  cd /tmp && \
  rm -rf node-v4.2.4
