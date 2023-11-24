// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EnergyReusableCertificate is ERC20, Ownable {
    struct Apartment {
        uint256 id;
        uint256 apartmentNumber;
        string owner;
        address ownerAddress;
        uint256 tokens;
    }

    uint256 public nextApartmentId;
    mapping(uint256 => Apartment) public apartments;

    event ApartmentCreated(uint256 id, uint256 apartmentNumber, string owner, address ownerAddress, uint256 tokens);
    event ApartmentUpdated(uint256 id, uint256 newApartmentNumber, string newOwner, address newOwnerAddress, uint256 newTokens);
    event ApartmentDeleted(uint256 id);

    constructor() ERC20("EnergyReusableCertificate", "ERC") Ownable(msg.sender) {
        _mint(msg.sender, 10000 * 10 ** decimals());
        nextApartmentId = 1;
        createInitialApartments();
    }

    function createInitialApartments() internal {
        address[] memory owners = new address[](4);
        uint256 timestamp = block.timestamp;
        bytes32 prevrandao = bytes32(block.prevrandao);
        uint256 zeroliteralValue = 0;
        uint256 oneliteralValue = 1;
        uint256 twoliteralValue = 2;
        uint256 threeliteralValue = 3;
        
        owners[0] = address(uint160(uint256(keccak256(abi.encodePacked(timestamp, prevrandao, zeroliteralValue)))));
        owners[1] = address(uint160(uint256(keccak256(abi.encodePacked(timestamp, prevrandao, oneliteralValue)))));
        owners[2] = address(uint160(uint256(keccak256(abi.encodePacked(timestamp, prevrandao, twoliteralValue))))); 
        owners[3] = address(uint160(uint256(keccak256(abi.encodePacked(timestamp, prevrandao, threeliteralValue)))));
        


        string[4] memory ownerNames = ["Harsha", "Divyam", "Rakesh", "Charan"];

        for (uint256 i = 0; i < 4; i++) {
            uint256 randomApartmentNumber = i + 1; // Assigning apartment numbers from 1 to 10

            apartments[nextApartmentId] = Apartment(nextApartmentId, randomApartmentNumber, ownerNames[i], owners[i], 1000 * 10 ** decimals()); // Assigning 1000 tokens to each apartment
            _transfer(msg.sender, owners[i], 1000 * 10 ** decimals()); // Minting tokens to apartment owner
            emit ApartmentCreated(nextApartmentId, randomApartmentNumber, ownerNames[i], owners[i], 1000 * 10 ** decimals());
            nextApartmentId++;
        }
    }

    function transferTokens(address _to, uint256 _amount) external {
        require(_to != address(0), "Invalid recipient address");
        require(_amount > 0, "Transfer amount must be greater than zero");
        require(balanceOf(msg.sender) >= _amount, "Insufficient balance");

        _transfer(msg.sender, _to, _amount);
    }


}
