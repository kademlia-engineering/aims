#!/bin/bash

### Language Models
# Max tokens 2048
# Llama 7B - ggml - Fast but not great content
# wget https://huggingface.co/TheBloke/wizardLM-7B-GGML/resolve/main/wizardLM-7B.ggmlv3.q4_0.bin

# LLama2 13B - ggmlv3 - q5_K_S - Powerful but requires hardware resources, dont run this one on your laptop...
# wget https://huggingface.co/TheBloke/Llama-2-13B-chat-GGML/resolve/main/llama-2-13b-chat.ggmlv3.q5_K_S.bin

# Llama2 13b - ggmlv3 - q2_K - Same model as above, 2 bit, but with lower hardware requirements
wget https://huggingface.co/TheBloke/Llama-2-13B-chat-GGML/resolve/main/llama-2-13b-chat.ggmlv3.q2_K.bin

# Install Python Server
pip install "llama-cpp-python[server]"

# Run llama_cpp.server with the given Language Model
python3 -m llama_cpp.server --host $HOST --port $PORT --model llama-2-13b-chat.ggmlv3.q2_K.bin
