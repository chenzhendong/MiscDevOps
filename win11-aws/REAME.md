1. On Hyper-V install windows 11.
2. Active Administrator user in the Computer Management
3. Active Administrator https://github.com/massgravel/Microsoft-Activation-Scripts.  Run \Microsoft-Activation-Scripts-master\Microsoft-Activation-Scripts-master\MAS\All-In-One-Version\MAS_AIO.cmd and Select KMS38
4. Enable the Remote Desktop Access on Search Box input Settings -> System -> Remote Desktop and turn on switch.
5. Run gpedit (Group Policy Editor),  find  Computer Configuration -> Administrative Templates -> System -> Credential Delegation.  Enable Allow delegating saved credentials, and input "TERMSRV/*" to Add servers to the list. 
6. Hyper-V Manager export the VM to a directory.
7. Hyper-V Manager click "Edit Disk" find avhdx file in the EXPORT directory, click Merge and merge to parent VHD.  So we will get a single VHD file.
8.  Upload VHD file to s3 bucket.
9.  Configure VM Import role https://docs.aws.amazon.com/vm-import/latest/userguide/vmie_prereqs.html#vmimport-role.   (Need permission access ec2 and s3, and need to create a role to be assumed by a backend batch job.)
10.  Run command:  aws ec2 import-image --disk-containers "UserBucket={S3Bucket=${BUCKET_NAME}, S3Key=${VHDX_NAME}}" --boot-mode uefi
11. Check status aws ec2 describe-import-image-tasks
