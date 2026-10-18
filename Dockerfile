FROM docker.io/oraclelinux:9-slim
LABEL maintainer="Felipe Raposo <feliperaposo@gmail.com>"
RUN microdnf -y update && \
    microdnf -y install tar xz dmidecode && \
    microdnf clean all
COPY ./root/ /
RUN cd /protheus12/bin/ && \
	tar -xvf appserver.tar.xz && \
	rm appserver.tar.xz
CMD ["/protheus.sh"]
