# Use uma imagem oficial do Python como base
FROM python:3.11-slim

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
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

# Comando para executar o frontend Streamlit
ENTRYPOINT ["streamlit", "run", "frontend.py", "--server.port=8501", "--server.address=0.0.0.0"]
