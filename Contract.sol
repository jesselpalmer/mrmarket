pragma solidity >=0.5.0 <0.6.0;

contract MrMarketFactory {

  uint mrMarketDigits = 100;
  uint mrMarketModulus = 10 ** mrMarketDigits;

  struct MrMarket {
    string name;
    uint id;
  }

  MrMarket[] public mrMarkets;

  function _createMrMarket(string memory _name, uint _id) private {
    mrMarkets.push(MrMarket(_name, _id));        
  }

  function _generateRandomId(string memory _str) private view returns (uint) {
    uint rand = uint(keccak256(abi.encodePacked(_str)));
    return rand % dnaModulus;
  }

  function createRandomMrMarket(string memory _name) public {
        uint randId = _generateRandomId(_name);
        _createZombie(_name, randId);
    }
}
