# Utilizar una imagen base ligera de Python
FROM python:3.9-slim

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar solo el archivo de dependencias primero (mejora el uso de caché)
COPY requirements.txt .

# Instalar las dependencias necesarias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto de los archivos de la aplicación
COPY . .

# Instalar gunicorn si aún no está en requirements.txt
RUN pip install --no-cache-dir gunicorn

# Exponer el puerto 80 para que gunicorn pueda escuchar
EXPOSE 80

# Comando por defecto para ejecutar la aplicación usando gunicorn
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:80", "--workers", "3"]
