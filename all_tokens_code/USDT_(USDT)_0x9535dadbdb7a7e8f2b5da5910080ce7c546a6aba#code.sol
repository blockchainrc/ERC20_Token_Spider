//token_name	USDT_(USDT)
//token_url	https://etherscan.io//address/0x9535dadbdb7a7e8f2b5da5910080ce7c546a6aba#code
//spider_time	2018/07/08 12:48:15
//token_Transactions	5 txns
//token_price	

contract USDT {
    /* Public variables of the token */
    string public standard = 'USDT 1.01';
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public initialSupply;
    uint256 public totalSupply;

    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

  
    /* Initializes contract with initial supply tokens to the creator of the contract */
    function USDT() {

         initialSupply = 100000000;
         name ="USDT";
        decimals = 2;
         symbol = "USDT";
        
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
        totalSupply = initialSupply;                        // Update total supply
                                   
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
      
    }

   

    

   

    /* This unnamed function is called whenever someone tries to send ether to it */
    function () {
        throw;     // Prevents accidental sending of ether
    }
}