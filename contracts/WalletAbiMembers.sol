pragma solidity ^0.4.23;

import "./parity/WalletAbi.sol";


contract WalletAbiMembers is WalletAbi {
    uint public m_required = 1;
    uint public m_numOwners = 1;
    uint public m_dailyLimit = 0;
    uint public m_spentToday = 0;

    function m_lastDay() public view returns (uint) {
        return block.timestamp;
    }
}
