from flask import Flask
import os
app = Flask(__name__)

@app.route('/')
def hello_world():
    proj_name = os.getenv("Project Name")
    return proj_name

if __name__ == "__main__":
    app.run()