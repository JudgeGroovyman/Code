
export BASHGITDIR=~/git/HomeRun/bash/

# reloading profiles
source ${BASHGITDIR}.my_bash_profile
source ${BASHGITDIR}.fiverr_bash_profile ${BASHGITDIR}.dev_bash_profile  ${BASHGITDIR}.voices_bash_profile

# Load all of the bash profiles for editing at once
editbash () {
	mate ~/.bash_profile ~/.bashrc ${BASHGITDIR}.my_bash_profile ${BASHGITDIR}.fiverr_bash_profile ${BASHGITDIR}.dev_bash_profile  ${BASHGITDIR}.voices_bash_profile
}

# reshell - reload the shell settings
alias r=". ~/.bashrc"


