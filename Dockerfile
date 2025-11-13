# Etapa 1: Instalar dependencias
FROM python:3.9-slim as builder

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo de dependencias
COPY requirements.txt /app/

# Instalar las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# ---

# Etapa 2: Construcción final
FROM python:3.9-slim

# Establecer el directorio de trabajo
WORKDIR /app

# COPIA CORREGIDA: Copiar el directorio de trabajo completo /app de la etapa builder.
# Esto garantiza que todas las dependencias y el código estén presentes.
COPY --from=builder /app /app/

# Copiar el resto del código de la aplicación (solo se copiará si hay archivos nuevos)
# Este paso asegura que el código fuente de tu máquina esté presente.
COPY . /app/

# Exponer el puerto 80
EXPOSE 80

# Comando para ejecutar la aplicación: Mantiene el uso de 'python -m gunicorn' (CORRECTO).
CMD ["python", "-m", "gunicorn", "app:app", "--bind", "0.0.0.0:80", "--workers", "3"]