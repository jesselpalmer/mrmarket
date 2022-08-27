pragma solidity >=0.5.0 <0.6.0;

contract MrMarketFactory {

  event NewMrMarket(uint id, string name, uint dna);

  uint mrMarketDigits = 100;
  uint mrMarketModulus = 10 ** mrMarketDigits;

  struct MrMarket {
    string name;
    uint dna;
  }

  MrMarket[] public mrMarkets;

  function _createMrMarket(string memory _name, uint _dna) private {
    unit id = mrMarkets.push(MrMarket(_name, _dna)) - 1;
    emit NewMrMarket(id, name, dna);     
  }

  function _generateRandomDna(string memory _str) private view returns (uint) {
    uint rand = uint(keccak256(abi.encodePacked(_str)));
    return rand % dnaModulus;
  }

  function createRandomMrMarket(string memory _name) public {
    uint randDna = _generateRandomDna(_name);
    _createZombie(_name, randDna);
  }
}
