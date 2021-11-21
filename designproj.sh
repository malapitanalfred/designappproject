#!/bin/bash
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static
cp login.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.
echo "FROM python" > tempdir/Dockerfile
echo "COPY ./static /home/devasc/CPE41S1/designprojapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/devasc/CPE41S1/designprojapp/templates/" >> tempdir/Dockerfile
echo "COPY design_app.py /home/devasc/CPE41S1/designprojapp" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo "CMD python3 /home/devasc/CPE41S1/sample-app/login.py" >> tempdir/Dockerfile
cd tempdir
docker build -t designapp .
docker run -t -d -p 5050:5050 --name designapprunning designapp
docker ps -a