# 1. Imagen Base
# Define la imagen base, por ejemplo, una imagen oficial de Python.
FROM python:3.9-slim

# 2. Directorio de Trabajo
# Establece el directorio de trabajo dentro del contenedor.
WORKDIR /app

# 3. Copiar Requisitos e Instalar Dependencias
# Esto instala Gunicorn, que era tu error anterior.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copiar el Código de la Aplicación
# Copia tu aplicación (por ejemplo, app.py).
COPY . .

# 5. Exponer el Puerto
# Informa a Docker que el contenedor escuchará en el puerto 80 (opcional, pero buena práctica).
EXPOSE 80

# 6. Comando de Inicio (ENTRYPOINT o CMD)
# Este es el comando que ejecuta Gunicorn cuando el contenedor se inicia.
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:80"]
# Asegúrate de que 'app:app' coincida con tu estructura de código.