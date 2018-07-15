module.exports = {
  migrations_directory: "./migrations",
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    }
  }
};

//合约部署时会按照这里的配置项进行部署，
//这里的配置项指定了部署到哪一个网络（test-rpc还是reposten）
//部署哪些东西呢？
//部署时truffle会去./migrations文件夹按照里面填写的内容部署，里面会表示出该工程下哪些合约需要部署到指定网络
//上面的配置项指定了部署到本地的test-rpc网络
//下面的配置项指定了部署到以太网的reposten网络
//两者二选一即可
//参考https://juejin.im/post/5adedbad6fb9a07acb3c81bb

var HDWalletProvider = require("truffle-hdwallet-provider");
// 账户的助记词，强烈建议将助记符存储在另一个（秘密）文件中，以降低助记符泄漏风险
var mnemonic = "window build ski shy auto film eager dentist size crawl eight shuffle";
module.exports = { 
  migrations_directory: "./migrations",
  networks: { 
    ropsten: { 
      provider: function() { 
        return new HDWalletProvider(mnemonic,
                // 后缀的api key是从infura提前申请的
                "https://ropsten.infura.io/vdG9ldOn4oQyG7Qb8Ri4") 
        }, 
      network_id: 3 
    }
  } 
};