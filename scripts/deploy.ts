
import { ethers } from "hardhat";
import 'dotenv/config'

async function main() {

  

  const account = await ethers.deployContract('UniversalProfile', [
    process.env.ADDR
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
