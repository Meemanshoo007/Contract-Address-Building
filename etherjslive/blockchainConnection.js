const ethers = require("ethers");

async function fetchAccountBalance() {
    const provider = new ethers.JsonRpcProvider("https://ethereum-sepolia-rpc.publicnode.com");//https://ethereum.publicnode.com
    const balance = await provider.getBalance("0x061dE3A3db8475E2549256807C379a7eDB9DD620");//0x28c6c06298d514db089934071355e5743bf21d60
    const etherBalance = ethers.formatEther(balance);
    console.log(etherBalance);

}

fetchAccountBalance();