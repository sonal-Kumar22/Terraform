- Command to create key pair : ssh-keygen -t rsa 
this command will create a key pair value of type rsa

- private key is shared with client while the public key is stored in .ssh folder in authorized_keys file of users profile

#output block
output path {
  value = "${path.module}"
}

This block basically print the directory path -> .

- file function : basically receives an argument in which we need to pass the file path in it
Ex:
#output block
output path {
  value = file("${path.module}")
}

Video : https://www.youtube.com/watch?v=xtgkFeOV7TE&list=PL6XT0grm_TfgdaAjTmLb4QedMCCMQHISm&index=33


