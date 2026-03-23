import streamlit as st
import sys

# Page configuration
st.set_page_config(
    page_title="Monitor de Ambiente Python",
    page_icon="🐍",
    layout="wide"
)

# Aesthetically pleasing UI
st.title("🚀 Olá! Bem-vindo ao seu ambiente Docker Python")

st.markdown("""
### Status do Sistema
Este frontend está rodando dentro de um container Docker.
""")

col1, col2 = st.columns(2)

with col1:
    st.info("💡 **Dica:** Você pode adicionar novas dependências no arquivo `requirements.txt` e reconstruir a imagem.")
    st.success("✅ O Streamlit está funcionando corretamente!")

with col2:
    st.write("📊 **Versão do Python:**")
    st.code(sys.version)

st.divider()

st.subheader("Configurações do Dockerfile")
st.markdown("""
O seu ambiente atual conta com:
- **Base image:** python:3.11-slim
- **Porta Exposta:** 8501
- **Ferramenta de Frontend:** Streamlit
""")

if st.button("Diga Oi para o Victor"):
    st.balloons()
    st.write("Victor e Debora, o ambiente está pronto para brilhar! ✨")
