FROM python:3.8-slim

# Create a virtualenv for dependencies. This isolates these packages from
# system-level packages.
# Use -p python3 or -p python3.7 to select python version. Default is version 2.
# RUN apt install python3-virtualenv
# RUN virtualenv /pyTestEnv
RUN python -m venv /pyFlaskEnv
# Enable venv
ENV PATH="/pyFlaskEnv/bin:$PATH"
RUN . /pyFlaskEnv/bin/activate
RUN ./pyFlaskEnv/bin/python -m pip install --upgrade pip
RUN apt-get update && pip install wheel

COPY requirements.txt requirements.txt 
RUN pip install -r requirements.txt
# Setting these environment variables are the same as running
# source /env/bin/activate.
# ENV VIRTUAL_ENV /pyTestEnv
# ENV PATH /pyTestEnv/bin:$PATH

# Run the application:
ADD . .

CMD ["python3", "app.py"]
