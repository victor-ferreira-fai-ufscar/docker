# Use uma imagem oficial do Python como base
FROM python:3.11-slim

# Instala o JRE (Java Runtime Environment)
RUN apt-get update && apt-get install -y --no-install-recommends \
    default-jre \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências (se houver alguma no requirements.txt)
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código fonte para o container
COPY . .

# Comando para executar a aplicação
CMD ["python", "app.py"]
