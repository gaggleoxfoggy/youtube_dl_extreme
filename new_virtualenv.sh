# Name your environment:
ENV=env

# Options for your first environment:
ENV_OPTS=''

# Set to whatever python interpreter you want for your first environment:
PYTHON=python3

# Latest virtualenv from pypa
URL_BASE=https://github.com/pypa/virtualenv/tarball/master

# Name on local fs
TAR_NAME=virtualenv-tmp.tar.gz

# --- Real work starts here ---

# Download/unpack latest virtualenv
echo Installing latest virtualenv from pypa
curl -Lo $TAR_NAME $URL_BASE
echo Unpacking virtualenv
tar xzf $TAR_NAME

# Discover the name of the untarred directory
UNTARRED_NAME=$(tar tzf $TAR_NAME | sed -e 's,/.*,,' | uniq)

# Create the first "bootstrap" environment & install virtualenv
virtualenv .env
.env/bin/pip install $TAR_NAME
.env/bin/pip install --upgrade -r requirements.txt

# Don't need these anymore.
rm -rf $UNTARRED_NAME
rm -f $TAR_NAME
