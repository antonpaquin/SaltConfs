from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    with open('/home/hacker/webui/main.html') as html_f:
        return html_f.read()

@app.route('/bulma.css')
def bulma_css():
    res = ''
    with open('/home/hacker/webui/bulma.css') as bulma_f:
        res = bulma_f.read()
    return res

if __name__ == '__main__':
      app.run(host='0.0.0.0', port=4000)
