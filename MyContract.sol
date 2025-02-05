// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LandRegistry {
    struct Land {
        uint256 id;
        string location;
        uint256 area;
        address owner;
        bool isRegistered;
    }

    mapping(uint256 => Land) public lands;
    uint256 public landCount;

    event LandRegistered(uint256 id, string location, uint256 area, address owner);
    event OwnershipTransferred(uint256 id, address previousOwner, address newOwner);

    // Register a new land parcel
    function registerLand(uint256 _id, string memory _location, uint256 _area) public {
        require(!lands[_id].isRegistered, "Land is already registered.");
        lands[_id] = Land(_id, _location, _area, msg.sender, true);
        landCount++;
        emit LandRegistered(_id, _location, _area, msg.sender);
    }

    // Transfer ownership of a land parcel
    function transferOwnership(uint256 _id, address _newOwner) public {
        require(lands[_id].isRegistered, "Land is not registered.");
        require(lands[_id].owner == msg.sender, "Only the owner can transfer land.");
        lands[_id].owner = _newOwner;
        emit OwnershipTransferred(_id, msg.sender, _newOwner);
    }

    // Get land details
    function getLandDetails(uint256 _id) public view returns (uint256, string memory, uint256, address) {
        require(lands[_id].isRegistered, "Land is not registered.");
        Land memory land = lands[_id];
        return (land.id, land.location, land.area, land.owner);
    }
}