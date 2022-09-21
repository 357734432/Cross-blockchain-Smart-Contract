// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.8.0;
import "./PointManage.sol";
import"./AddressManage.sol";

contract blockrecord{
    address owner;
    address addressmanage_add;
    mapping (uint => string) blocks ;
    mapping (uint => uint) block_tables;
    uint block_height;
    mapping (bytes32 => mapping(uint =>uint)) votes;
    mapping (bytes32 => uint) votes_amount;
    
   constructor() public{
        owner = msg.sender;
    }
    function set_addressmanageAdd(address add)public{
        require(msg.sender==owner);
        addressmanage_add=add;
    }
    function block_votes(uint point_number, string memory newblock, uint newblock_height) public{
        require(msg.sender==pointmanage(addressmanage(addressmanage_add).return_pointmanage_add()).point_search(point_number)&&newblock_height==block_height,"Error!");
        bytes32 newblock_hash = sha256(abi.encodePacked(bytes(newblock)));
        if(votes[newblock_hash][point_number]==0){
           votes[newblock_hash][point_number]=1;
           votes_amount[newblock_hash]++;
           if((votes_amount[newblock_hash]<<1)>=pointmanage(addressmanage(addressmanage_add).return_pointmanage_add()).amount()&&block_tables[block_height]==0){
                block_tables[block_height]=1;
                blocks[block_height]=newblock;
                block_height++;
            }
        }
    }
   
    function getblock(uint height)  public returns (string memory ){
        require(height>=0 && height<=block_height,"Error!");
        return string(blocks[height]);
    }
     function getnewblock()  public returns (string memory ){
        require(block_height>0,"Error!");
        return string(blocks[block_height-1]);
    }

}