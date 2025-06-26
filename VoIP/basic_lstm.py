import pandas as pd
import numpy as np
import torch 
import torch.nn as nn
from sklearn.preprocessing import MinMaxScaler

# Load and preprocess data
df = pd.read_csv("sample_cdr_data.csv", parse_dates=["timestamp"])
df = df.sort_values("timestamp")

# Scale data
scaler = MinMaxScaler()
df_scaled = scaler.fit_transform(df[["jitter_ms", "packet_loss_pct", "latency_ms"]])

def create_sequences(data, window=10):
    sequences = []
    for i in range(len(data) - window):
        sequences.append(data[i:i+window])
    return np.array(sequences)

X = create_sequences(df_scaled)

# LSTM Model in PyTorch
class LSTMAnomalyDetector(nn.Module):
    def __init__(self, input_size=3, hidden_size=64):
        super().__init__()
        self.lstm = nn.LSTM(input_size, hidden_size, batch_first=True)
        self.decoder = nn.Linear(hidden_size, input_size)

    def forward(self, x):
        lstm_out, _ = self.lstm(x)  # Unpack tuple directly
        out = self.decoder(lstm_out)
        return out

# Info library for summary
from torchinfo import summary as torchinfo_summary

model = LSTMAnomalyDetector()
print("Using torchinfo:")
torchinfo_summary(model, input_size=(1, 10, 3))  # (batch_size, seq_len, features)


# Demonstrate the model works correctly
print("\nTesting model forward pass:")
model = LSTMAnomalyDetector()
test_input = torch.randn(5, 10, 3)  # batch_size=5, seq_len=10, features=3
output = model(test_input)
print(f"Input shape: {test_input.shape}")
print(f"Output shape: {output.shape}")
