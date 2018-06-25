pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";


contract ERC20Wallet {
    function tokenBalanceOf(address _token) public view returns (uint) {
        return ERC20(_token).balanceOf(this);
    }

    function tokenTransfer(address _token, address _to, uint _value) public returns (bool) {
        return ERC20(_token).transfer(_to, _value);
    }

    function tokenTransferFrom(address _token, address _from, address _to, uint _value) public returns (bool) {
        return ERC20(_token).transferFrom(_from, _to, _value);
    }

    function tokenApprove(address _token, address _spender, uint256 _value) public returns (bool) {
        return ERC20(_token).approve(_spender, _value);
    }

    function tokenAllowance(address _token, address _owner, address _spender) public view returns (uint) {
        return ERC20(_token).allowance(_owner, _spender);
    }
}
