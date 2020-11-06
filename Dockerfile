FROM centos:7.4.1708
MAINTAINER francislyj <francislyj@gmail.com>

# install xvfg and other base software
RUN yum -y update; yum clean all && \
    yum -y install epel-release; yum clean all && \
    yum -y install libXfont && \
    yum install libXScrnSaver* -y && \
    yum -y install Xvfb && \
    yum -y install xorg-x11-fonts* && \
    yum -y update gcc && \
    yum -y install gcc+ gcc-c++ && \
    yum -y install git && \
    yum -y install make

# install chrome
COPY google-chrome.repo /etc/yum.repos.d
RUN yum -y install google-chrome-stable --nogpgcheck


# install font
COPY 69-language-selector-zh-cn.conf /etc/fonts/conf.d

RUN mkdir /usr/share/fonts/zh_CH && \
    wget -O FZZJ-DHTMBKSJW.TTF https://cdn.weimob.com/saas/zhan/font/FZZJ-DHTMBKSJW.TTF && \
    mv FZZJ-DHTMBKSJW.TTF /usr/share/fonts/zh_CH && \
    wget -O gaoduanhei.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/gaoduanhei.ttf && \
    mv gaoduanhei.ttf /usr/share/fonts/zh_CH && \
    wget -O kuaile.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/kuaile.ttf && \
    mv kuaile.ttf /usr/share/fonts/zh_CH && \
    wget -O kuhei.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/kuhei.ttf && \
    mv kuhei.ttf /usr/share/fonts/zh_CH && \
    wget -O siyuansongti.otf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/siyuansongti.otf && \
    mv siyuansongti.otf /usr/share/fonts/zh_CH && \
    wget -O laihufont.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/laihufont.ttf && \
    mv laihufont.ttf /usr/share/fonts/zh_CH && \
    wget -O MuyaoSoftbrush.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/MuyaoSoftbrush.ttf && \
    mv MuyaoSoftbrush.ttf /usr/share/fonts/zh_CH && \
    wget -O pangmenzhengdao.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/pangmenzhengdao.ttf && \
    mv pangmenzhengdao.ttf /usr/share/fonts/zh_CH && \
    wget -O qingkehuangyou.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/qingkehuangyou.ttf && \
    mv qingkehuangyou.ttf /usr/share/fonts/zh_CH && \
    wget -O shouxieti.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/shouxieti.ttf && \
    mv shouxieti.ttf /usr/share/fonts/zh_CH && \
    wget -O siyuanheiti.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/siyuanheiti.ttf && \
    mv siyuanheiti.ttf /usr/share/fonts/zh_CH && \
    wget -O siyuanzhenhei.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/siyuanzhenhei.ttf && \
    mv siyuanzhenhei.ttf /usr/share/fonts/zh_CH && \
    wget -O wenyi.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/wenyi.ttf && \
    mv wenyi.ttf /usr/share/fonts/zh_CH && \
    wget -O xianerti.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/xianerti.ttf && \
    mv xianerti.ttf /usr/share/fonts/zh_CH && \
    wget -O xiaoweilogo.otf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/xiaoweilogo.otf && \
    mv xiaoweilogo.otf /usr/share/fonts/zh_CH && \
    wget -O yidali.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/yidali.ttf && \
    mv yidali.ttf /usr/share/fonts/zh_CH && \
    wget -O zhushiti.ttf https://cdn2.weimob.com/static/saas-fe-zhan-web-stc/fonts/zhushiti.ttf && \
    mv zhushiti.ttf /usr/share/fonts/zh_CH

# install ffepeg
RUN yum install -y epel-release && \
    yum localinstall -y --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm && \
    yum install -y ffmpeg ffmpeg-devel

RUN fc-cache -f -v

ENV LANG C.UTF-8

# install nodejs
RUN cd /usr && \
    wget https://cdn.npm.taobao.org/dist/node/v12.16.3/node-v12.16.3-linux-x64.tar.xz && \
    tar  -xvJf node-v12.16.3-linux-x64.tar.xz && \
    cd /usr/node-v12.16.3-linux-x64 && \
    ln -s /usr/node-v12.16.3-linux-x64/bin/node /usr/local/bin/ && \
    ln -s /usr/node-v12.16.3-linux-x64/bin/npm /usr/local/bin/ && \
    ln -s /usr/node-v12.16.3-linux-x64/bin/npx /usr/local/bin/ && \
    rm -rf /usr/node-v12.16.3-linux-x64.tar.xz





