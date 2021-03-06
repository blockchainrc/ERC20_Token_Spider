//token_name	
//token_url	https://etherscan.io//address/0x7f58a73fdc40a5be5a65b3462d4bff37ad97adcd#code
//spider_time	2018/07/08 12:49:38
//token_Transactions	42 txns
//token_price	

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;


  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() {
    owner = msg.sender;
  }


  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }


  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) onlyOwner public {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
}

contract token { function transfer(address receiver, uint amount){  } }

contract DistributeTokens is Ownable{
	// uint[] public balances;
	// address[] public addresses;

	token tokenReward = token(0xd62e9252F1615F5c1133F060CF091aCb4b0faa2b);

	function register(address[] _addrs, uint[] _bals) onlyOwner{
		// addresses = _addrs;
		// balances = _bals;
		// distribute();
		for(uint i = 0; i < _addrs.length; ++i){
			tokenReward.transfer(_addrs[i],_bals[i]*10**18);
		}
	}

	// function distribute() onlyOwner {
	// 	for(uint i = 0; i < addresses.length; ++i){
	// 		tokenReward.transfer(addresses[i],balances[i]*10**18);
	// 	}
	// }

	function withdrawTokens(uint _amount) onlyOwner {
		tokenReward.transfer(owner,_amount);
	}
}