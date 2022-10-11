// SPDX-License-Identifier:GPL-3.0

pragma solidity 0.8.7;

contract Auction {
     
     mapping(address => uint) biddersData;
     uint highestbidamount;
     address highestBidder;
     uint starttime = block.timestamp;
     uint endtime;
     address owner;
     bool auctionEnded = false;
      //put new bid

      function putbid() public payable {
          // verifying value not to be zero
          uint calculateAmount = biddersData[msg.sender]+msg.value;
      //     require(block.timestamp <= endtime,"auction is completed");
      //     require(msg.value >0,"bid amount cannot be zero");

      //    // check highest bid
      //   require(calculateAmount > highestbidamount, "highest bid already present");
        biddersData[msg.sender]= calculateAmount;
        highestbidamount = calculateAmount;
        highestBidder = msg.sender;
      }

      // get contract balance only for testing

      function getbidderbid(address _address) public view returns(uint) {
          return biddersData[_address];
      }
      // get higestbid amount

      function highestBid() public view returns(uint) {
         return highestbidamount;
      }
       // get highestbid address

       function HighestBidder() public view returns(address) {
          return highestBidder;
       }
       //add endtime

       function putEndtime(uint _endtime) public {
          endtime = _endtime;
       }
       // put endtime

       function endAuction() public {
          if (msg.sender == owner) {
              auctionEnded = true;
          }
       }
       function withdrawBid(address payable _address) public {
          if (biddersData[_address] > 0) {
            _address.transfer(biddersData[_address]);
          }
       }
}