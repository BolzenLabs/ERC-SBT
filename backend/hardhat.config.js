require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
const {
  RINKEBY_PRIVATE_KEY,
  RINKEBY_ALCHEMY_URL,
  GOERLI_PRIVATE_KEY,
  GOERLI_ALCHEMY_URL,
  EVMOS_TESTNET_URL,
  EVMOS_PRIVATE_KEY,
} = process.env;
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.0",
  networks: {
    rinkeby: {
      url: RINKEBY_ALCHEMY_URL,
      accounts: [`0x${RINKEBY_PRIVATE_KEY}`],
    },
    goerli: {
      url: GOERLI_ALCHEMY_URL,
      accounts: [`0x${GOERLI_PRIVATE_KEY}`],
    },
    evmos: {
      url: EVMOS_TESTNET_URL,
      accounts: [`0x${EVMOS_PRIVATE_KEY}`],
    },
  },
};
