# Original version is created by shoma2da
# https://github.com/shoma2da/neobundle_installer

# Installation directory
BUNDLE_DIR=~/.vim/bundle
INSTALL_DIR=$BUNDLE_DIR/neobundle.vim

if [ -e $INSTALL_DIR ]; then
  echo "$INSTALL_DIR already exists!"
  exit 1
fi

# check git command
if type git; then
  : # You have git command. No Problem.
else
  echo 'Please install git or update your path to include the git executable!'
  exit 1;
fi

# make bundle dir and fetch neobundle
echo "Begin fetching NeoBundle..."
mkdir -p $BUNDLE_DIR
git clone https://github.com/Shougo/neobundle.vim $INSTALL_DIR
echo "Done."

echo "Preparing personal configuration of NeoBundle"
curl https://raw.githubusercontent.com/fchicout/myvim/master/.vimrc > ~/.vimrc
echo "Done."

echo "Configuring bashrc setting"
echo "stty -ixon" >> ~/.bashrc
echo "Done."
echo "Complete setup NeoBundle! (with customizations)"
