// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.9.0;

contract CrowdSource{   
  uint public adminBalance=0;
  uint public count=0;
  uint public CampCount=0;
  address public owner;

  constructor()public{
    owner=msg.sender; 
  }

  mapping(uint => Donation) public donations;
  struct Donation{
    uint donationId;
    uint amount;
    uint campId;
    string sender;        
    string recipient;     
  }
  
  mapping(uint => Campaign) public campaigns;
  struct Campaign{
    uint campId;
    string campName;
    uint totalAmount;
    uint currentAmount;
    bool target;
  }

 //["kerela","Mum","kar"]
 //1 2 3


  function setTransaction(uint _amount, uint _campId, string memory _sender, string memory _recipient) public { 
    count+=1;

  // if(msg.sender == owner){

  //   require(adminBalance>=_amount);
  //   donations[count]=Donation(count, _amount, _campId, _sender, _recipient);
  //   //adminBalance -= _amount;

  // }else{
    //p->admin total donatn for the camp -> transfer should be done from admin
    require(_amount>0);
    donations[count]=Donation(count, _amount, _campId , _sender, _recipient); 
    adminBalance += _amount;
    campaigns[_campId].currentAmount+=_amount;
  //}
  }


  function setCampaign(string memory _campName, uint _totalAmount) public {
      require(msg.sender == owner);
      CampCount = CampCount + 1;
      campaigns[CampCount]=Campaign(CampCount, _campName, _totalAmount, 0, false);
  }
  
}