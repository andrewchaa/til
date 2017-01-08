## SSH challenge and communication

Your client says, "Hey server, I'd like to connect by SSH to an account on your system, specifically, the account owned by user smith."The server says, "Well, maybe. First, I challenge you to prove your identity!" And the server sends some data, known as a challenge, to the client.Your client says, "I accept your challenge. Here is proof of my identity. I made it myself by mathematically using your challenge and my private key." This response to the server is called an authenticator.The server says, "Thanks for the authenticator. I will now examine the smith account to see if you may enter." Specifically, the server checks smith's public keys to see if the authenticator "matches" any of them. (The "match" is another cryptographic operation.) If so, the server says, "OK, come on in!" Otherwise, the authentication fails.

An SSH identity uses a pair of keys, one private and one public. The private key is a closely guarded secret only you have. Your SSH clients use it to prove your identity to servers. The public key is, like the name says, public. You place it freely into your accounts on SSH server machines. During authentication, the SSH client and server have a little conversation about your private and public key. If they match (according to a cryptographic test), your identity is proven, and authentication succeeds.

Each time you reconnect to that remote host, the SSH client checks the remote host's identity using this public key.

## host key

each SSH server has a secret, unique ID, called a host key, to identify itself to clients.

