// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.6;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// contract to list all different types of ERC20 tokens and respective slabs


contract TokenDeposit{
    uint count = 0;
    //mapping to store all the tokens and their count deposited to this contract
    mapping (address => uint256) public allTokens;

    //mapping to store all tokens and their respective slabs deposited to this contract
    mapping (address => string) public slabs;

//PublicdepositERC20 function to deposit diffrent ERC 20 tokens to the contract 
    function publicDepositERC20 (address tokenAdd, uint _numberOfToken) external
 {

        bool flag = false;

        if(allTokens[tokenAdd] == 0)
        {
            count++;
            flag = true;
        }
        uint _minimumToken = 1*(10**18);
        require(_numberOfToken > _minimumToken);
        IERC20(tokenAdd).transferFrom(msg.sender,address(this),_numberOfToken);
        allTokens[tokenAdd] += _numberOfToken;

        if(flag)
       {
           if(count <= 100){
               slabs[tokenAdd]="slab0";
           }else if(count > 100 && count <= 300){
               slabs[tokenAdd]="slab1";
           }else if(count > 300 && count <= 600){
               slabs[tokenAdd]="slab2";
           }else if(count > 600 && count <= 1000){
               slabs[tokenAdd]="slab3";
           }else if(count > 1000 && count <= 1500){
               slabs[tokenAdd]="slab4";
           }

       }

  }
//enquiry function will let us know given ERC 20 token's slab
  function enquiry(address tokenAdd) external view returns(string memory){
      return slabs[tokenAdd];
  }
}
