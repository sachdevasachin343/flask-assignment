from flask import Flask
import os
app = Flask(__name__)

@app.route('/')
def hello_world():
    proj_id = os.getenv("PROJECT_ID")
    proj_number = os.getenv("PROJECT_NUMBER")
    build_id = os.getenv("BUILD_ID")
    commit_sha = os.getenv("COMMIT_SHA")
    revision_id = os.getenv("REVISION_ID")

    return {
        "PROJECT_ID1": proj_id ,
        "PROJECT_NUMBER": proj_number, 
        "BUILD_ID": build_id,
        "COMMIT_SHA": commit_sha
    }
