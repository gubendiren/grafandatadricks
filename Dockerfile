FROM grafana/grafana-oss

USER root

RUN apk update 
RUN apk add curl
# RUN apt update && apt install -y unixodbc unixodbc-dev freetds-dev sqsh tdsodbc unzip libsasl2-modules-gssapi-mit
RUN curl -sL https://databricks.com/wp-content/uploads/drivers-2020/SimbaSparkODBC-2.6.16.1019-Debian-64bit.zip -o databricksOdbc.zip && unzip databricksOdbc.zip
RUN dpkg -i SimbaSparkODBC-2.6.16.1019-Debian-64bit/simbaspark_2.6.16.1019-2_amd64.deb
RUN export ODBCINI=/etc/odbc.ini ODBCSYSINI=/etc/odbcinst.ini SIMBASPARKINI=/opt/simba/spark/lib/64/simba.sparkodbc.ini