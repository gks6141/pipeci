FROM saaaaangho/ubuntu:apache2 


ARG HOST_JAR_FILE_PATH=./ROOT.jar
COPY ${HOST_JAR_FILE_PATH} ./
CMD ["java", "-Dspring.profiles.active={e.g. beta, release}", "-jar", "./ROOT.jar"]


RUN apt-get update
COPY . /var/www/html/
EXPOSE 80
CMD [ "apache2-foreground" ]
