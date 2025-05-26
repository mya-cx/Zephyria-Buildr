// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// ZephyriaOracle: Community weather data oracle with sensor registration and data submission
contract ZephyriaOracle {
    address public admin;             // Contract admin who registers sensors
    uint256 public sensorCount;       // Count of registered sensors

    struct Sensor {
        bool registered;
        string location;
    }

    struct DataPoint {
        string dataType;              // e.g., "temperature"
        int256 value;                 // e.g., 25 (Celsius)
        uint256 timestamp;
        string geoHash;               // encoded location or region
        address submittedBy;
    }

    mapping(address => Sensor) public sensors;
    DataPoint[] public dataLog;

    event SensorRegistered(address sensor, string location);
    event DataSubmitted(address sensor, string dataType, int256 value, string geoHash, uint256 timestamp);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call");
        _;
    }

    modifier onlyRegisteredSensor() {
        require(sensors[msg.sender].registered, "Not a registered sensor");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    // Admin registers sensors
    function registerSensor(address sensorAddr, string calldata location) external onlyAdmin {
        require(sensorAddr != address(0), "Invalid sensor address");
        require(!sensors[sensorAddr].registered, "Sensor already registered");

        sensors[sensorAddr] = Sensor(true, location);
        sensorCount += 1;
        emit SensorRegistered(sensorAddr, location);
    }

    // Registered sensors submit data
    function submitData(string calldata dataType, int256 value, string calldata geoHash, uint256 timestamp) external onlyRegisteredSensor {
        require(timestamp <= block.timestamp, "Timestamp cannot be in the future");

        dataLog.push(DataPoint(dataType, value, timestamp, geoHash, msg.sender));
        emit DataSubmitted(msg.sender, dataType, value, geoHash, timestamp);
    }

    // Returns the latest data point
    function getLatestData() external view returns (DataPoint memory) {
        require(dataLog.length > 0, "No data available");
        return dataLog[dataLog.length - 1];
    }

    // Returns total number of data points submitted
    function getDataCount() external view returns (uint256) {
        return dataLog.length;
    }
}

