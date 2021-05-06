# Snapshot Tutorial

Step by step on how to create a space with snapshot and how to use it

## Instructions
### Register google cloud DNS (.xyz)
#### 1. Setting up DNSSEC on your cloud DNS dashboard (Whatever provider you need, make sure you select RSA signatures and SHA256 hashing)
![alt settingUpDns](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/turn_on_dnssec.png)

#### 2. Add a subdomain record for ENS (_ens.yourdomainname.xyz) and set TXT data with your owner wallet address
![alt settingUpDns](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/create_record_set.png)

#### 3. Set up DNSSEC security
Go to https://domains.google.com/registrar/<your-domain>/dns, add DS record:
 ![alt settingUpDns](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/google_domain.png)

You can find the DS record information from your google cloud DNS - Registar Setup (key tag, Algorithm, Digest type, Digsest): 
![alt settingUpDns](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/registar_info.png)

#### 4. Check if DNS has been setup and DS record has been added sucessfully (https://dnssec-debugger.verisignlabs.com/):
There shouldn't be any error or warning message showing on the table
![alt settingUpDns](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/dnssec_debugger.png)

### Claiming your DNS domain in ENS:
#### 1. Go to ENS manager, and input your domain name into the search box (https://app.ens.domains/)
This step has to be done on Ethereum main network - you need to have enought eth in your metamask wallet for registration fee and gas fee etc. 

#### 2. Once the domain has been claimed successfuly, you can proceed to setting up the resolver of your ens domain:
A resolver is a contract that maps from name to resource (eg, Ethereum account address, public key, content hash, etc).
You can choose to use the public resolver or enter the address of your custom resolver contract, public resolver implements a general-purpose ENS resolver that is suitable for most standard ENS use-cases. The public resolver permits updates to ENS records by the owner of the corresponding name. 

### Create snapshot space with your ENS (this can be done on mainnet and testnet)
#### 1. Create new space:
![alt settingUpSnapshot](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/create_space.png)
#### 2. add IPNS recrod to your ENS
the IPNS record is pointed to the wallet address you use to create the space:
![alt settingUpSnapshot](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/set_ipns_record.png)
Copy the ipns record and set the record on ENS, so you can use the wallet to proceed to creating the space on snapshot (this step also has to be done on mainnet, makes sure you have enough gas fee in your wallet for record setting transaction):
##### 1. Click on "ADD/EDIT RECORD"
![alt settingUpSnapshot](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/add_record_on_ens.png)
##### 2. Select "text" as record type, and create "snapshot" key, then paste ipns url to the input field:
![alt settingUpSnapshot](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/paste_ipns_to_text_record.png)
##### 3. After snapshot record has been set on ENS, go back to snapshot page and refresh it, you'll be redirected to the space setting page:
![alt settingUpSnapshot](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/space_setting.png)
##### 4. You can set up your space profile (Name, Description, network, Symbol, Avatar etc.):
![alt settingUpSnapshot](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/setting_up_profile.png)
##### 5. Set up strategies used by the snapshot space to decide the voting power of each voter:
![alt settingUpSnapshot](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/strategies.png)
Choose the strategy you are going to use to calculate the voting power/score of each voter, "erc20-balance-of" will be used as an example:
you can replace the existing token address with your own deployed token address:
![alt settingUpSnapshot](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/erc-20-balance_strategy.png)
##### 6. Add Admin and members of your space:
![alt settingUpSnapshot](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/account_permission.png)

### Create proposal on snapshot space
After everything has been setup, you can go to your space dashboard (https://snapshot.org/#/<your-ENS_domain>):
![alt creatingSnapshotProposal](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/dashboard.png)
#### Creating new proposal: 
![alt creatingSnapshotProposal](https://github.com/Zilan-Ouyang/snapshot_step_by_step/blob/main/screenshots/creating_proposal.png)
Members' proposals will be shown under core proposals