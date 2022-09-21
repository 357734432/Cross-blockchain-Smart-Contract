// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.8.0;


contract pointmanage{
    address owner;
    address addressmanage_add;
    mapping (uint => address) points;
    uint points_amount;

    
   constructor() public{
        owner = msg.sender;
    }
     function set_addressmanageAdd(address add)public{
        require(msg.sender==owner);
        addressmanage_add=add;
    }
    function point_add(address points_address) public returns(uint){
        require(msg.sender==owner,"Error!");
        points[points_amount]=points_address;
        points_amount++;
        return points_amount-1;
    }
    function point_delete(uint points_number) public{
        require(msg.sender==owner && points_number>0,"Error!");
        delete points[points_number];
        points_amount--;
    } 
    function point_search (uint points_number) public returns(address){
        require(points_number>=0 && points_number<points_amount,"Error!");
        return points[points_number];
    }
      function amount () public returns(uint){
        return points_amount;
    }
}