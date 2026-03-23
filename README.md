# Projeto Streamlit com Docker

Este guia explica como rodar a aplicação frontend (Streamlit) dentro de um container Docker corretamente, resolvendo problemas comuns de conexão e status de saúde.

## 🚀 Como Executar

### 1. Build da Imagem
Certifique-se de que você está na raiz do projeto onde o `Dockerfile` está localizado:
```powershell
docker build -t app-python-frontend .
```

### 2. Rodar o Container com Mapeamento de Portas
Para acessar o app no seu navegador (host), você **precisa** mapear a porta 8501 do Docker para a porta 8501 do seu computador:
```powershell
docker run -d -p 8501:8501 --name meu-app-streamlit app-python-frontend
```

### 3. Acessar o App
Abra seu navegador e acesse:
[http://localhost:8501](http://localhost:8501)

---

## 🛠️ Resolvendo Problemas Comuns

### "O site não abre (localhost:8501)"
*   **Motivo:** O container foi iniciado sem o parâmetro `-p 8501:8501`.
*   **Solução:** Pare o container atual e rode novamente com o comando de mapeamento acima.

### "Container com status unhealthy (Não Saudável)"
*   **Motivo:** O seu `Dockerfile` está usando `curl` para o `HEALTHCHECK`, mas imagens base `python:3.11-slim` não possuem `curl` instalado.
*   **Solução:** No seu `Dockerfile`, altere o comando de verificação para usar o próprio Python:
    ```dockerfile
    HEALTHCHECK CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8501/_stcore/health').read()"
    ```

### Limpeza de Containers Antigos
Caso queira remover o container antigo antes de rodar o novo:
```powershell
docker stop meu-app-streamlit
docker rm meu-app-streamlit
```
