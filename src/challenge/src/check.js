const Web3 = require('web3');
const TimeDelayedVaultABIArray = require('./contracts/TimeDelayedVault');
const web3 = new Web3(new Web3.providers.HttpProvider('https://ropsten.infura.io/b3F1ygEkCnYDKQqlXBw5'));

const controlledList = [
    // self
    '0x748dcb21f539a24ce7878b7a91ec869a49cdb6b0',
    '0xaf22fec30ba00ca2a8d58b85fa2e6aed2c9a61d1',
    '0x08a21eb92826116cc205fbbf9de1aa2018ca6ae4',
    // '0x863a452ade62ac1dbd13658652eb696aaca07739',
    // leave it alone
    '0xe3d855a8114498015ac7ec1b30c2e31b571e9216',
    // '0x32777e5203ec83eb1a6f85d750d271a3303a76f5',
    // '0x63dd3c30531c2ab22467b9824b15842dbb60c460',
    // '0x9A3B964Ab3803bE94B6703BDfaCC48BbD6e3c111',
    '0xcACefbf65c5fFFFB96B94880330a6dA17198e814',
    // '0x1284f5A4aC6CeB99C23679Cb2F757EFBd2D960AC',
    '0x5e546870fe47886866fb562F9b293dAFFBcF2cda',
    // '0xF78b1827AF62B1FA9Bf1D4B4aAa622a2a2F128cd',
    // '0xea3b65af1d0808a64c468cb2558107ee31fccb84',
    '0x3756913901aef801e79a758bc900eb10bdb87e69',

    '0xdf6fb5d44b2504c35a4736556418a985076b0618',
    '0x0719eb9A32675eCF92bB87180A0D60feCcd1A060',
];

function checkAccount(contractAddress) {
    const currentTime = parseInt(new Date().getTime() / 1000);
    const contractAbi = web3.eth.contract(TimeDelayedVaultABIArray); //contest
    const contestContract = contractAbi.at(contractAddress);//contest
    const unlockTime = contestContract.lastUpdated().toNumber() + 3600 * 16;
    const balance = web3.fromWei(web3.eth.getBalance(contractAddress).toNumber(), 'ether');
    const elapsedTime = currentTime - unlockTime;
    console.log('address: %s, elapsed time: %s, balance', contractAddress, elapsedTime, balance);
}

for (var i = 0; i < controlledList.length; i++) {
    checkAccount(controlledList[i]);
}

