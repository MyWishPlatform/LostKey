pragma solidity ^0.4.23;

import "./LostKeyERC20Wallet.sol";
import "./Wallet.sol";


contract LostKeyWallet is LostKeyERC20Wallet, Wallet {
    constructor(address _targetUser, address[] _recipients, uint[] _percents, uint64 _noActivityPeriod) public
        Wallet(_targetUser)
        LostKeyERC20Wallet(_targetUser, _recipients, _percents, _noActivityPeriod) {
    }

    function execute(address _to, uint _value, bytes _data) external onlyTarget returns (bytes32) {
        sendFundsInternal(_value, _to, _data);
        return keccak256(msg.data, block.number);
    }
}
