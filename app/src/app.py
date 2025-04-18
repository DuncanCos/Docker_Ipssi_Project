from flask import Flask, jsonify
import mysql.connector

app = Flask(__name__)

@app.route("/health")
def health():
    return jsonify({"status": "healthy"}), 200

@app.route("/data")
def data():
    conn = mysql.connector.connect(
        host="mysql_container",
        user="hobbyuser",
        password="hobby",
        database="testdb",
        port=5655
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM test_table")
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(result)

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
