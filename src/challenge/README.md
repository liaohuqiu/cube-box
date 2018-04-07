### 白帽黑客挑战赛 赛制与规则说明

1. 阅读代码，尽可能的破解下面这个智能合约 TimeDelayedVault，本合约的本来目的是一个限制取钱数额和时间的多人共享钱包，每30min只能取钱0.001ETH。但遗憾的是，这段程序代码质量，特别差，而且特么的还没有注释。请阅读代码，寻找可能的程序漏洞。
2. 每组的微信群中，都发布了一个合约地址，这个合约地址中部署的合约的authorizedUsers变量在合约初始化的时候被初始化为了一个包含且仅包含队伍中所有同学ETH地址的数组。
3. 本次比赛一些函数必须要通过GameVerifier的验证才可以调用，gamer数组中存储的是所有本次参赛选手的ETH地址，GameVerifier中的isValidGamer 函数逻辑已经给出，但是addGamer的部分逻辑被隐去。
合约部署在Ropsten测试网络上。
4. 如果比赛过程中，希望老董将合约彻底重置，会导致 重生次数++，惩罚方式见下面计分公式。
5. 老董可能会在合约中同时注入新的ETH
6. 单组计分方式使用如下公式进行：
    队伍评分 = 通过破解所以得到的所有ETH *（1-第一次成功使用某种破解手段所消耗的时间/比赛总时间）／组内报名账户直接或间接（通过合约调用）在破解过程中消耗的所有ETH（gas和其他）*（0.5）^(重生次数)
7. 在阅读代码之后，请多次反复，认真，不停地阅读上述积分规则，认真阅读代码，不要激动，思考得到最高奖励的最佳策略。
8. 本比赛最大的原则，凡是规则不禁止的，都特么是提倡的！
9. 比赛截止时间：48小时


### 规则解说

1. 重生次数，首次破解时间很重要。

2. 成绩和报名账户的收入和成本相关。

3. 规则不限。

4. 48 小时，北京时间 2018 年 4 月 4 号 15:00 到 6 号 15:00。

### 代码解读

* 30 分钟限制：每 30 分钟才可取钱

* 16 小时限制：`selfdestruct()` 在 `lastUpdated` 16 小时才后可攻击，`addToReserve()` 可更新 `lastUpdated`。

  这使得很多操作在比赛期间只能操作 2 次。

* `GameVerifier` 控制权限，`addGamer()` 可添加新地址，需要知道第二个参数的取值规律。

* `TimeDelayedVault` 和 `CommonWalletLibrary`

    * `withdrawFund()` 非常容易构造 `reentry`，麻烦的是要团队配合投票。
    *  构造函数中 `initializeVault` 是个笔误，无法调用成功 `initilizeVault()`，部署完后，所有合约都是没有 owner 的。
    *  owner 可调用 `resolve()`，在 `lastUpdated` 后 16 个小时销毁合约，余额会转到 owner 对应的地址。

### 攻防分析

* 最简单的，`reentry` 除去 gas，收入不多。这个越早越好，简单易行，主要考验团队配合。

* `addGamer()` 可添加**非报名地址**，用于各种攻防操作，防追踪。同时可通过 `addToReserve()` 加钱，增加收益。

* 抢占 owner，然后等时间到，`resolve()` 收钱；但任何人都可调用 `addToReserve()` 阻止。

### 分工

我们是 3 期 C 组。参加的同学有: WYF，BJ，LJW，LYN，XCY，和我。BJ 因为要赶之前作业，过程没参与，LYN 同学是后半段参与的。

* WYF 是队长，不过赛期他东京回国，事情也多，没办法实时在线。他应该是组内比较了解智能合约的同学，大策略都是他出的主意。

* LJW 和 XCY 在线时间多，不过 XCY 同学好像是在美西。

* 我飞机晚点 4 号凌晨到北京，有几个应酬，还要陪女朋友不能整天待电脑前面，6 号早 6 点飞杭州，在线时间不也多。

### 本组攻防过程

##### 抢占 owner

4 号早上起来，写了一会工作代码，下午比赛开始之后，简单看了除 reentry 没想到其它办法（新手视野不广），琢磨一个多小时，组里没什么动静，去参加一个饭局。

