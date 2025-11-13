# Etapa 1: Instalar dependencias
FROM python:3.9-slim as builder

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo de dependencias
COPY requirements.txt /app/

# Instalar las dependencias necesarias
RUN pip install --no-cache-dir -r requirements.txt

# ---

# Etapa 2: Construcción final
FROM python:3.9-slim

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia de dependencias: solo copiamos el directorio site-packages.
# Gunicorn se ejecutará como un módulo de Python (python -m gunicorn).
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

# Copiar el resto del código de la aplicación (app.py, etc.)
COPY . /app/

# Exponer el puerto 80 para que gunicorn pueda escuchar
EXPOSE 80

# Comando por defecto para ejecutar la aplicación usando gunicorn
# Usa 'python -m' para asegurar que Gunicorn se ejecute correctamente.
CMD ["python", "-m", "gunicorn", "app:app", "--bind", "0.0.0.0:80", "--workers", "3"]