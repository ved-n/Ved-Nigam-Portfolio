import pandas as pd
import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics import mean_squared_error
import matplotlib.pyplot as plt
import seaborn as sns
from datetime import datetime, timedelta
import warnings
warnings.filterwarnings('ignore')

def generate_sample_cdr_data(n_records=500, filename="sample_cdr_data.csv"):
    """
    Generate realistic CDR (Call Detail Record) sample data with various scenarios
    """
    np.random.seed(42)  # For reproducible results
    
    print(f"Generating {n_records} CDR records...")
    
    # Base timestamp - starting from a realistic date
    start_time = datetime(2024, 1, 1, 8, 0, 0)  # Start at 8 AM
    timestamps = []
    
    # Create realistic timestamps (calls every 2-5 minutes on average)
    current_time = start_time
    for i in range(n_records):
        timestamps.append(current_time)
        # Add random interval between calls (30 seconds to 10 minutes)
        interval = np.random.exponential(3) + 0.5  # Minutes
        current_time += timedelta(minutes=interval)
    
    # Initialize lists for CDR data
    call_ids = [f"CALL_{i:06d}" for i in range(1, n_records + 1)]
    caller_ids = [f"USER_{np.random.randint(1000, 9999)}" for _ in range(n_records)]
    call_durations = np.random.exponential(120) + 30  # Call duration in seconds (30s to ~10min)
    
    # Network quality metrics - realistic distributions
    jitter_ms = []
    packet_loss_pct = []
    latency_ms = []
    call_quality_scores = []
    
    for i in range(n_records):
        hour = timestamps[i].hour
        
        # Simulate different network conditions based on time of day
        if 9 <= hour <= 17:  # Business hours - more traffic, slightly worse quality
            base_jitter = np.random.gamma(2, 1.5)  # Slightly higher jitter
            base_loss = np.random.exponential(0.15)  # Low packet loss
            base_latency = np.random.normal(25, 8)  # Moderate latency
        elif 18 <= hour <= 22:  # Evening peak - worst quality
            base_jitter = np.random.gamma(3, 2.0)  # Higher jitter
            base_loss = np.random.exponential(0.25)  # Higher packet loss
            base_latency = np.random.normal(35, 12)  # Higher latency
        else:  # Off-peak hours - best quality
            base_jitter = np.random.gamma(1.5, 1.0)  # Lower jitter
            base_loss = np.random.exponential(0.08)  # Very low packet loss
            base_latency = np.random.normal(18, 5)  # Lower latency
        
        # Add some random network events/anomalies (5% of calls)
        if np.random.random() < 0.05:
            # Network spike event
            base_jitter *= np.random.uniform(3, 8)
            base_loss *= np.random.uniform(5, 15)
            base_latency *= np.random.uniform(2, 5)
        
        # Ensure realistic bounds
        jitter = max(0.1, min(base_jitter, 50))  # 0.1ms to 50ms
        loss = max(0, min(base_loss, 10))  # 0% to 10%
        latency = max(5, min(base_latency, 500))  # 5ms to 500ms
        
        jitter_ms.append(round(jitter, 2))
        packet_loss_pct.append(round(loss, 3))
        latency_ms.append(round(latency, 1))
        
        # Calculate call quality score (MOS-like: 1-5 scale)
        # Lower jitter, loss, latency = higher quality
        quality_score = 5.0
        quality_score -= min(2.0, jitter / 10)  # Jitter penalty
        quality_score -= min(2.0, loss * 0.5)   # Packet loss penalty
        quality_score -= min(1.5, (latency - 20) / 50)  # Latency penalty
        quality_score = max(1.0, min(5.0, quality_score))
        call_quality_scores.append(round(quality_score, 2))
    
    # Create DataFrame
    cdr_data = {
        'timestamp': timestamps,
        'call_id': call_ids,
        'caller_id': caller_ids,
        'call_duration_sec': [round(d, 1) for d in call_durations],
        'jitter_ms': jitter_ms,
        'packet_loss_pct': packet_loss_pct,
        'latency_ms': latency_ms,
        'call_quality_score': call_quality_scores
    }
    
    df = pd.DataFrame(cdr_data)
    
    # Add some additional realistic fields
    df['day_of_week'] = df['timestamp'].dt.day_name()
    df['hour'] = df['timestamp'].dt.hour
    df['is_weekend'] = df['timestamp'].dt.weekday >= 5
    
    # Save to CSV
    df.to_csv(filename, index=False)
    print(f"✅ CDR data saved to '{filename}'")
    
    # Print summary statistics
    print(f"\n📊 Data Summary:")
    print(f"Total Records: {len(df)}")
    print(f"Date Range: {df['timestamp'].min()} to {df['timestamp'].max()}")
    print(f"Duration: {(df['timestamp'].max() - df['timestamp'].min()).days} days")
    
    print(f"\n📈 Network Quality Metrics:")
    quality_stats = df[['jitter_ms', 'packet_loss_pct', 'latency_ms', 'call_quality_score']].describe()
    print(quality_stats.round(3))
    
    # Identify potential anomalies in the generated data
    jitter_anomalies = df[df['jitter_ms'] > df['jitter_ms'].quantile(0.95)]
    loss_anomalies = df[df['packet_loss_pct'] > df['packet_loss_pct'].quantile(0.95)]
    latency_anomalies = df[df['latency_ms'] > df['latency_ms'].quantile(0.95)]
    
    print(f"\n🚨 Potential Anomalies (95th percentile):")
    print(f"High Jitter (>{df['jitter_ms'].quantile(0.95):.1f}ms): {len(jitter_anomalies)} records")
    print(f"High Packet Loss (>{df['packet_loss_pct'].quantile(0.95):.2f}%): {len(loss_anomalies)} records")
    print(f"High Latency (>{df['latency_ms'].quantile(0.95):.1f}ms): {len(latency_anomalies)} records")
    
    return df

