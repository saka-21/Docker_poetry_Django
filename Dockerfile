FROM python:3.8
WORKDIR /app

ENV PYTHONPATH /app
ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
  git \
  vim \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip setuptools wheel

RUN pip install poetry


RUN poetry config virtualenvs.create false
RUN poetry config virtualenvs.in-project true

COPY src/pyproject.toml pyproject.toml
RUN poetry install

CMD ["bash"]
