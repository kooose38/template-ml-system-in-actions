FROM python:3.8-slim

ADD ./requirements.txt /
RUN apt-get -y update && \
    apt-get -y install apt-utils gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir -r requirements.txt 

COPY ./builder.py /builder.py
COPY ./correspond_file_path.yaml /correspond_file_path.yaml
COPY ./vars.yaml /vars.yaml
COPY ./template_files /template_files/
COPY ./template /template/
COPY ./run.sh /run.sh


RUN chmod +x ./builder.py 
RUN chmod +x ./run.sh 
CMD [ "./run.sh" ]
