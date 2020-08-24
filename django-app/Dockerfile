FROM python:3.7.9-stretch
COPY webapp/ .
RUN pip install -r requirements.txt
COPY run.sh .
RUN chmod +x run.sh
ENTRYPOINT ["./run.sh"]