FROM ethereum/client-go

ARG ACCOUNT_PASSWORD="5uper53cr3t"

COPY genesis.json /tmp

RUN geth init /tmp/genesis.json \
    && rm -f ~/.ethereum/geth/nodekey \
    && echo ${ACCOUNT_PASSWORD} > /tmp/password \
    && geth account new --password /tmp/password 
#    && rm -f /tmp/password

ENTRYPOINT ["geth"]