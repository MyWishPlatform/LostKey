const LostKeyParityWallet = artifacts.require('./LostKeyParityWallet.sol');

module.exports = function (deployer, _, accounts) {
    const TARGET = accounts[1];
    deployer.deploy(LostKeyParityWallet, TARGET, [TARGET], [100], 120);
};
