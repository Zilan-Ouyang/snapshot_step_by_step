const TestingToken = artifacts.require('ERC20Token');

module.exports = async function (deployer) {
    await deployer.deploy(TestingToken, 'SnapshotTestToken', 'STT', '10000000000000000000000');
};