//token_name	AIRPORT_CITY_20230515_(AIRCITI)
//token_url	https://etherscan.io//address/0x3eb13bb9b01018b27c1bae50579e50c4094efdc1#code
//spider_time	2018/07/08 11:46:45
//token_Transactions	3 txns
//token_price	

pragma solidity 		^0.4.21	;						
									
contract	AIRPORT_CITY_20230515				{				
									
	mapping (address => uint256) public balanceOf;								
									
	string	public		name =	"	AIRPORT_CITY_20230515		"	;
	string	public		symbol =	"	AIRCITI		"	;
	uint8	public		decimals =		18			;
									
	uint256 public totalSupply =		14819434587663000000000000					;	
									
	event Transfer(address indexed from, address indexed to, uint256 value);								
									
	function SimpleERC20Token() public {								
		balanceOf[msg.sender] = totalSupply;							
		emit Transfer(address(0), msg.sender, totalSupply);							
	}								
									
	function transfer(address to, uint256 value) public returns (bool success) {								
		require(balanceOf[msg.sender] >= value);							
									
		balanceOf[msg.sender] -= value;  // deduct from sender's balance							
		balanceOf[to] += value;          // add to recipient's balance							
		emit Transfer(msg.sender, to, value);							
		return true;							
	}								
									
	event Approval(address indexed owner, address indexed spender, uint256 value);								
									
	mapping(address => mapping(address => uint256)) public allowance;								
									
	function approve(address spender, uint256 value)								
		public							
		returns (bool success)							
	{								
		allowance[msg.sender][spender] = value;							
		emit Approval(msg.sender, spender, value);							
		return true;							
	}								
									
	function transferFrom(address from, address to, uint256 value)								
		public							
		returns (bool success)							
	{								
		require(value <= balanceOf[from]);							
		require(value <= allowance[from][msg.sender]);							
									
		balanceOf[from] -= value;							
		balanceOf[to] += value;							
		allowance[from][msg.sender] -= value;							
		emit Transfer(from, to, value);							
		return true;							
	}								
}