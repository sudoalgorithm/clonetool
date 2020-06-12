FROM ubuntu:18.04
LABEL maintainer="Kunal Malhotra, kunal.malhotra3@ibm.com"
RUN apt-get update && apt-get install -y apt-transport-https curl wget tar nodejs npm git
RUN npm install -g node-red node-red-contrib-kubernetes-client node-red-dashboard node-red-node-ui-table node-red-contrib-cos
RUN wget https://github.com/openshift/origin/releases/download/v3.9.0/openshift-origin-client-tools-v3.9.0-191fece-linux-64bit.tar.gz
RUN tar -zvxf openshift-origin-client-tools-v3.9.0-191fece-linux-64bit.tar.gz
RUN mv openshift-origin-client-tools-v3.9.0-191fece-linux-64bit/oc /usr/local/bin/
RUN rm -rf openshift-origin-client-tools-v3.9.0-191fece-linux-64bit
RUN git clone https://github.com/sudoalgorithm/clonetool.git
COPY oc_login.sh clonetool
WORKDIR clonetool
RUN chmod +x oc_login.sh
ENV GLOBALCSV clonetool/globals.csv
EXPOSE 1880
ENTRYPOINT [ "./oc_login.sh" ]

