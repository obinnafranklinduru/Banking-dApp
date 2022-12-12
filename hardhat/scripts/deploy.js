const { ethers } = require("hardhat");

async function main() {
  const bankContract = await ethers.getContractFactory("Bank");
  const polygonContract = await ethers.getContractFactory("Polygon");
  const shibaContract = await ethers.getContractFactory("Shiba");
  const tetherContract = await ethers.getContractFactory("Tether");

  const deployBankContract = await bankContract.deploy();
  const depolyPolygonContract = await polygonContract.deploy();
  const deployShibaContract = await shibaContract.deploy();
  const deployTetherContract = await tetherContract.deploy();

  await deployBankContract.deployed();
  await depolyPolygonContract.deployed();
  await deployShibaContract.deployed();
  await deployTetherContract.deployed();

  await bankContract.whiteListedToken(
    ethers.utils.formatBytes32String('MATIC'),
    depolyPolygonContract.address
  );
  await bankContract.whiteListedToken(
    ethers.utils.formatBytes32String('SHIB'),
    depolyPolygonContract.address
  );
  await bankContract.whiteListedToken(
    ethers.utils.formatBytes32String('USDT'),
    depolyPolygonContract.address
  );
  await bankContract.whiteListedToken(
    ethers.utils.formatBytes32String('ETH'),
    '0x09B5DC75789389d1627879bA194874F459364859'
  );

  console.log(`Bank Contract Address => ${deployBankContract.address}`)
  console.log(`Polygon Contract Address => ${depolyPolygonContract.address}`)
  console.log(`Shiba Contract Address => ${deployShibaContract.address}`)
  console.log(`Tether Contract Address => ${deployTetherContract.address}`)
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