generate_sample_cdr_data(500, "sample_cdr_data")

class LSTMAnomalyDetector(nn.Module):
    def __init__(self, input_size=3, hidden_size=64):
        super().__init__()
        self.lstm = nn.LSTM(input_size, hidden_size, batch_first=True)
        self.decoder = nn.Linear(hidden_size, input_size)
        self.dropout = nn.Dropout(0.2)

    def forward(self, x):
        lstm_out, _ = self.lstm(x)
        lstm_out = self.dropout(lstm_out)
        out = self.decoder(lstm_out)
        return out

class CDRAnomalyAnalyzer:
    def __init__(self, window_size=10, threshold_percentile=95):
        self.window_size = window_size
        self.threshold_percentile = threshold_percentile
        self.model = None
        self.scaler = MinMaxScaler()
        self.is_trained = False
        self.anomaly_threshold = None
        self.feature_columns = ["jitter_ms", "packet_loss_pct", "latency_ms"]
        
    def create_sequences(self, data, window=None):
        """Create sliding window sequences for LSTM input"""
        if window is None:
            window = self.window_size
            
        sequences = []
        targets = []
        
        for i in range(len(data) - window):
            sequences.append(data[i:i+window])
            targets.append(data[i+window])  # Next timestep as target
            
        return np.array(sequences), np.array(targets)
    
    def prepare_data(self, df):
        """Prepare and scale the CDR data"""
        # Ensure required columns exist
        missing_cols = [col for col in self.feature_columns if col not in df.columns]
        if missing_cols:
            raise ValueError(f"Missing required columns: {missing_cols}")
        
        # Extract and scale features
        data = df[self.feature_columns].values
        scaled_data = self.scaler.fit_transform(data)
        
        return scaled_data
    
    def train_model(self, df, epochs=100, learning_rate=0.001, batch_size=32):
        """Train the LSTM anomaly detector on normal CDR data"""
        print("Preparing training data...")
        
        # Prepare data
        scaled_data = self.prepare_data(df)
        X, y = self.create_sequences(scaled_data)
        
        # Convert to PyTorch tensors
        X_tensor = torch.FloatTensor(X)
        y_tensor = torch.FloatTensor(y)
        
        # Initialize model
        self.model = LSTMAnomalyDetector(input_size=len(self.feature_columns))
        criterion = nn.MSELoss()
        optimizer = optim.Adam(self.model.parameters(), lr=learning_rate)
        
        # Training loop
        print(f"Training model for {epochs} epochs...")
        train_losses = []
        
        for epoch in range(epochs):
            self.model.train()
            epoch_loss = 0
            
            # Mini-batch training
            for i in range(0, len(X_tensor), batch_size):
                batch_X = X_tensor[i:i+batch_size]
                batch_y = y_tensor[i:i+batch_size]
                
                optimizer.zero_grad()
                
                # Forward pass - predict the next timestep
                predictions = self.model(batch_X)
                # Use the last timestep prediction
                loss = criterion(predictions[:, -1, :], batch_y)
                
                loss.backward()
                optimizer.step()
                epoch_loss += loss.item()
            
            avg_loss = epoch_loss / (len(X_tensor) // batch_size + 1)
            train_losses.append(avg_loss)
            
            if (epoch + 1) % 20 == 0:
                print(f"Epoch [{epoch+1}/{epochs}], Loss: {avg_loss:.6f}")
        
        # Calculate anomaly threshold using training data
        self.model.eval()
        with torch.no_grad():
            train_predictions = self.model(X_tensor)
            train_errors = torch.mean((train_predictions[:, -1, :] - y_tensor) ** 2, dim=1)
            self.anomaly_threshold = np.percentile(train_errors.numpy(), self.threshold_percentile)
        
        self.is_trained = True
        print(f"Training completed! Anomaly threshold set to: {self.anomaly_threshold:.6f}")
        
        return train_losses
    
    def detect_anomalies(self, df):
        """Detect anomalies in new CDR data"""
        if not self.is_trained:
            raise ValueError("Model must be trained before detecting anomalies")
        
        print("Detecting anomalies...")
        
        # Prepare data using the same scaler
        scaled_data = self.scaler.transform(df[self.feature_columns].values)
        X, y = self.create_sequences(scaled_data)
        
        if len(X) == 0:
            raise ValueError(f"Not enough data points. Need at least {self.window_size + 1} records")
        
        # Convert to tensors
        X_tensor = torch.FloatTensor(X)
        y_tensor = torch.FloatTensor(y)
        
        # Get predictions
        self.model.eval()
        with torch.no_grad():
            predictions = self.model(X_tensor)
            reconstruction_errors = torch.mean((predictions[:, -1, :] - y_tensor) ** 2, dim=1)
        
        # Identify anomalies
        anomalies = reconstruction_errors.numpy() > self.anomaly_threshold
        
        # Create results dataframe
        results_df = df.iloc[self.window_size:].copy()  # Skip first window_size rows
        results_df['reconstruction_error'] = reconstruction_errors.numpy()
        results_df['is_anomaly'] = anomalies
        results_df['anomaly_score'] = reconstruction_errors.numpy() / self.anomaly_threshold
        
        return results_df
    
    def analyze_anomalies(self, results_df):
        """Analyze and categorize the detected anomalies"""
        anomalies = results_df[results_df['is_anomaly']]
        
        if len(anomalies) == 0:
            print("No anomalies detected in the data.")
            return {}
        
        analysis = {
            'total_records': len(results_df),
            'anomaly_count': len(anomalies),
            'anomaly_rate': len(anomalies) / len(results_df) * 100,
            'avg_anomaly_score': anomalies['anomaly_score'].mean(),
            'max_anomaly_score': anomalies['anomaly_score'].max(),
            'anomaly_features': {}
        }
        
        # Analyze which features contribute most to anomalies
        for feature in self.feature_columns:
            feature_stats = {
                'normal_mean': results_df[~results_df['is_anomaly']][feature].mean(),
                'anomaly_mean': anomalies[feature].mean(),
                'normal_std': results_df[~results_df['is_anomaly']][feature].std(),
                'anomaly_std': anomalies[feature].std()
            }
            analysis['anomaly_features'][feature] = feature_stats
        
        return analysis
    
    def generate_insights(self, analysis, results_df):
        """Generate business insights from anomaly analysis"""
        if analysis['anomaly_count'] == 0:
            return ["No anomalies detected. Network performance appears normal."]
        
        insights = []
        
        # Overall anomaly rate insight
        rate = analysis['anomaly_rate']
        if rate > 10:
            insights.append(f"⚠️ HIGH ALERT: {rate:.1f}% anomaly rate indicates significant network issues")
        elif rate > 5:
            insights.append(f"⚠️ MODERATE ALERT: {rate:.1f}% anomaly rate suggests network degradation")
        else:
            insights.append(f"ℹ️ LOW ALERT: {rate:.1f}% anomaly rate - minor network irregularities detected")
        
        # Feature-specific insights
        for feature, stats in analysis['anomaly_features'].items():
            normal_mean = stats['normal_mean']
            anomaly_mean = stats['anomaly_mean']
            
            if feature == 'jitter_ms':
                if anomaly_mean > normal_mean * 2:
                    insights.append(f"📶 Jitter spikes detected: {anomaly_mean:.2f}ms vs normal {normal_mean:.2f}ms - may cause voice quality issues")
            elif feature == 'packet_loss_pct':
                if anomaly_mean > normal_mean * 2:
                    insights.append(f"📦 Packet loss increased: {anomaly_mean:.2f}% vs normal {normal_mean:.2f}% - network congestion likely")
            elif feature == 'latency_ms':
                if anomaly_mean > normal_mean * 1.5:
                    insights.append(f"⏱️ Latency degradation: {anomaly_mean:.2f}ms vs normal {normal_mean:.2f}ms - routing issues possible")
        
        # Time-based insights
        if 'timestamp' in results_df.columns:
            anomaly_times = results_df[results_df['is_anomaly']]['timestamp']
            if len(anomaly_times) > 0:
                peak_hours = anomaly_times.dt.hour.value_counts().head(3)
                insights.append(f"🕐 Peak anomaly hours: {', '.join([f'{hour}:00' for hour in peak_hours.index])}")
        
        return insights
    
    def visualize_anomalies(self, results_df, save_path=None):
        """Create visualizations for anomaly detection results"""
        fig, axes = plt.subplots(2, 2, figsize=(15, 10))
        
        # 1. Reconstruction Error Over Time
        ax1 = axes[0, 0]
        ax1.plot(results_df.index, results_df['reconstruction_error'], alpha=0.7, label='Reconstruction Error')
        ax1.axhline(y=self.anomaly_threshold, color='r', linestyle='--', label='Threshold')
        anomalies = results_df[results_df['is_anomaly']]
        ax1.scatter(anomalies.index, anomalies['reconstruction_error'], color='red', s=50, alpha=0.8, label='Anomalies')
        ax1.set_title('Reconstruction Error Over Time')
        ax1.set_ylabel('Reconstruction Error')
        ax1.legend()
        
        # 2. Feature Distribution: Normal vs Anomalies
        ax2 = axes[0, 1]
        normal_data = results_df[~results_df['is_anomaly']][self.feature_columns]
        anomaly_data = results_df[results_df['is_anomaly']][self.feature_columns]
        
        x = np.arange(len(self.feature_columns))
        normal_means = normal_data.mean()
        anomaly_means = anomaly_data.mean() if len(anomaly_data) > 0 else pd.Series([0]*len(self.feature_columns), index=self.feature_columns)
        
        width = 0.35
        ax2.bar(x - width/2, normal_means, width, label='Normal', alpha=0.8)
        ax2.bar(x + width/2, anomaly_means, width, label='Anomalies', alpha=0.8)
        ax2.set_xlabel('Features')
        ax2.set_ylabel('Average Value')
        ax2.set_title('Feature Comparison: Normal vs Anomalies')
        ax2.set_xticks(x)
        ax2.set_xticklabels(self.feature_columns, rotation=45)
        ax2.legend()
        
        # 3. Anomaly Score Distribution
        ax3 = axes[1, 0]
        ax3.hist(results_df['anomaly_score'], bins=50, alpha=0.7, edgecolor='black')
        ax3.axvline(x=1.0, color='r', linestyle='--', label='Threshold (Score=1.0)')
        ax3.set_xlabel('Anomaly Score')
        ax3.set_ylabel('Frequency')
        ax3.set_title('Distribution of Anomaly Scores')
        ax3.legend()
        
        # 4. Time Series of All Features
        ax4 = axes[1, 1]
        for i, feature in enumerate(self.feature_columns):
            ax4.plot(results_df.index, results_df[feature], alpha=0.7, label=feature)
        
        # Highlight anomaly periods
        anomaly_indices = results_df[results_df['is_anomaly']].index
        for idx in anomaly_indices:
            ax4.axvline(x=idx, color='red', alpha=0.3, linewidth=0.5)
        
        ax4.set_xlabel('Time Index')
        ax4.set_ylabel('Feature Values')
        ax4.set_title('Feature Values Over Time (Red lines = Anomalies)')
        ax4.legend()
        
        plt.tight_layout()
        
        if save_path:
            plt.savefig(save_path, dpi=300, bbox_inches='tight')
            print(f"Visualization saved to {save_path}")
        
        plt.show()

# Example usage and demonstration
def demonstrate_cdr_analysis():
    """Demonstrate how to use the CDR anomaly analyzer"""
    
    # Step 1: Create sample training data (normal network conditions)
    print("=== CDR ANOMALY DETECTION DEMONSTRATION ===\n")
    
    np.random.seed(42)
    n_samples = 1000
    
    # Simulate normal CDR data
    normal_data = {
        'timestamp': pd.date_range('2024-01-01', periods=n_samples, freq='5min'),
        'jitter_ms': np.random.normal(2.0, 0.5, n_samples),  # Normal jitter around 2ms
        'packet_loss_pct': np.random.normal(0.1, 0.05, n_samples),  # Very low packet loss
        'latency_ms': np.random.normal(20, 3, n_samples)  # Normal latency around 20ms
    }
    
    train_df = pd.DataFrame(normal_data)
    train_df = train_df[train_df['jitter_ms'] > 0]  # Remove negative values
    train_df = train_df[train_df['packet_loss_pct'] > 0]
    
    print(f"Training data: {len(train_df)} normal CDR records")
    print(train_df[['jitter_ms', 'packet_loss_pct', 'latency_ms']].describe())
    
    # Step 2: Initialize and train the analyzer
    analyzer = CDRAnomalyAnalyzer(window_size=10, threshold_percentile=95)
    
    print("\n=== TRAINING PHASE ===")
    train_losses = analyzer.train_model(train_df, epochs=50, batch_size=32)
    
    # Step 3: Create test data with some anomalies
    print("\n=== GENERATING TEST DATA WITH ANOMALIES ===")
    
    test_samples = 500
    # Normal test data
    test_data = {
        'timestamp': pd.date_range('2024-02-01', periods=test_samples, freq='5min'),
        'jitter_ms': np.random.normal(2.0, 0.5, test_samples),
        'packet_loss_pct': np.random.normal(0.1, 0.05, test_samples),
        'latency_ms': np.random.normal(20, 3, test_samples)
    }
    
    # Inject anomalies at specific points
    anomaly_indices = [100, 150, 200, 250, 300, 350]
    for idx in anomaly_indices:
        if idx < test_samples:
            # Create different types of anomalies
            if idx in [100, 200, 300]:  # High jitter anomalies
                test_data['jitter_ms'][idx] = np.random.normal(10, 2)  # Much higher jitter
            if idx in [150, 250]:  # Packet loss anomalies  
                test_data['packet_loss_pct'][idx] = np.random.normal(2, 0.5)  # High packet loss
            if idx in [200, 350]:  # Latency anomalies
                test_data['latency_ms'][idx] = np.random.normal(100, 10)  # Very high latency
    
    test_df = pd.DataFrame(test_data)
    test_df = test_df[test_df['jitter_ms'] > 0]
    test_df = test_df[test_df['packet_loss_pct'] > 0]
    
    print(f"Test data: {len(test_df)} CDR records with injected anomalies")
    
    # Step 4: Detect anomalies
    print("\n=== ANOMALY DETECTION PHASE ===")
    results_df = analyzer.detect_anomalies(test_df)
    
    # Step 5: Analyze results
    analysis = analyzer.analyze_anomalies(results_df)
    
    print(f"\n=== ANALYSIS RESULTS ===")
    print(f"Total Records Analyzed: {analysis['total_records']}")
    print(f"Anomalies Detected: {analysis['anomaly_count']}")
    print(f"Anomaly Rate: {analysis['anomaly_rate']:.2f}%")
    print(f"Average Anomaly Score: {analysis['avg_anomaly_score']:.2f}")
    
    # Step 6: Generate insights
    print(f"\n=== BUSINESS INSIGHTS ===")
    insights = analyzer.generate_insights(analysis, results_df)
    for insight in insights:
        print(f"• {insight}")
    
    # Step 7: Show top anomalies
    print(f"\n=== TOP ANOMALIES ===")
    top_anomalies = results_df[results_df['is_anomaly']].nlargest(5, 'anomaly_score')
    print(top_anomalies[['timestamp', 'jitter_ms', 'packet_loss_pct', 'latency_ms', 'anomaly_score']])
    
    # Step 8: Visualize results
    print(f"\n=== CREATING VISUALIZATIONS ===")
    analyzer.visualize_anomalies(results_df)
    
    return analyzer, results_df, analysis

# Run the demonstration
if __name__ == "__main__":
    analyzer, results, analysis = demonstrate_cdr_analysis()
    
    print("\n=== HOW TO USE WITH YOUR DATA ===")
    print("""
    1. Train on historical 'normal' CDR data:
       analyzer = CDRAnomalyAnalyzer()
       analyzer.train_model(normal_cdr_df)
    
    2. Detect anomalies in new CDR data:
       results = analyzer.detect_anomalies(new_cdr_df)
    
    3. Analyze and get insights:
       analysis = analyzer.analyze_anomalies(results)
       insights = analyzer.generate_insights(analysis, results)
    
    4. Take action based on insights:
       - High jitter → Check network equipment
       - High packet loss → Investigate congestion
       - High latency → Check routing paths
    """)