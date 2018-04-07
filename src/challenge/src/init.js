const Web3 = require('web3');
const Tx = require('ethereumjs-tx');
const TimeDelayedVaultABIArray = require('./contracts/TimeDelayedVault');
const web3 = new Web3(new Web3.providers.HttpProvider('https://ropsten.infura.io/b3F1ygEkCnYDKQqlXBw5'));

const leoWalletAddr = "0xd48a0ff0c1555ce2e85a0f456ab461e17516d4e6";
const privateKey = new Buffer('xxx', 'hex');

function initilizeVault(nonce, contestAddr) {
    const contractAbi = web3.eth.contract(TimeDelayedVaultABIArray); //contest
    const contestContract = contractAbi.at(contestAddr);//contest
    const data = contestContract.initilizeVault.getData();
    const gasPriceHex = web3.toHex(40000000000); //20gwei
    const gasLimitHex = web3.toHex(1000000); //1m
    const nonceHex = web3.toHex(nonce);
    console.log(nonce, nonceHex, contestAddr);

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
const list = [
    '0x0719eb9a32675ecf92bb87180a0d60feccd1a060',
];
for (var i = 0; i < list.length; i++) {
    initilizeVault(nonce + i, list[i]);
}
