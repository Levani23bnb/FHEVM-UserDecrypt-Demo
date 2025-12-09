
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title UserDecryptDemo
/// @notice Demonstrates user decryption on FHEVM with secure handling
contract UserDecryptDemo {

    // Simulated encrypted values storage
    mapping(address => uint256) private encryptedValues;

    /// @notice Store an "encrypted" value for the sender
    /// @param encryptedValue The value to store (pretend encrypted)
    function storeEncrypted(uint256 encryptedValue) external {
        encryptedValues[msg.sender] = encryptedValue;
    }

    /// @notice Decrypts the stored value for the user
    /// @dev In real FHEVM, decryption happens off-chain with user's key
    function decryptValue() external view returns (uint256) {
        require(encryptedValues[msg.sender] != 0, "No value stored");
        // Demo decryption: simply returns the stored value
        return encryptedValues[msg.sender];
    }

    /// @notice Get encrypted value (public)
    function getEncryptedValue(address user) external view returns (uint256) {
        return encryptedValues[user];
    }
}
