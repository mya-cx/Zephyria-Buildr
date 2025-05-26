# 🌤️ Zephyria Oracle

**Zephyria Oracle** is a simple, Ethereum-based weather oracle system where registered sensors can submit atmospheric data (e.g. temperature, humidity) tied to geographic locations. This data can be accessed by smart contracts and decentralized applications to power parametric insurance, climate modeling, location-based games, and more.

---

## 📦 Features

- 🔐 **Admin-controlled sensor registration**  
- 🌍 **Weather data submission by registered sensors**  
- 🧾 **On-chain record of atmospheric data**  
- 📡 **Geo-tagged, timestamped data entries**  
- 📤 **Emits events for off-chain indexing and use**  

---

## 🛠️ How It Works

### 🔹 Roles
- **Admin**: The deployer of the contract, allowed to register new sensors.
- **Sensor**: A trusted device (represented by an Ethereum address) that can submit verified weather data.

### 🔹 Flow

1. Admin registers a sensor with its Ethereum address and a location tag.
2. The sensor submits a weather data entry (e.g., temperature at a given timestamp and location).
3. Data is stored on-chain in a public log and accessible through view functions.
4. Other contracts and dApps can read the latest or historical data.

---

## 🔐 Smart Contract Summary

```solidity
function registerSensor(address sensorAddr, string location) external onlyAdmin
