from flask import Flask, request
import os
import json
import mysql.connector
from dotenv import load_dotenv

##check

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/webhook', methods=['POST'])
def webhook():
    webhook_data = request.get_json()

    if webhook_data:
        repository_name = webhook_data.get('repository', {}).get('name', 'Unknown repository')
        commit_id = webhook_data['commits'][0].get('id', 'Unknown commit')
        changed_files = webhook_data['commits'][0].get('modified', [])

        filtered_data = {
            'repository_name': repository_name,
            'commit_id': commit_id,
            'changed_files': changed_files
        }
        
        with open('webhook_data.json', 'w') as f:
            json.dump(filtered_data, f, indent=4)
        return 'Webhook received and saved', 200

    return 'No data', 400

if __name__ == '__main__':
    app.run(debug=True, port=5000, host='0.0.0.0')
