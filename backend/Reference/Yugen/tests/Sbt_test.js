const { expect } = require("chai");
const { ethers } = require("hardhat");
const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");

describe("SBT", function () {
  console.log("Das ist ein TEST");
  //STuff to be ran beforehand.
  before(async () => {
    [owner, user1, user2, user3] = await ethers.getSigners();
    const SBTContract = await ethers.getContractFactory("SBT");
    sbt = await SBTContract.deploy("Test SBT Token");
  });

  //Test Contract Constructor
  it("Should return the name and ticker", async function () {
    expect(await sbt.name()).to.equal("Test SBT Token");
  });

  //Check hasSoul functionality
  it("hasSoul shoulsd return false for new query", async function () {
    expect(await sbt.hasSoul(user1.address)).to.equal(false);
  });

  //Check mint functionality & hasSoul functionality
  it("Should mint a new soul", async function () {
    const soul = ["aaronbading", "Aaron Bading", "URI1", "URI2"];
    await sbt.connect(user1).mint(user1.address, soul); // user1 calls the function
    expect(await sbt.hasSoul(user1.address)).to.equal(true);
  });

  it("Should fail when trying to mint again", async function () {
    const soul = ["aaronbading", "Aaron Bading", "URI1", "URI2"];
    // user1 calls the function
    await expect(
      sbt.connect(user1).mint(user1.address, soul)
    ).to.be.revertedWithCustomError(sbt, "ExistingToken");
  });

  it("Test Minting for other address", async function () {
    const soul = ["aaronbading", "Aaron Bading", "URI1", "URI2"];
    // user1 calls the function
    await expect(
      sbt.connect(user2).mint(user1.address, soul)
    ).to.be.revertedWithCustomError(sbt, "ExistingToken");

    expect(await sbt.hasSoul(user2.address)).to.equal(false);
  });

  it("getSoul should return the correct identifier", async function () {
    const soul = await sbt.getSoul(user1.address);

    expect(soul[0]).to.equal("aaronbading");
    expect(soul[1]).to.equal("Aaron Bading");
  });

  it("Operator should be able to update soul", async function () {
    await sbt.connect(user1).updateURI(user1.address, "newURI", 0);
  });

  it("getSoul should return the updated value", async function () {
    const soul = await sbt.getSoul(user1.address);
    //console.log(soul);
    expect(soul[2]).to.equal("newURI");
  });

  it("Should burn a soul", async function () {
    await sbt.connect(user1).burn(user1.address); // user1 calls the function
    expect(await sbt.hasSoul(user1.address)).to.equal(false);
  });
});
