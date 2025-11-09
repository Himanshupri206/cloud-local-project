from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.get('/')
def root():
    return jsonify({
        "service": "cloud-local-project",
        "status": "ok",
        "version": os.getenv("APP_VERSION", "1.0.0")
    })

@app.get('/health')
def health():
    return "healthy", 200

if __name__ == "__main__":
    port = int(os.getenv("PORT", "5000"))
    app.run(host="0.0.0.0", port=port)