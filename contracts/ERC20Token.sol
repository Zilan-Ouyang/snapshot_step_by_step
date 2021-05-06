pragma solidity ^0.8.0;
//import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
//import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract ERC20Token is ERC20 {
    constructor (string memory name, string memory symbol, uint256 totalSupply) public ERC20(name, symbol)
    {
        _mint(msg.sender, totalSupply);
    }
}