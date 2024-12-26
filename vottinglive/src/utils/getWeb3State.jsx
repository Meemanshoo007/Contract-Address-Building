import {ethers} from 'ethers';
import abi from '../constant/abi.json';

export const getWeb3State = async()=>{
    try{
        // Metamask installation check
     
        if(!window.ethereum){
            throw new Error("Metamask is not installed")
        }

        const accounts = await window.ethereum.request({
            method: "eth_requestAccounts"
        })

        const selectedAccount = accounts[0];

        const chainIdHex = await window.ethereum.request({
            method: "eth_chainId"
        })

        const chainId = parseInt(chainIdHex,16)

        const provider = new ethers.BrowserProvider(window.ethereum)

        const signer = await provider.getSigner();

        const contractAddress = "0xd9145CCE52D386f254917e481eB44e9943F39138";
        const contractInstance = new ethers.Contract(contractAddress,abi,signer);

        return {contractInstance,selectedAccount,chainId}

    
    }
    catch(error){
        console.log(error)
        throw new Error
    }
}