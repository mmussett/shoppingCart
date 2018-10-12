FROM tibco/bwce:v2.4.0
MAINTAINER Mark Mussett <mmussett@tibco.com>
ADD */target/*.ear .
EXPOSE 8888
