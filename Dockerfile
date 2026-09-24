# ─── Imagen base ───────────────────────────────────────────────────────────────
FROM python:3.13-slim

# Variables de entorno para Python
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Dependencias del sistema necesarias para compilar mysqlclient
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    gcc \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copiar e instalar dependencias de Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código fuente del proyecto
COPY . .

# Exponer el puerto 80
EXPOSE 80

# Comando de arranque: ejecutar las migraciones y levantar el servidor en el puerto 80
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:80"]
