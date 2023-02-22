// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
import "@openzeppelin/contracts/access/Ownable.sol";

contract Wallet is Ownable {
     event LogWhitdraw(address from, address to);

    receive() external payable {}

    function withdrawAll() external onlyOwner{
        payable(owner()).transfer(address(this).balance);
    }
    
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function withdraw(uint256 _amount) external onlyOwner{
        require(address(this).balance >= _amount,"INSUFICIENTES FONDOS");
        payable(owner()).transfer(_amount);
    }

    function withdrawToWallet(address _wallet, uint256 _amount) external onlyOwner{
        require(address(this).balance >= _amount,"INSUFICIENTES FONDOS");
        payable(_wallet).transfer(_amount);
        emit LogWhitdraw(address(this), _wallet);
    }

   
}
