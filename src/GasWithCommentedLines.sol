// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// import "./Ownable.sol";

contract GasContract {
    // uint256 constant private tradeFlag = 1;
    // uint256 constant private basicFlag = 0;
    // uint256 constant private dividendFlag = 1;
    // uint256 immutable private totalSupply; // cannot be updated
    // uint256 private paymentCounter = 0;
    address private immutable contractOwner;
    mapping(address => uint256) public balances;
    // uint256 constant private tradePercent = 12;

    // uint256 constant private tradeMode = 0;
    // mapping(address => Payment[]) private payments;
    mapping(address => uint256) public whitelist;
    address[5] public administrators;
    // bool private isReady = false;
    // enum PaymentType {
    //     Unknown,
    //     BasicPayment,
    //     Refund,
    //     Dividend,
    //     GroupPayment
    // }
    // PaymentType constant defaultPayment = PaymentType.Unknown;

    // History[] private paymentHistory; // when a payment was updated

    // struct Payment {
    //     PaymentType paymentType;
    //     uint256 paymentID;
    //     bool adminUpdated;
    //     string recipientName; // max 8 characters
    //     address recipient;
    //     address admin; // administrators address
    //     uint256 amount;
    // }

    // struct History {
    //     uint256 lastUpdate;
    //     address updatedBy;
    //     uint256 blockNumber;
    // }
    // uint256 private wasLastOdd = 1;
    // mapping(address => uint256) private  isOddWhitelistUser;

    // struct ImportantStruct {
    //     uint256 amount;
    //     bool paymentStatus;
    // }
    // mapping(address => ImportantStruct) private whiteListStruct;
    mapping(address => uint256) private addrToAmount;
    // mapping(address => bool) private addrToPaymentStatus;

    event AddedToWhitelist(address userAddress, uint256 tier);

    // modifier onlyAdminOrOwner() {
    //     // address senderOfTx = msg.sender;
    //     if (checkForAdmin(msg.sender)) {
    //         require(
    //             checkForAdmin(msg.sender),
    //             "Caller not admin"
    //         );
    //         _;
    //     } else if (msg.sender == contractOwner) {
    //         _;
    //     } else {
    //         revert(
    //             "the originator of the transaction was not the admin, and furthermore he wasn't the owner of the contract, so he cannot run this function"
    //         );
    //     }
    // }

    // modifier checkIfWhiteListed(address sender) {
    //     // address senderOfTx = msg.sender;
    //     // require(
    //     //     msg.sender == sender
    //     // );
    //     uint256 usersTier = whitelist[msg.sender];
    //     require(
    //         usersTier > 0 && usersTier < 4
    //     );
    //     // require(
    //         // usersTier < 4        );
    //     _;
    // }

    // event supplyChanged(address indexed, uint256 indexed);
    // event Transfer(address recipient, uint256 amount);
    // event PaymentUpdated(
    //     address admin,
    //     uint256 ID,
    //     uint256 amount,
    //     string recipient
    // );
    event WhiteListTransfer(address indexed);

    constructor(address[] memory _admins, uint256 _totalSupply) {
        contractOwner = msg.sender;
        // totalSupply = _totalSupply;
        balances[contractOwner] = _totalSupply;
        // administrators = _admins;
        for (uint256 ii = 0; ii < 5; ii++) {
            // if (_admins[ii] != address(0)) {
            administrators[ii] = _admins[ii];
            // if (_admins[ii] == contractOwner) {
            //     balances[contractOwner] = totalSupply;
            // } else {
            //     balances[_admins[ii]] = 0; //??
            // }
            // if (_admins[ii] == contractOwner) {
            // emit supplyChanged(_admins[ii], totalSupply);
            // } else if (_admins[ii] != contractOwner) {
            // emit supplyChanged(_admins[ii], 0);
            // }
            // }
        }
    }

    // function getPaymentHistory()
    //     public
    //     payable
    //     returns (History[] memory paymentHistory_)
    // {
    //     return paymentHistory;
    // }

    function checkForAdmin(address _user) public view returns (bool) {
        // bool admin = false; // no need
        //length
        // for (uint256 ii = 0; ii < 5; ii++) {
        //     if (administrators[ii] == _user) {
        //         return admin_ = true;
        //         // return
        //     }
        // }
        return _user == contractOwner;
    }

    function balanceOf(address _user) public view returns (uint256) {
        //  uint256 balance = balances[_user];
        return balances[_user];
    }

    // function getTradingMode() public pure returns (bool mode_) {
    //     bool mode = false; // ??
    //     //write in conditional
    //     if (tradeFlag == 1 || dividendFlag == 1) {
    //         mode = true;
    //     } else {
    //         mode = false;
    //     }
    //     return mode;
    // }

    // function addHistory(address _updateAddress, bool _tradeMode)
    //     public
    //     returns (bool status_, bool tradeMode_)
    // {
    //     //use returns
    //     History memory history;
    //     history.blockNumber = block.number;
    //     history.lastUpdate = block.timestamp;
    //     history.updatedBy = _updateAddress;

    //     paymentHistory.push(history);
    //     // bool[] memory status = new bool[](tradePercent);
    //     // for (uint256 i = 0; i < tradePercent; i++) {
    //     //     status[i] = true;
    //     // }
    //     return (true, _tradeMode);
    // }

    // function getPayments(address _user)
    //     public
    //     view
    //     returns (Payment[] memory payments_)
    // {
    //     require(
    //         _user != address(0),
    //         "User must have a valid non zero address"
    //     );
    //     return payments[_user];
    // }

    function transfer(address _recipient, uint256 _amount, string calldata) public returns (bool status_) {
        // address senderOfTx = msg.sender;
        // require(
        //     balances[msg.sender] >= _amount        );
        // require(
        //     bytes(_name).length < 9        );
        uint256 senderBalance = balances[msg.sender];

        unchecked {
            balances[msg.sender] = senderBalance - _amount;
            balances[_recipient] += _amount;
        }

        // emit Transfer(_recipient, _amount);
        // Payment memory payment;
        // payment.admin = address(0);
        // payment.adminUpdated = false;
        // payment.paymentType = PaymentType.BasicPayment;
        // payment.recipient = _recipient;
        // payment.amount = _amount;
        // payment.recipientName = _name;
        // payment.paymentID = ++paymentCounter;
        // payments[msg.sender].push(payment);
        // bool[] memory status = new bool[](tradePercent);
        // for (uint256 i = 0; i < tradePercent; i++) {
        //     status[i] = true;
        // }
        return true;
    }

    // function updatePayment(
    //     address _user,
    //     uint256 _ID,
    //     uint256 _amount,
    //     PaymentType _type
    // ) public onlyAdminOrOwner {
    //     require(
    //         _ID > 0,
    //         "ID must be greater than 0"
    //     );
    //     require(
    //         _amount > 0,
    //         "Amount must be greater than 0"
    //     );
    //     require(
    //         _user != address(0),
    //         "Administrator must have a valid non zero address"
    //     );

    //     address senderOfTx = msg.sender;

    //     for (uint256 ii = 0; ii < payments[_user].length; ii++) {
    //         if (payments[_user][ii].paymentID == _ID) {
    //             payments[_user][ii].adminUpdated = true;
    //             payments[_user][ii].admin = _user;
    //             payments[_user][ii].paymentType = _type;
    //             payments[_user][ii].amount = _amount;
    //             // bool tradingMode = getTradingMode();
    //             // addHistory(_user, tradingMode);
    //             emit PaymentUpdated(
    //                 senderOfTx,
    //                 _ID,
    //                 _amount,
    //                 payments[_user][ii].recipientName
    //             );
    //         }
    //     }
    // }

    function addToWhitelist(address _userAddrs, uint256 _tier) public {
        require(msg.sender == contractOwner);
        require(_tier < 255);
        // whitelist[_userAddrs] = _tier;
        // if (_tier > 3) {
        //     // whitelist[_userAddrs] -= _tier;
        //     whitelist[_userAddrs] = 3;
        // } else
        // if (_tier == 1) {
        //     // whitelist[_userAddrs] -= _tier;
        //     whitelist[_userAddrs] = 1;
        // } else
        if (_tier < 3) {
            // whitelist[_userAddrs] -= _tier;
            whitelist[_userAddrs] = 2;
        } else {
            whitelist[_userAddrs] = 3;
        }
        // uint256 wasLastAddedOdd = wasLastOdd;
        // if (wasLastAddedOdd == 1) {
        //     wasLastOdd = 0;
        //     isOddWhitelistUser[_userAddrs] = wasLastAddedOdd;
        // } else if (wasLastAddedOdd == 0) {
        //     wasLastOdd = 1;
        //     isOddWhitelistUser[_userAddrs] = wasLastAddedOdd;
        // } else {
        //     revert();
        // }
        emit AddedToWhitelist(_userAddrs, _tier);
    }

    function whiteTransfer(address _recipient, uint256 _amount) public {
        // address senderOfTx = msg.sender;
        // whiteListStruct[msg.sender] = ImportantStruct(_amount,true);
        addrToAmount[msg.sender] = _amount;
        // addrToPaymentStatus[msg.sender] = true;

        // require(
        //     balances[msg.sender] >= _amount
        // );
        // require(
        //     _amount > 3
        // );
        // balances[msg.sender] -= _amount;
        // balances[_recipient] += _amount;
        // balances[msg.sender] += whitelist[msg.sender];
        // balances[_recipient] -= whitelist[msg.sender];
        balances[msg.sender] = balances[msg.sender] - _amount + whitelist[msg.sender];
        balances[_recipient] = balances[_recipient] + _amount - whitelist[msg.sender];

        emit WhiteListTransfer(_recipient);
    }

    function getPaymentStatus(address sender) public view returns (bool, uint256) {
        uint256 amount = addrToAmount[sender];
        return (amount != 0, amount);
        // return (whiteListStruct[sender].paymentStatus, whiteListStruct[sender].amount);
    }

    // receive() external payable {
    //     payable(msg.sender).transfer(msg.value);
    // }

    // fallback() external payable {
    //      payable(msg.sender).transfer(msg.value);
    // }
}
