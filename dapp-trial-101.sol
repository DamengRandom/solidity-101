pragma solidity >= 0.7.0 < 0.9.0;

contract Auction {
    address payable public beneficiary;
    uint public auctionEndTime;
    
    address public highestBidder;
    uint public highestBid;
    
    bool ended;
    
    event highestBidIncreased(address bidder, uint amount);
    event auctionEnded(address winner, uint amount);
    
    mapping(address => uint) pendingReturns;
    
    
    constructor (uint _biddingTime, address payable _beneficiary) {
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }
    
    function bid() public payable {
        if (block.timestamp > auctionEndTime) revert('Auction has ended ..');
        if (msg.value <= highestBid) revert('Oops, the bid is not higher enough ..');
        if (highestBid != 0) pendingReturns[highestBidder] += highestBid;
        
        highestBidder = msg.sender;
        highestBid = msg.value;
        
        emit highestBidIncreased(highestBidder, highestBid);
    }
    
    // withdraw bids were over bid ..
    function withdraw() public payable returns(bool) {
        uint amount = pendingReturns[msg.sender];
        
        if(amount > 0) pendingReturns[msg.sender] = 0;
        if(!payable (msg.sender).send(amount)) pendingReturns[msg.sender] = amount;
        
        return true;
    }
    
    function auctionEnd() public {
        if(auctionEndTime < block.timestamp) revert('Auction still ongoing ..');
        if(ended) revert('Auction is over ..');
        
        ended = true;
        emit auctionEnded(highestBidder, highestBid);
        
        beneficiary.transfer(highestBid);
    }
}
