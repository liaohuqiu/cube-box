pragma solidity ^0.4.17;

import './GamerVerifier.sol';

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

    function initializeVault() onlyOnce {
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
