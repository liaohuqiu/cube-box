const Web3 = require('web3');
const Tx = require('ethereumjs-tx');
const TimeDelayedVaultABIArray = require('./contracts/TimeDelayedVault');
const web3 = new Web3(new Web3.providers.HttpProvider('https://ropsten.infura.io/b3F1ygEkCnYDKQqlXBw5'));

const leoWalletAddr = "0xD48a0Ff0C1555cE2E85A0f456AB461E17516d4E6";
const privateKey = new Buffer('xxx', 'hex');

function resolve(nonce, contestAddr) {
    const nonceUsed = nonce;
    const contractAbi = web3.eth.contract(TimeDelayedVaultABIArray); //contest
    const contestContract = contractAbi.at(contestAddr);//contest
    const data = contestContract.resolve.getData();
    const gasPriceHex = web3.toHex(40000000000);
    const gasLimitHex = web3.toHex(1000000);
    const nonceHex = web3.toHex(nonceUsed);
    console.log('%s %s %s', nonce, nonceHex, contestAddr);
    var transaction = {
        nonce: nonceHex,
        gasPrice: gasPriceHex,
        gasLimit: gasLimitHex,
        to: contestAddr,
        from: leoWalletAddr,
        value: '0x00',
        data: data
    };

    var tx = new Tx(transaction);
    tx.sign(privateKey);

    var stx = tx.serialize();
    web3.eth.sendRawTransaction('0x' + stx.toString('hex'), (err, hash) => {
        if (err) {
            console.log(err);
            return;
        }
        console.log('transaction tx: ' + hash);
    });
}

var nonce = web3.eth.getTransactionCount(leoWalletAddr);
const killContractList = [
    '0xf78b1827af62b1fa9bf1d4b4aaa622a2a2f128cd',
];
for (var i = 0; i < killContractList.length; i++) {
    resolve(nonce, killContractList[i]);
}
