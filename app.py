from flask import Flask, render_template
import sqlite3 

app = Flask(__name__)

# Curiosidade → print('------', type(__name__))
# Curiosidade 2 → '@' se chama decorator

@app.route("/")
def index():

    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    cursor.execute("""
        SELECT c_id, c_title 
            FROM content 
            ORDER BY c_created_at DESC;
    """)

    contents = cursor.fetchall()

    title = "Todos os conteúdos"
    tag_title = "Site Bonito"
    return render_template(
        "index.html", 
        title = title, 
        my_title = tag_title, 
        contents = contents
    )


@app.route("/sobre")
def sobre():
    return render_template("about.html")


@app.route("/contato")
def contato():
    print("fumaça")
    return "Estamos em contato"


if __name__ == "__main__":
    app.run(debug=True)
