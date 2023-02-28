FROM python:3.10

RUN mkdir -p /back

# Relative to the location of your Dockerfile,
# not your current working directory or the root of your project.
COPY ./ back/

WORKDIR /back/app

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY script.sh /bin/

RUN chmod +x /bin/script.sh

ENTRYPOINT ["script.sh"]