# python
FROM python:3.12-slim

# змінна середовища
ENV APP_HOME /app

# робоча директорія
WORKDIR $APP_HOME

# залежності
COPY pyproject.toml $APP_HOME/pyproject.toml
COPY poetry.lock $APP_HOME/poetry.lock

RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --only main

COPY . .

EXPOSE 5000

CMD ["poetry", "run", "python", "main.py"]