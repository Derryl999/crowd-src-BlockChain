const CrowdSource = artifacts.require('CrowdSource');

require('chai')
    .use(require('chai-as-promised'))
    .should()

contract("CrowdSource", ([owner, people]) => {
 
  

  describe('CrowdSource deployment', async () => {
    let count,amnt, campResult, campId
    
    before(async () =>{
      crowdSource = await CrowdSource.new()
      campResult = await crowdSource.setCampaign('Kerela', 50000, {from:owner})
      //count= await crowdSource.CampCount()
      // amnt = await campaigns.currentAmount
      // campId = await campaigns.campId
      result = await crowdSource.setTransaction(10000, 1 , 'aayush', 'deryl')
      //curr->10k
      amnt = await crowdSource.campaigns(1).currentAmount
      amnt=amnt.toString()
    })

    it('done', async () => {
      console.log(result.log)
      assert.equal(amnt,'10000')
    })


})
});

