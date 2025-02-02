const { ethers } = require('hardhat');

async function main() {
  // Used to Get the ContractFactory for the FeedbackStorage contract
  const FeedbackStorage = await ethers.getContractFactory('FeedbackStorage');

  // Deploy the Feedback contract
  const feedbackStorage = await FeedbackStorage.deploy();

  // Wait for the contract to be deployed
  await feedbackStorage.deployed();

  // Log the contract address onCompletion of ddeployment
  console.log('FeedbackStorage deployed to:', feedbackStorage.address);
}

// Run the deployment script and console error else exit onCompletion
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });