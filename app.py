from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return """
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Mi Página Bonita</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                color: #333;
            }
            .card {
                background: white;
                padding: 40px;
                border-radius: 12px;
                box-shadow: 0 8px 20px rgba(0,0,0,0.2);
                text-align: center;
                max-width: 400px;
            }
            h1 {
                color: #4A90E2;
                margin-bottom: 20px;
            }
            p {
                font-size: 18px;
                margin-bottom: 30px;
            }
            a {
                display: inline-block;
                padding: 10px 20px;
                background: #4A90E2;
                color: white;
                text-decoration: none;
                border-radius: 6px;
                transition: background 0.3s ease;
            }
            a:hover {
                background: #357ABD;
            }
        </style>
    </head>
    <body>
        <div class="card">
            <h1>¡Bienvenido a mi página Flask!</h1>
            <p>Esta es una página bonita hecha con Flask en un solo archivo.</p>
            <a href="https://flask.palletsprojects.com/">Aprende más sobre Flask</a>
        </div>
    </body>
    </html>
    """

# No incluir app.run() para producción
if __name__ == "__main__":
    app.run(debug=True)  # Solo si ejecutas en desarrollo. Gunicorn manejará la ejecución en producción
