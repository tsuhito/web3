const hre = require("hardhat");

const contractAddress = "0xCeb7833300ca8b4b4406703eC0ba3052D18c7E0e";

async function sleep(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
}

async function main() {
    // Deploy the CryptoDevs Contract
    const nftContract = await hre.ethers.deployContract("CryptoDevs", [contractAddress]);

    // wait for the contract to deploy
    await nftContract.waitForDeployment();

    // print the address of the deployed contract
    console.log("CryptoDevs Contract Address:", nftContract.target);

    // Sleep for 30 seconds while Etherscan indexes the new contract deployment
    await sleep(30 * 1000);

    // Verify the contract on Etherscan
    await hre.run("verify:verify", { 
        address: nftContract.target,
        constructorArguments: [contractAddress],
    });
}

// Call the main function and catch if there is any error
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });