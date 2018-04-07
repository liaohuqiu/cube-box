const Web3 = require('web3');
const Tx = require('ethereumjs-tx');
const web3 = new Web3(new Web3.providers.HttpProvider('https://ropsten.infura.io/b3F1ygEkCnYDKQqlXBw5'));

const targetAddress = '0xD48a0Ff0C1555cE2E85A0f456AB461E17516d4E6';
const providerList = [
    {
        address: '0xxxxx',
        key: new Buffer('xxxxx', 'hex'),
    }
];

function transfer(privateKey, fromAddress, toAddress) {
    return new Promise((resolve) => {
        const gasPrice = web3.toWei(40, 'gwei');
        const keep = web3.toWei(0.01, 'ether');
        const gasLimit = 21000;
        web3.eth.getTransactionCount(fromAddress, (error, nonce) => {
            const nonceHex = web3.toHex(nonce);
            web3.eth.getBalance(fromAddress, (error, balance) => {
                balance = balance.toNumber();
                const value = balance - gasPrice * gasLimit - keep;
                console.log('nonce %s, %s => %s, balance: %s, value: %s', nonce, fromAddress, toAddress, balance, value, web3.fromWei(value, 'ether'));
                if (value < 0) {
                    resolve();
                    return
                }
                var transaction = {
                    nonce: nonceHex,
                    from: fromAddress,
                    to: toAddress,
                    gasLimit: web3.toHex(gasLimit),
                    gasPrice: web3.toHex(gasPrice),
                    value: web3.toHex(value),
                };
                var tx = new Tx(transaction);
                tx.sign(privateKey);
                var stx = tx.serialize();
                web3.eth.sendRawTransaction('0x' + stx.toString('hex'), (err, hash) => {
                    resolve();
                    if (err) {
                        console.log(err);
                        return;
                    }
                    console.log('transaction tx: ' + hash);
                });
            });
        });
    });
}

const addressList = []
for (var i = 0; i < providerList.length; i++) {
    var item = providerList[i];
    addressList.push(item['address']);
}

function chunkify(a, n, balanced) {

    if (n < 2)
        return [a];

    var len = a.length,
        out = [],
        i = 0,
        size;

    if (len % n === 0) {
        size = Math.floor(len / n);
        while (i < len) {
            out.push(a.slice(i, i += size));
        }
    }

    else if (balanced) {
        while (i < len) {
            size = Math.ceil((len - i) / n--);
            out.push(a.slice(i, i += size));
        }
    }

    else {

        n--;
        size = Math.floor(len / n);
        if (len % size === 0)
            size--;
        while (i < size * n) {
            out.push(a.slice(i, i += size));
        }
        out.push(a.slice(size * n));

    }
    return out;
}

// faucet 对单个 IP 有并发访问控制，分割帐号地址，给 request-eth.py 用，在多个服务器上运行。
// faucet.metamask.io 是目前最好用的领取测试币的网站，请不用滥用。
console.log(chunkify(addressList, 3, true));

for (var i = 0; i < providerList.length; i++) {
    var item = providerList[i];
    transfer(item['key'], item['address'], targetAddress);
}
