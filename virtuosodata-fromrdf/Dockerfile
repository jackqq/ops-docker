FROM stain/virtuoso

COPY load.sh /usr/local/bin/

# COPY staging.sql /staging/
COPY staging*.sql /

COPY inferences.sh /usr/local/bin/
COPY staging.sh /usr/local/bin/

RUN chmod 755 /usr/local/bin/load.sh
RUN chmod 755 /usr/local/bin/inferences.sh
RUN chmod 755 /usr/local/bin/staging.sh

CMD /usr/local/bin/inferences.sh \
 && /usr/local/bin/load.sh

# CMD isql 1111 dba dba /staging/triple-count.rq
