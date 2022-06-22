# GENSAT Public Database

## Explanation

The intention of this repository is to streamline downloading, updating, and accessing the GENSAT Public Database. Information about this database and how it's structured can be found in a [document]([doc]) released by GENSAT. They also have methods of interfacing with this database on their [website](http://www.gensat.org/), but having direct access to the database allows for more flexibility.

## Setup

**NOTE:** Everything in this repository assumes that you are running Windows 10.

1. [Install MariaDB](#database-installation)
2. Open a PowerShell prompt and navigate to the directory you want to install this repository
   * see [Navigating PowerShell](#navigating-powershell) for help with changing directories in a PowerShell prompt
3. Clone/Download this repository to the directory of your choice
   * This requires `git` to be installed ([64-bit Windows Installation](https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-64-bit.exe), [32-bit Windows Installation](https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-32-bit.exe))
   * run `git clone {cloning link}` in PowerShell to clone the repository
     * this will create a *new* folder called `gensat_db` in your current directory
4. Change your directory to the repository's by running `cd gensat_db`
5. Run `download_data.bat` in PowerShell while in the repository's directory to download and unzip the GENSAT database dump
6. Run `copy_db.bat {db_user_name} {db_user_password}` in PowerShell to copy the database to MariaDB.
   * replace `{db_user_name}` with the desired MariaDB user's username (`root` is recommended)
   * replace `{db_user_name}` with the MariaDB user's password (if the user is `root` then the password is whatever you chose when installing MariaDB)
   * example: `copy_db.bat root password`

### Database Installation

1. Install [MariaDB 10.3.21](https://mariadb.org/download/?t=mariadb&o=true&p=mariadb&r=10.3.21&os=windows&cpu=x86_64&pkg=msi) using the installer. The default installation settings will work but change them if you feel it's necessary.
2. Add MySQL to your PATH variable.
   1.  If you changed MariaDB's installation path while installing (skip this otherwise):
       1.  Open File Explorer
       2.  Locate your download of MariaDB
       3.  Navigate to the `bin` folder
       4.  Copy the path
   2.  Type `environment variable` into the Windows search bar (typically bottom left next to the Windows icon)
   3.  Open `Edit the system environment variables`
   4.  Click the button labeled `Environment Variables...` near the bottom of the opened window.
   5.  Under the section labeled `User Variables for {YOUR_USERNAME}`... 
       1.  click the variable named `Path`.
       2.  click the button labeled `Edit...`
       3.  in the top right of the new window (titled `Edit environment variable`), click the button labeled `New`
       4.  If you chose a different install location for MariaDB, paste the path you copied from before
       5.  If you did not change install location, paste `C:\Program Files\MariaDB 10.3\bin` into the field
   6.  Click the `OK` button at the bottom right of the `Edit environment variable` window.
   7.  Click the `OK` button at the bottom right of the `Environment Variables` window.
   8.  Click the `OK` button at the bottom of the `System Properties` window.
   9.  Restart any terminals (PowerShell or Command Prompt) for the change to take effect.

### Navigating PowerShell

* To open PowerShell, type PowerShell in the Windows search bar.
* To navigate between directories/folders use the `cd` command:
  * to get a list of subdirectories, use the `ls` command.
  * to navigate to a subdirectory, enter `cd {directory_name}`, replacing `{directory_name}` with whatever directory you wish to change to
    * pressing Tab while typing a directory name will autocomplete the name. Continuously pressing Tab will autocomplete with more options
  * `cd ..` will return you the the previous directory/super directory
  * `cd ~` will return you to your user's home directory (e.g, `C:\Users\John Doe\`)
    * this is the default directory PowerShell opens to

## Use

To interface with the database, run `access.bat {username} {password}` in PowerShell. This will pull up a new command line interface to interact with the database. Here, you can run the example commands in the GENSAT [document], such as `select * from structure`, or those of your own creation. It is recommended you learn the structure of the database and SQL (at least the `SELECT` and `GROUP BY` features) to get the most out of the data ([click here](https://www.w3schools.com/sql/) for a tutorial on SQL).

The public database updates daily, so run `download_data.bat` and `copy_db.bat` regularly to keep your local copy updated.

[document]: http://www.gensat.org/GENSAT_Data_Mining_PUBLIC_DATABASE.pdf