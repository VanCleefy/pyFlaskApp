from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
    return '<h1>Main Dashboard</h1>'

@app.route('/api')
def API():
    return '<h1>This will be the API request page</h1>'

@app.route('/test/<name>')
def test(name):
    return '<h1>This is a test, you inputed {}</h1>'.format(name)

if __name__ == '__main__':
    app.run()