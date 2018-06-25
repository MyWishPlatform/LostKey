pragma solidity ^0.4.23;

import "./parity/WalletAbi.sol";
import "./LostKeyWallet.sol";


contract LostKeyParityWallet is WalletAbi, LostKeyWallet {
    constructor(address _targetUser, address[] _recipients, uint[] _percents, uint64 _noActivityPeriod) public
        LostKeyWallet(_targetUser, _recipients, _percents, _noActivityPeriod) {}

    // Revokes a prior confirmation of the given operation
    function revoke(bytes32) external onlyTarget {}

    // Replaces an owner `_from` with another `_to`.
    function changeOwner(address _from, address _to) external onlyTarget {
        require(_from == targetUser);
        targetUser = _to;
    }

    function addOwner(address) external onlyTarget {
        revert();
    }

    function removeOwner(address) external onlyTarget {
        revert();
    }

    function changeRequirement(uint) external onlyTarget {
        revert();
    }

    // (re)sets the daily limit. needs many of the owners to confirm. doesn't alter the amount already spent today.
    function setDailyLimit(uint) external onlyTarget {
        revert();
    }

    function execute(address _to, uint _value, bytes _data) external onlyTarget returns (bytes32) {
        sendFundsInternal(_value, _to, _data);
        return keccak256(msg.data, block.number);
    }

    function hasConfirmed(bytes32, address) external view returns (bool) {
        return true;
    }

    function isOwner(address _addr) public view returns (bool) {
        return _addr == targetUser;
    }

    // the number of owners that must confirm the same operation before it is run.
    function m_required() public pure returns (uint) {
        return 1;
    }

    // pointer used to find a free slot in m_owners
    function m_numOwners() public pure returns (uint) {
        return 1;
    }

    function m_dailyLimit() public pure returns (uint) {
        return 0;
    }

    function m_spentToday() public pure returns (uint) {
        return 0;
    }

    function m_lastDay() public view returns (uint) {
        return block.timestamp;
    }

    // Gets an owner by 0-indexed position (using numOwners as the count)
    function getOwner(uint ownerIndex) public view returns (address) {
        if (ownerIndex > 0) {
            return 0;
        }
        return targetUser;
    }

    function confirm(bytes32) public onlyTarget returns (bool) {
        return true;
    }
}
