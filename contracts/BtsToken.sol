pragma solidity ^0.7.4;

contract BtsToken {

    string public name = "BtsToken";
    string public symbol = "BTS";
    string public standard = 'BTS Token v1.0';
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

     event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    //Constructor    
    constructor (uint256 _initalSupply) {
        balanceOf[msg.sender] = _initalSupply;
        totalSupply = _initalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {

        allowance[msg.sender][_spender] = _value;

        Approval(msg.sender, _spender, _value);

       return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        //Change the balance
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        //Update the allowance
        allowance[_from][msg.sender] -= _value;

        Transfer(_from, _to, _value);

        return true;
    }

}
