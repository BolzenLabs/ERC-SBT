# Basic Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```

## Deployment

```bash
$npx hardhat run scripts/deploy.js --network <network-name>

```

With our current configuration, running it without the --network parameter would cause the code to run against an embedded instance of Hardhat Network. In this scenario, the deployment actually gets lost when Hardhat finishes running, but it's still useful to test that our deployment code works:

```bash
$npx hardhat run scripts/deploy.js
Deploying contracts with the account: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
Account balance: 10000000000000000000000
Token address: 0x5FbDB2315678afecb367f032d93F642f64180aa3
```

### Deploy to goerli

Fill out .env.example with necessary keys ..

```bash
$npx hardhat run scripts/deploy.js --network goerli
Deploying contracts with the account: 0xE8857156276388683047eA7485369e7e9c039182
Account balance: 50000000000000000
Token address: 0xF1Ff3E3e0395b4b8bb75747022C7b97E22037544
```
