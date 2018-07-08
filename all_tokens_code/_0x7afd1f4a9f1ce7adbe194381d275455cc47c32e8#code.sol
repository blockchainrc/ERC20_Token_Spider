//token_name	
//token_url	https://etherscan.io//address/0x7afd1f4a9f1ce7adbe194381d275455cc47c32e8#code
//spider_time	2018/07/08 12:53:08
//token_Transactions	1 txn
//token_price	

// compiler: 0.4.19+commit.c4cbbb05.Emscripten.clang
pragma solidity ^0.4.19;

contract owned {
  address public owner;
  function owned() public { owner = msg.sender; }
  function changeOwner( address newowner ) public onlyOwner {owner = newowner;}
  function closedown() public onlyOwner { selfdestruct(owner); }
  modifier onlyOwner {
    if (msg.sender != owner) { revert(); }
    _;
  }
}

//
// mutable record of holdings issued otherwise
//
contract PREICO is owned {

  event Holder( address holder );

  uint public totalSupply_;
  address[] holders_;
  mapping( address => uint ) public balances_;

  function PREICO() public {
    totalSupply_ = uint(0);
  }

  function() public payable { revert(); }

  function count() public constant returns (uint) {
    return holders_.length;
  }

  function holderAt( uint ix ) public constant returns (address) {
    return holders_[ix]; // throws
  }

  function add( address holder, uint amount ) onlyOwner public
  {
    require( holder != address(0) );
    require( balances_[holder] + amount > balances_[holder] ); // overflow

    balances_[holder] += amount;
    totalSupply_ += amount;

    if (!isHolder(holder))
    {
      holders_.push( holder );
      Holder( holder );
    }
  }

  function sub( address holder, uint amount ) onlyOwner public
  {
    require( holder != address(0) && balances_[holder] >= amount );

    balances_[holder] -= amount;
    totalSupply_ -= amount;
  }

  function isHolder( address who ) internal constant returns (bool)
  {
    for( uint ii = 0; ii < holders_.length; ii++ )
      if (holders_[ii] == who) return true;

    return false;
  }

}