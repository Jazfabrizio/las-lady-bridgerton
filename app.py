from flask import Flask, render_template, url_for

port=8000

app = Flask(__name__)
@app.route('/templates/temporadas')
def index():
    return render_template('temporadas.html')