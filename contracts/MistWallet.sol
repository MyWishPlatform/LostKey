pragma solidity ^0.4.23;

import "sc-library/contracts/SoftDestruct.sol";


contract MistWallet is SoftDestruct {
    uint public m_required = 1;
    uint public m_numOwners = 1;
    address[1] private owners;

    constructor(address _owner) public SoftDestruct(_owner) {
        owners[0] = _owner;
    }

    function isOwner(address _address) public view returns (bool) {
        return targetUser == _address;
    }
}
