// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.8.0;

contract addressmanage{
    address public deployer;
    address public caller;
    address public PointManage_add;
    address public BlockRecord_add;
    
    modifier onlyDeployer() {
        require(msg.sender == deployer, "Caller is not deployer");
        _;
    }
    constructor(){
        deployer = msg.sender; 
    }

    function set_pointmanage_add(address addr) public onlyDeployer{
        PointManage_add = addr;
    }
      function return_pointmanage_add() public  returns(address){
        return PointManage_add;
    }
    
       function set_blockrecord_add(address addr) public onlyDeployer{
        BlockRecord_add = addr;
    }
      function return_blockrecord_add() public  returns(address){
        return BlockRecord_add;
    }
}    