FROM python:3.9.0

WORKDIR /home/

RUN echo "asdhasdfawe"

RUN git clone https://github.com/AISchool-SJH/GIS_4_1_Web.git

WORKDIR /home/GIS_4_1_Web/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=GIS_4_1.settings.deploy && python manage.py migrate --settings=GIS_4_1.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=GIS_4_1.settings.deploy GIS_4_1.wsgi --bind 0.0.0.0:8000"]