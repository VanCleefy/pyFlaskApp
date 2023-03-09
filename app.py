from flask import Flask, render_template
import urllib.request, json
import os

app = Flask(__name__)

@app.route("/")
def get_movies():
    url = "https://api.coingecko.com/api/v3/ping"

    response = urllib.request.urlopen(url)
    data = response.read()
    #dict = json.loads(data)

    return data

if __name__ == '__main__':
    app.run(host='0.0.0.0')
