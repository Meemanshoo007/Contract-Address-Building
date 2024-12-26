const ethers = require("ethers");
const abi = require("./abi");

async function readContract() {

    const provider = new ethers.JsonRpcProvider("https://ethereum-sepolia-rpc.publicnode.com");
    const contractAddress = "0x2eda106709cfecf20081d389b92d98310320f9e7";

    const contractInstance = new ethers.Contract(contractAddress,abi,provider);
    const value = await contractInstance.retrieve();
    console.log(value);
    
}

readContract();