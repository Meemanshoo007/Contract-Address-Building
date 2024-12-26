# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
```


setup - 

npm init --y

npm install --save-dev hardhat

npx hardhat init

npm install --save-dev @openzeppelin/hardhat-upgrades


from alchamy - 

curl --request POST \
     --url https://eth-mainnet.g.alchemy.com/v2/OKZlOp7YdhHxC7hX7PhUikerWVrDGwc2 \
     --header 'accept: application/json' \
     --header 'content-type: application/json' \
     --data '
{
  "id": 1,
  "jsonrpc": "2.0",
  "method": "eth_getBlockByNumber",
  "params": [
	  "finalized",
	  false
  ]
}
'

copy hardhat.config.js from CommonModule

npm install dotenv




