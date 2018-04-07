pragma solidity ^0.4.17;

contract GamerVerifier {
    mapping(address => uint256) public gamers;
    address owner;

    function GamerVerifier() {
        owner = msg.sender;
    }

    function addGamer(address addr, uint magic) {
        // SOME SECRET CODE;
        gamers[addr] = 1;
    }

    function isValidGamer(address gamer) view returns (bool) {
        return (gamers[gamer] == 1);
    }
}
