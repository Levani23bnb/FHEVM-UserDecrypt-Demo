import { expect } from "chai";
import { ethers } from "hardhat";

describe("UserDecryptDemo", function () {
  it("Should store and decrypt user value correctly", async function () {
    const [user1, user2] = await ethers.getSigners();

    const UserDecryptDemo = await ethers.getContractFactory("UserDecryptDemo");
    const contract = await UserDecryptDemo.deploy();
    await contract.deployed();

    // User1 stores encrypted value
    await contract.connect(user1).storeEncrypted(12345);

    // Decrypt value
    const decrypted = await contract.connect(user1).decryptValue();
    expect(decrypted).to.equal(12345);

    // User2 has no value stored
    await expect(contract.connect(user2).decryptValue()).to.be.revertedWith("No value stored");

    // Public encrypted value check
    const encryptedVal = await contract.getEncryptedValue(user1.address);
    expect(encryptedVal).to.equal(12345);
  });
});
