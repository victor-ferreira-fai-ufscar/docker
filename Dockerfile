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

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código fonte para o container
COPY . .

# Expõe a porta que o Streamlit utiliza
EXPOSE 8501

# Configurações de saúde do container (opcional, mas recomendado)
HEALTHCHECK CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8501/_stcore/health').read()"

# Define o volume para persistência ou live-reload
VOLUME ["/app/volume-1"]

# Comando para executar o frontend Streamlit
ENTRYPOINT ["streamlit", "run", "frontend.py", "--server.port=8501", "--server.address=0.0.0.0"]

# DATA E HORA ATUAL: 23/03/2026 15:23