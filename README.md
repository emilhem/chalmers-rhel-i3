# chalmers-rhel-i3
A big ol' Makefile to build i3 for Chalmers RHEL 7.x machines

## Where will it be placed?
Currently it is set to end up in `/chalmers/users/USER/usr/`

## How to use?
* Make sure that you are on a Chalmers RHEL 7.x machine
* Run `git clone https://github.com/emilhem/chalmers-rhel-i3.git`
* Run `cd chalmers-rhel-i3`
* Run `make`
* Create a `.xinitrc` file in your home folder (example file [example.xinitrc](example.xinitrc))
* Create a symlink from `.xsession` to `.xinitrc`. `ln -s ~/.xinitrc ~/.xsession`
* Logout
* Enter username then ENTER
* Enter password then press the cogwheel next to the login button and choose `User script`
* Profit

## Issues
* For some packages it downloads the tarballs even though they already exist.
* The makefile isn't flawless

## License
[GNU Affero General Public License version 3](LICENSE)

