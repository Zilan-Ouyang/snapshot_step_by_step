# Snapshot Tutorial

Step by step on how to create a space with snapshot and how to use it

## Instructions
### Register google cloud DNS (.xyz) with ENS 
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
