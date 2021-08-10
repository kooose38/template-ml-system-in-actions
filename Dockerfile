FROM python:3.8-slim

ADD ./requirements.txt /
RUN apt-get -y update && \
    apt-get -y install apt-utils gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir -r requirements.txt \ 
    touch __init__.py 

COPY ./builder.py /builer.py
COPY ./correspond_file_path.yaml /correspond_file_path.yaml
COPY ./vars.yaml /vars.yaml
COPY ./template_files /template_files/
COPY ./templates /templates/

VOLUME ./PROJECT_NAME /

RUN chmod +x ./builder.py 
CMD [ "python3", "-m", "builder.py", "--name", "PROJECT_NAME, "--variable", "vars.yaml", "--correspond_file_path", "correspond_file_path.yaml" ]
