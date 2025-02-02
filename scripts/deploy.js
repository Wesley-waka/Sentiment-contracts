const { ethers } = require('hardhat');

async function main() {
  // Get the ContractFactory for the FeedbackStorage contract
  const FeedbackStorage = await ethers.getContractFactory('FeedbackStorage');

  // Deploy the contract
  const feedbackStorage = await FeedbackStorage.deploy();

  // Wait for the contract to be deployed
  await feedbackStorage.deployed();

  // Log the contract address
  console.log('FeedbackStorage deployed to:', feedbackStorage.address);
}

// Run the deployment script
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });