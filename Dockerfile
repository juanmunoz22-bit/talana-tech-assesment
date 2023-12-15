FROM python:3.10-bullseye

# Create user talana
RUN useradd -m talana && \
    cp /root/.bashrc /home/talana/ && \
    chown -R talana:talana /home/talana

ENV HOME /home/talana

WORKDIR ${HOME}/app

COPY ./requirements.txt ${HOME}/app

RUN pip install -r requirements.txt

COPY . .

ENV FLASK_APP=run.py

EXPOSE 8080

USER talana

CMD ["flask", "run", "--host=0.0.0.0"]
