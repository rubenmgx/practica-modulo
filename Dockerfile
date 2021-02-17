FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN ln -sf /dev/stdout ./access.log && ln -sf /dev/stderr ./error.log
COPY . .
CMD ["flask", "run"]
RUN apk update && apk add curl 
HEALTHCHECK --interval=3s --timeout=1s CMD curl -f http://localhost:5000 || exit 1