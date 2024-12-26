const ethers = require("ethers");
const abi = require("./abi");
require("dotenv").config();

async function writeContract() {

    const provider = new ethers.JsonRpcProvider("https://ethereum-sepolia-rpc.publicnode.com");
    const contractAddress = "0x2eda106709cfecf20081d389b92d98310320f9e7";
    const privateKey = process.env.PRIVATE_KEY;

    const wallet = new ethers.Wallet(privateKey,provider);

    const contractInstance = new ethers.Contract(contractAddress,abi,wallet);
    await contractInstance.store(10);
    console.log("Transaction Successful");
    
}

writeContract();