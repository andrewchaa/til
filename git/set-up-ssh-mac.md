1. Generate public / private rsa key pair

   ```
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   # Creates a new ssh key, using the provided email as a label
   Generating public/private rsa key pair.
   ```

2. Ensuare ssh agent is enabled

   ```
   # start the ssh-agent in the background
   eval "$(ssh-agent -s)"
   Agent pid 59566
   ```

3. Add your SSH key to the ssh-agent. If you used an existing SSH key rather than generating a new SSH key, you'll need to replace id_rsa in the command with the name of your existing private key file. Use -K option to add it to Mack Keychain

   ```
   $ ssh-add -K ~/.ssh/id_rsa
   ```

4. Copy the SSH key to your clipboard.

   ```
   $ pbcopy < ~/.ssh/id_rsa.pub
   # Copies the contents of the id_rsa.pub file to your clipboard
   ```
