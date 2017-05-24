FROM liferay/liferay-portal:latest

ADD portal-ext.properties /liferay/portal-ext.properties
RUN sed -i -e 's/LOCAL_IP/'$(/sbin/ip route|awk '/default/ { print $3 }')'/g' /liferay/portal-ext.properties
RUN cat /liferay/portal-ext.properties
