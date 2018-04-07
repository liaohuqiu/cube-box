pragma solidity ^0.4.17;

contract GamerVerifier {
    mapping(address => uint256) public gamers;
    address owner;

    function GamerVerifier() {
        owner = msg.sender;
        gamers[0xf27DBE0D0189B570f105b99D9DEf8bE53C580f5c] = 1;
        gamers[0xA3900Fce920E75D9C57959bcDb59De2005fd2BC4] = 1;
        gamers[0xd65d065744FA6838820A6b6aAc00B4A56b76b914] = 1;
        gamers[0x5cE6eCfBe5cf371Ccf5e7fE6C3Cc39266e68dB29] = 1;
        gamers[0x0413A70b8e8Bf21bF053478E21dd0De8AeA6826F] = 1;
        gamers[0x1C84fe9925A1Cc55822c60d08b3633Cadadc70D7] = 1;
        gamers[0xDF6f145A0fe31605fA6Ab17f7921DDc3d6a8F50F] = 1;
        gamers[0x73CF713553A7E518f8eEceDDc738B7138d49A5B9] = 1;
        gamers[0x75ECE74c54b16dEE5f511d103e5ed964414fc08f] = 1;
        gamers[0x36E1De4e5D12335A40899D7789C3DCa25e9753Ea] = 1;
        gamers[0xE5C5f93b952bA3905f22CAB1137bBa87d3F7FBCc] = 1;
        gamers[0x0b5503554F5E7965679C11BB7f983bb8ED2Ae753] = 1;
        gamers[0x549BE821f57e85044D14e6cf25D89575f4b504Da] = 1;
        gamers[0xe2BF26C28BFbCB67C9736028cC6d8Bdc279e7B89] = 1;
        gamers[0xF299C6Bc3B7F77791dD08AAF3E1A21fb2E78aa11] = 1;
        gamers[0xA4B72f980Dd028126d7efCff41362DD7cE404213] = 1;
        gamers[0xCc2e0F04B8a0b1D7bC856f635cd09418e96fcdDf] = 1;
        gamers[0x7C79c21A6e24cd510fc6cc0D732cA8626395FA56] = 1;
        gamers[0xd48a0ff0c1555ce2e85a0f456ab461e17516d4e6] = 1;
        gamers[0x21C5Cf3F23b3ebAA975F97e415A9dce5912c6B6b] = 1;
        gamers[0xF6c396761b3282c237264dd2396b55A206537E2D] = 1;
        gamers[0x778501523DAF6E1a82E9563A3d16B20D0C880317] = 1;
        gamers[0x0581F0939F47ac9131CB5b2f4417b9Fc78e1efE1] = 1;
        gamers[0xf330Efa0b1427cbE9C06f2074EF910686020Af00] = 1;
        gamers[0x7066A79dC57268E5aC7606f33892DA59842dEef2] = 1;
        gamers[0xa4B92f7ad9e1014f11a945FDfc6083ec3851c683] = 1;
        gamers[0x0F6bc4ec38f2cf498e1De46FedD4f83C7e5052d8] = 1;
        gamers[0x3a8EEb07953e9d712e133AF73D19F72664c68a9f] = 1;
        gamers[0xBdAE5f6b55340871E46aCfD3cd60F5440ce692e9] = 1;
        gamers[0x59cDE28A615c45588A5ef80B23Dc138cEA53f8cA] = 1;
        gamers[0xb5129934b99e1c0cd98F5F9e3ed23c70b45B5197] = 1;
        gamers[0xAcb798BCA20Dff3Eb7d00042986a6d1dBB7Ac1F9] = 1;
        gamers[0xF964bD35808F23330197de58c41C6d9E9B5d9988] = 1;
        gamers[0xFDb51473Ca689D3049953A70fe9BC9839c56Df58] = 1;
        gamers[0x14583D485A66CbD2DF24828a1aAaA66eD601D320] = 1;
        gamers[0xB531CF5dd08db63c79c04F64BdE87D2204DC2cf7] = 1;
        gamers[0x6Cde2e343691d978C55127ce65A27005403D4a33] = 1;
        gamers[0x1a22c281f7D847e1203b4868b67d457c79ae09B2] = 1;
        gamers[0x05f304d5ad5b05830b7b6ae6b720b149078c9613] = 1;
        gamers[0x258bF2836c554AD2A8C07bBdcba8eda6f0B6c87c] = 1;
        gamers[0x01Fa66084c0B932c13a2b1960E164271DEc1ef82] = 1;
        gamers[0xE15C943c54D03344963a9CB4Be6857B13804e662] = 1;
        gamers[0xf1B3Ff6dc1DA7A6E4b41DeA52dABBB3368134e4D] = 1;
        gamers[0x9A12E84FD7D1433bAbbeC1671b9a9311151747A9] = 1;
        gamers[0x0384eed9E79Da49C7c2af55773c32F34945871E9] = 1;
        gamers[0xdC75EB0973F96b735087B6B2f20ef73595509354] = 1;
        gamers[0xd6e2D22Da032f81f68d92d701b13770cE01b5a01] = 1;
        gamers[0x0d0fF5D76143d10C0a36Ce58Ac85c790417ed2aB] = 1;
        gamers[0x3573AB0Aa5a23de49aeA35E824ac843538EB93Ef] = 1;
        gamers[0x78A7404eF88124d6E8AD747158b23Dff6C64a9eD] = 1;
        gamers[0x0a2a719654c1dB8Dd024DD9D800F8a50Fd2e5B41] = 1;
        gamers[0x5647E444cA44614d5Bc9477CbB967cb84A962d41] = 1;
        gamers[0xbda6813e3e62dadba70d6b45c0c789e870326282] = 1;
        gamers[0x1Adc5F0E9B9EFf80f4EC32acba227AF2BBa4A960] = 1;
        gamers[0x8e864D3c72eCD9AA9A18f75f007568c3589D7Cdd] = 1;
        gamers[0x0a84F5700251d035e6b02fF150530dd98e1cC6ce] = 1;
        gamers[0x37e4ee08aA97F719af01a3084B2914e5ABF65d25] = 1;
        gamers[0xc7851869d7bf8c801a551fd9c0dae918f7500844] = 1;
        gamers[0x77365f9CDd6cdc6aACB399E049625d9183e8A90B] = 1;
        gamers[0x3399A1474E67f0baEcB288874a044CCfBA1f407B] = 1;
        gamers[0xb2BD2e988203F63e22c4265c28e5f4abDa1f7b96] = 1;
        gamers[0x8b68494cCD6Bc2790Dd21809D9Df49C575B0A5F9] = 1;
        gamers[0xD31f6dF7672531c30f1671fe1075893A95C5f5a0] = 1;
        gamers[0x72e4C8D16791AC89B907076e97F1BE5C0772A3da] = 1;
        gamers[0x723379B1CEab2C9B71D33EC8a5ceFf8f81565Da8] = 1;
        gamers[0x0Adf05c65ebb069Dc6286227A1d0B3D32D30CeFF] = 1;
        gamers[0x3B3FdF294A83049A7E8B35caCE4b42c977513650] = 1;
        gamers[0x4f19c983066c24ddbf6e2482f46cb13748136c7a] = 1;
        gamers[0x2Cb0beF8426b5a69a94aE35a5D51f66A08Ddb5eA] = 1;
        gamers[0xEF2AF06B62B18A703E1468e1D2357B8Cc9AAB81a] = 1;
        gamers[0xb21b96A6a4A4C0f1d12815bBE7FA28Bdd0514368] = 1;
        gamers[0xa24f2b8c429B7B89CFdEfefB2e37172396Fe4d62] = 1;
        gamers[0xd1698dd6C5048BC05861C6982D28A7919C97E7b7] = 1;
        gamers[0xd8c911795dd86fB79A9077ccF3aaE526f01B8c63] = 1;
        gamers[0xB02809CC84bB16A7654c72a30089c5eC0809Aa32] = 1;
        gamers[0x79F102879Ee8d4F566Ac65e806bA5A22Dea4ddAF] = 1;
        gamers[0x24811258f15eBacA8d5C82Ac6d788FDE900e45E7] = 1;
        gamers[0xc1F064Cbb8001da72F8E823D8865f6ec8BAd6e3A] = 1;
        gamers[0x46A545FD19E99a35582d7052D222A9165c81132C] = 1;
        gamers[0xffB37241Eba6f9399fD40942FAB8C6c015588D56] = 1;
        gamers[0x266Ba5BF144f0d6AB534484C54027Dab741323F5] = 1;
        gamers[0x0Af7886C5A72063306a6056d36335C1dB0f3a897] = 1;
        gamers[0xb0c14147EABa57352aD93F763a6aE8D0A968B599] = 1;
        gamers[0xbdd77c21bCB314D996B1E510f845Fd4B685c88f3] = 1;
        gamers[0xf0f58301c05Fa65eE781CF0eB41662F96B616c16] = 1;
        gamers[0xdC674193D4f58eB9Ddf91925e7B5D623217c0aF5] = 1;
        gamers[0xf8898e5fFB4ab83DF3529AEd042554D7A26573a0] = 1;
    }



    function addGamer(address addr, uint magic) {
        SOME SECRET CODE;
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
    address [] public observerHistory;
    GamerVerifier public g = GamerVerifier(SOMEADDRESS);
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
        if(now >= lastUpdated + 16 hours) {
            selfdestruct(owner);
        }
    }

    modifier recordAction() {
        lastUpdated = now;
        _;
    }
}

