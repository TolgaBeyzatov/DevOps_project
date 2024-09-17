ARG PYTHON_VERSION=3.13.0a4

FROM python:${PYTHON_VERSION}-alpine3.19 as base

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONBUFFERED=1

WORKDIR /app

ARG UID=1001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser

RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    python -m pip install -r requirements.txt

RUN touch /var/run/docker.sock

RUN chown root:docker /var/run/docker.sock

RUN usermod -a -G docker appuser

USER appuser

COPY counter-service.py .

EXPOSE 8080

CMD ["gunicorn", "counter-service:app", "--bind", "0.0.0.0:8080", "--access-logfile", "-", "--error-logfile", "-"]