// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.9 <0.9.0;

contract MrMarketFactory {

  event NewMrMarket(uint id, string name, uint dna);

  uint mrMarketDigits = 100;
  uint dnaModulus = 10 ** mrMarketDigits;

  struct MrMarket {
    string name;
    uint dna;
  }

  MrMarket[] public mrMarkets;

  function _createMrMarket(string memory _name, uint _dna) private {
    mrMarkets.push(MrMarket(_name, _dna));
    uint id = mrMarkets.length - 1;
    emit NewMrMarket(id, _name, _dna);     
  }

  function _generateRandomDna(string memory _str) private view returns (uint) {
    uint rand = uint(keccak256(abi.encodePacked(_str)));
    return rand % dnaModulus;
  }

  function createRandomMrMarket(string memory _name) public {
    uint randDna = _generateRandomDna(_name);
    _createMrMarket(_name, randDna);
  }
}
