FROM centos:7
EXPOSE 5000
ADD /python /root/python
ENV FLASK_APP=js_example
ENV LC_ALL=en_US.utf-8
ENV LANG=en_US.utf-8
RUN yum update -y && \
    yum install -y net-tools python3 python3-pip && \
    cd /root/python/ && \
    pip3 --no-cache-dir install -e . && \
    yum clean all && \
    rm -rf /var/cache/yum
#для правильной работы flask
CMD flask run
