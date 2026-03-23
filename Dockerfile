# Use uma imagem oficial do Python como base
FROM python:3.11-slim

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


VOLUME /app/dados/