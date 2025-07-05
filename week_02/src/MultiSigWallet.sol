// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiSigWallet {

    event Deposit(address indexed sender, uint256 amount, uint256 balance);

    event SubmitTransaction(address indexed onwner, uint256 indexed txIndexed, address indexed to, uint256 value, bytes data);

    event ConfirmTransaction(address indexed owner, uint256 indexed txIndex);

    event ExecuteTransaction(address indexed owner, uint256 indexed txIndex);

    event RevokedConfirmation(address indexed owner, uint256 indexed txIndex);

    modifier onlyOwner() {
        require(isOwner[msg.sender], "NOT Owner!");
        _;
    }

    modifier txExists(uint256 _txIndex) {
        require(_txIndex < transactions.length, "Transaction does not exist!");
        _;
    }

    modifier notExecuted(uint256 _txIndex) {
        require(!transactions[_txIndex].executed, "Transaction is executed!");
        _;
    }

    modifier notConfirmed(uint256 _txIndex) {
        require(!isConfirmed[_txIndex][msg.sender], "Transaction is Confirmed by the Owner(msg.sender)!");
        _;
    }

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint256 public numConfirmationsRequired;


    struct Transaction{
        address to;
        uint256 value;
        bytes data;
        bool executed;
        uint256 numConfirmation;
    }

    Transaction[] public transactions;

    mapping(uint256 => mapping(address => bool)) public isConfirmed;


    constructor(address[] memory _owner, uint256 _numConfirmationsRequired) {
        require(_owner.length > 0, "Owner required");
        require(_numConfirmationsRequired > 0 && _numConfirmationsRequired <= _owner.length, "Invaild Number of confirmation required!");

        for(uint256 i=0; i<_owner.length; i++) {
            address owner = _owner[i];

            require(owner != address(0), "Invaild Owner!");
            require(!isOwner[owner], "Owner is not unique");

            isOwner[owner] = true;
            owners.push(owner);
        }

        numConfirmationsRequired = _numConfirmationsRequired;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    function sumbitTransaction(address _to, uint256 _value, bytes memory _data)
        public
        onlyOwner {
            uint256 txIndexed = transactions.length;

            transactions.push(
                Transaction({
                    to: _to,
                    value: _value,
                    data: _data,
                    executed: false,
                    numConfirmation: 0
                })
            );

            emit SubmitTransaction(msg.sender, txIndexed, _to, _value, _data);
    }


    function confirmTransaction(uint256 _txIndex) 
        public
        onlyOwner
        txExists(_txIndex)
        notExecuted(_txIndex)
        notConfirmed(_txIndex) {
            Transaction storage transaction = transactions[_txIndex];

            transaction.numConfirmation += 1;

            isConfirmed[_txIndex][msg.sender] = true;

            emit ConfirmTransaction(msg.sender, _txIndex);

    }


    function executeTransaction(uint256 _txIndex)
        public
        onlyOwner
        txExists(_txIndex)
        notExecuted(_txIndex) {
            Transaction storage transaction = transactions[_txIndex];

            require(transaction.numConfirmation >= numConfirmationsRequired, "cannot execute tx!");

            transaction.executed = true;
            (bool success,) = transaction.to.call{value: transaction.value}(transaction.data);
            require(success, "tx failed!");

            emit ExecuteTransaction(msg.sender, _txIndex);

    }

    
    function revokeConfirmation(uint256 _txIndex)
        public
        onlyOwner
        txExists(_txIndex)
        notExecuted(_txIndex) {
            Transaction storage transaction = transactions[_txIndex];

            require(isConfirmed[_txIndex][msg.sender], "tx not confirmed!");

            transaction.numConfirmation -= 1;
            isConfirmed[_txIndex][msg.sender] = false;

            emit RevokedConfirmation(msg.sender, _txIndex);
    }



    function getOwners() public view returns(address[] memory) {
        return owners;
    }

    function getTransactioncount() public view returns(uint256) {
        return transactions.length;
    }


    function getTransaction(uint256 _txIndex)
        public
        view
        returns (
            address,
            uint256,
            bytes memory,
            bool,
            uint256
        ) {
            Transaction storage transaction = transactions[_txIndex];

            return (
                transaction.to,
                transaction.value,
                transaction.data,
                transaction.executed,
                transaction.numConfirmation
            );
    }



}