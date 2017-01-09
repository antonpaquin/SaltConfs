# SaltConfs

Saltstack is an infrastructure-as-code system that controls the state of a machine using code in the form of templated YAML .sls files.

I'm using saltstack to manage the config files on my own machines. Untracked configuration is begging to be lost and forgotten. Configuration that's stored in github and managed by a program designed to deploy it to machines is much more stable and reliable.

Ideally, any of my machines should be able to be cloned with a few commands.

## Usage

1. Setup a salt master
2. Setup the target machine as a salt minion
3. Deploy these files to /srv/salt (pillar goes to /srv/pillar)
4. sudo salt 'Targetmachine' state.apply targetstate
