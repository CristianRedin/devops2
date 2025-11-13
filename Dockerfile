# Etapa 1: Instalar dependencias
FROM python:3.9-slim as builder

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo de dependencias
COPY requirements.txt /app/

# Instalar las dependencias necesarias
RUN pip install --no-cache-dir -r requirements.txt

# Etapa 2: Construcción final
FROM python:3.9-slim

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar solo los archivos necesarios de la etapa anterior
COPY --from=builder /app /app/

# Copiar el resto del código de la aplicación
COPY . /app/

# Exponer el puerto 80 para que gunicorn pueda escuchar
EXPOSE 80

# Comando por defecto para ejecutar la aplicación usando gunicorn
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:80", "--workers", "3"]
