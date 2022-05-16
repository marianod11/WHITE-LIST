
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract WhiteList {
    uint256 public maxWhitelistedAddresses;


    mapping(address => bool) public whitelistedAddresses;
    uint256 public numAddressesWhitelisted;

    address[] public totalAddressWhiteList; 

    constructor(uint256 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {

        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");

        whitelistedAddresses[msg.sender] = true;

        numAddressesWhitelisted += 1;

        totalAddressWhiteList.push(msg.sender);

    }


    function removeAddressToWhitelist() public {

        require(whitelistedAddresses[msg.sender], "no estaaaaaa"); 

        whitelistedAddresses[msg.sender] = false;

        numAddressesWhitelisted -= 1;
        
        for(uint256 i = 0; i < totalAddressWhiteList.length; i++ ){
            if(totalAddressWhiteList[i]== msg.sender){
                totalAddressWhiteList.pop();
            }


        }
    }


    function addressWhiteList() public view returns(address [] memory ){
        return totalAddressWhiteList;
    }
    


}
