
import { ethers } from "hardhat";

async function main() {
  const account = await ethers.deployContract('UniversalProfile', [
    '0x5E479a3cc6AdC64ddf3129AEaE99A27A5Bfe4bed'
  ]);
  await account.waitForDeployment();
  const accountAddress = await account.getAddress();

  console.log(
    `deployed to ${accountAddress}`
  );


    
  let song = "{INSERT_YOUR_FAVOURITE_SONG_HERE}";


  const setData = await account.setData(ethers.encodeBytes32String('favourite_song'), ethers.toUtf8Bytes(song));
  await setData.wait();
  
  console.log("set favorite_song to; ", song, "in your UP");
  
  const getData = await account.getData(ethers.encodeBytes32String('favourite_song'));
  
  console.log('getData result a is: ', ethers.toUtf8String(getData), 'which is your favourite song');
  return
}


main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
