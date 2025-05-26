# 🌤️ Zephyria

<img src="Screenshot 2025-05-26 144441.png" alt="Zephyria Oracle Banner" width="100%" />

**Zephyria** is a decentralized, on-chain weather oracle powered by IoT sensors. It allows registered devices to submit atmospheric data such as temperature, humidity, and location, making this data publicly accessible for use in insurance, climate tools, and dApps.

---

## 📜 Contract Info

- **Network**: Ethereum / Core / Sepolia / etc.
- **Contract Address**: `0xf374585a76167634e7c59ea038c70af6bb3a86be`  

---

## 📦 Features

- 🔐 Admin-controlled sensor registration  
- 🌐 Location-tagged weather submissions  
- 📊 On-chain historical data  
- 🧾 Emitted events for indexing  
- 🔎 Easy access to latest readings  

---

## 🛠️ How It Works

1. Admin registers sensor (IoT device or oracle address)
2. Sensor submits weather data (e.g., temperature in Celsius)
3. Data stored on-chain and accessible to other dApps
4. Events allow for efficient off-chain indexing

---

## 📤 Core Functions

```solidity
function registerSensor(address sensor, string location) external
function submitData(string dataType, int256 value, string geoHash, uint256 timestamp) external
function getLatestData() external view returns (DataPoint)
function getDataCount() external view returns (uint256)
