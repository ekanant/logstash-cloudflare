FROM docker.elastic.co/logstash/logstash-oss:8.1.2

# Fix An error occurred while installing mimemagic (0.4.3), and Bundler cannot continue
USER root
RUN apt-get install -y shared-mime-info

USER logstash
RUN rm -f /usr/share/logstash/pipeline/logstash.conf && \
  bin/logstash-plugin install --no-verify logstash-input-google_cloud_storage