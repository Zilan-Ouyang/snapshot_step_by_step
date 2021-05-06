# Snapshot Tutorial

Step by step on how to create a space with snapshot and how to use it

## Instructions
### Register google cloud DNS (.xyz) with ENS 
#### 1. Setting up DNSSEC on your cloud DNS dashboard (Whatever provider you need, make sure you select RSA signatures and SHA256 hashing)
![alt settingUpDns](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/turn_on_dnssec.png)

#### 2. Add a subdomain record for ENS (_ens.yourdomainname.xyz) and set TXT data with your owner wallet address
![alt settingUpDns](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/create_record_set.png)

#### 3. Integrate the smart contract into your front end

#### 1. Before we start the integration, make sure you fund the generated contract address with your custom tokens first
![alt deployOutput](https://github.com/Zilan-Ouyang/merkle_distributor_airdrop_front_end/blob/main/screenshots/fundingContract.png)
#### 2. Add merkle tree output to a json file, name it "merkleTree.json":
![alt deployOutput](https://github.com/Zilan-Ouyang/merkle_distributor_airdrop_front_end/blob/main/screenshots/merkleTreejson.png)

#### 3. Integrate the contract functions to your javascript front end codebase
```javascript
import Web3 from 'web3';
import MerkleDistributor from '../merkle-distributor/build/contracts/MerkleDistributor.json' //generated by truffle
import tree from './merkleTree.json'
export default class MerkleDistributorClient {
    constructor(){
        window.web3 = new Web3(window.ethereum);
        let abtract = MerkleDistributor.abi
        this.distributorInstance = new window.web3.eth.Contract(abtract, '0x76F4720705010dfBCB0C2C6a9ed133faF0c2D2AD')
        this.tree = tree
    }
    
    async claimToken(userAddress){
        
        const claimAccounts = Object.keys(tree.claims).map(e => e.toLowerCase())
        const claimAccountsArr = Object.keys(tree.claims).map(ele => {
            return {
                address: ele.toLowerCase(),
                index: tree.claims[ele]['index'],
                amount: tree.claims[ele]['amount'],
                proof: tree.claims[ele]['proof']
            }
        })
        if (claimAccounts.includes(userAddress)) { //check if the input address is in the tree
            const proofOfAddress = claimAccountsArr[claimAccounts.indexOf(userAddress)].proof //get the proof
            const indexOfAddress = claimAccountsArr[claimAccounts.indexOf(userAddress)].index //get the index
            const amountOfAddress = claimAccountsArr[claimAccounts.indexOf(userAddress)].amount //get the airdrop amount
            let txHash = await this.distributorInstance.methods.claim(indexOfAddress, userAddress, amountOfAddress, proofOfAddress)
            .send({from: userAddress}, function(error, transactionHash){
                return transactionHash.hash
            })
            return txHash;
        }
        else{
            return false
        }
    }
}
```
### 4. Result
#### Claiming token:
![alt deployOutput](https://github.com/Zilan-Ouyang/merkle_distributor_airdrop_front_end/blob/main/screenshots/claimingToken.png)

#### Successfully claimed token:
![alt deployOutput](https://github.com/Zilan-Ouyang/merkle_distributor_airdrop_front_end/blob/main/screenshots/result.png)

## License
[MIT](https://choosealicense.com/licenses/mit/)