4 号晚，WYF 在群里说检查合约的 `initilizeVault()` 调用了没，要抢，我喝酒喝得晕乎乎的，没理解。洗澡的时候，突然警醒。和 WYF 同学电话沟通了一下，检查[所有合约](https://ropsten.etherscan.io/address/0x5138da08c878ec23b82b85a86eca47230f96f62b) 发现有部分合约已经被抢占，`CommonWalletLibrary` 也被抢占。

迅速写了 [代码](https://github.com/liaohuqiu/cube-box/blob/master/src/challenge/src/init.js)，把能抢占的都抢占了，组内简单同步，然后睡觉去了。

早上醒来，WYF 同学说给 `CommonWalletLibrary` 续命了，花了 3 个 eth，这个钱要赚回来。上午要出门陪女朋友看电影，结束大概是抢占 owner 之后的 16 小时，写好了 [检查可 `resolve()` 合约的代码](https://github.com/liaohuqiu/cube-box/blob/master/src/challenge/src/check.js) 和 [调用 `resolve()` 的代码](https://github.com/liaohuqiu/cube-box/blob/master/src/challenge/src/kill.js)，然后出门了。

电影不错。

回来之后，留了一个合约没收割（后面发现还漏了一个），其它控制的合约全销毁了，收获大概 20 个 eth，发现大群里有一些动静。

这时候时间过去一半，时间系数 0.5。

监控发现又有组重生，迅速占领。

##### 攻占 GameVerifier

想要扩大战果，靠 `reentry` 和 `resolve()` 是不行的。要破解 `addGamer()` 大量加强，然后 `reentry`。当时我们 `reentry` 还没实现。晚上大家电话会议，确定分工如下：

* LJW 同学实现 `reentry`，并负责调度大家 `addAuthorizedAccount()`

* XCY 和我复杂攻占 `addGamer()`。

WYF 和我用 MEW 调用测试 magic num，发现 1 是不行的，但是看 input data 以及 porosity 反编译出来的都是 1，不解，决定看 opcode。

##### 扩大战果，快速致富

到了晚上 12 点左右，对着黄皮书看 opcode，眼睛都要瞎了，WYF 提出了一个疯狂的想法：

随便构造一个合约，用非报名帐号给这个合约充钱，然后销毁这个合约（跳板合约），把钱转给竞赛的合约（傀儡合约，其它组的和我们自组的），然后销毁傀儡合约。

立刻简单测试，可行。


```
contract Jumper {
    address vault;
    address owner;

    function Jumper() payable {
        owner = msg.sender;
    }

    function setVault(address v) {
        require(msg.sender == owner);
        vault = v;
    }

    function addFund() payable returns(uint) {
        return this.balance;
    }

    function kill() {
        require(msg.sender == owner);
        selfdestruct(vault);
    }
}
```

因为明早 4 点多要起来赶航班，大家同步完：

* XCY 在美西请假一天，继续破解 `addGamer()`
* 大家都屯币
* 我去睡觉，防止猝死

早上起来，车车同学（XCY）传来好消息：

1. addGamer 的 magic number 就是 1。
2. 他屯了 500  个币了。

不过这个时候我们更倾向于用跳板合约攻击了。在机场写了[快速刷币的脚本](https://github.com/liaohuqiu/cube-box/blob/master/src/challenge/src/request-eth.py)。其它同学都还没醒，没同步沟通。

落地杭州后，想法是要快速拿到很多 ETH，这样才能可能超越的潜在对手，在去办公室的路上，尝试写自动转钱脚本，但是没完成，人差点被彪悍的司机颠吐……

到了办公室 9 点多，大家电话同步，形成决议：

用跳板合约攻击，手头可用的傀儡合约是 5 个左右（实际 6 个），分批行动。第一笔钱到帐之后，看监控交易活跃的团队还有好几个，剩余合约可能被续命。

大家都去攒币，10 点半左右第一波 1000 个 ETH 入帐。我的[自动转账脚本](https://github.com/liaohuqiu/cube-box/blob/master/src/challenge/src/transfer-eth.js) 也完成了。

后面速度就快了，2000，3000，最后一波想到 10000，水龙头被撸挂了，监控发现，没有可用的合约了，收工，到帐 6000+ 个 eth：https://ropsten.etherscan.io/address/0xd48a0ff0c1555ce2e85a0f456ab461e17516d4e6


### 总结

* 聪明
* 努力
* 团队
* 运气