contract oobserver {
    function observe() {

    }
}

contract TimeDelayedVault {
    uint  public nextWithdrawTime;
    uint  public withdrawCoolDownTime;
    address[] public authorizedUsers;
    address public withdrawObserver;
    address public additionalAuthorizedContract;
    address public proposedAAA;
    uint public lastUpdated;
    bool[] public votes;
    address [] public observerHistory;
    GamerVerifier public g = GamerVerifier(SOMEADDRESS);
    address owner;
    address walletLibrary;


    function TimeDelayedVault(address libAddress) recordAction {
        nextWithdrawTime = now;
        withdrawCoolDownTime = 30 minutes;
        walletLibrary = libAddress;
        address(this).call(bytes4(sha3("initializeVault()")));
        // Please note, the following code chunk is different for each group, all group members are added to authorizedUsers array
        authorizedUsers.push(xxxxxxxxxx);

        for(uint i=0; i<authorizedUsers.length; i++) {
            votes.push(false);
        }
    }

    modifier onlyAuthorized() {
        bool pass = false;
        if(additionalAuthorizedContract == msg.sender) {
            pass = true;
        }

        for (uint i = 0; i < authorizedUsers.length; i++) {
            if(authorizedUsers [i] == msg.sender) {
                pass = true;
                break;
            }
        }
        require (pass);
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


    function withdrawFund() onlyAuthorized external returns (bool) {
        require(now > nextWithdrawTime);
        assert(withdrawObserver.call(bytes4(sha3("observe()"))));
        walletLibrary.delegatecall(bytes4(sha3("basicWithdraw()")));
        nextWithdrawTime = nextWithdrawTime + withdrawCoolDownTime;
        return true;
    }

    function checkAllVote() private returns (bool) {
        for(uint i = 0; i < votes.length; i++) {
            if(!votes[i]) {
                return false;
            }
        }

        return true;
    }

    function clearVote() private {
        for(uint i = 0; i < votes.length; i++) {
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

    function resolve() onlyOwner {
        walletLibrary.delegatecall(bytes4(sha3("resolve()")));
    }

    function initilizeVault() onlyOnce {
        lastUpdated = now;
        owner = msg.sender;
    }
}