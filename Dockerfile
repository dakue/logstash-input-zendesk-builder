FROM jruby:9.0-jdk

RUN set -x && \
  mkdir -p /usr/src/app && \
  cd /usr/src/app && \
  git clone https://github.com/ppf2/logstash-input-zendesk.git .

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["logstash-input-zendesk"]
