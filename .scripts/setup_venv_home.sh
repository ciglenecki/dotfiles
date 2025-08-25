VENV_LOC=$HOME/venv

if [ ! -d $VENV_LOC ]
then
	mkdir $VENV_LOC
	python3 -m venv $VENV_LOC
	source $VENV_LOC/bin/activate
else
	echo "The directory $VENV_LOC exists."
fi