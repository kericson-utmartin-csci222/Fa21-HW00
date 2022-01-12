# Welcome to HW00! #
For this homework assignment, we'll be working on getting you used to Git, Linux, and emacs (probably not in that order
)
Fun fact: if you edit the README.md file on your machine, you can "fill in" the checkboxes!

- [X] Set up your GitHub account
- [X] Accept the Classroom Assignment
- [ ] Get going with Git
  - [ ] Set up SSH with GitHub
  - [ ] Create a local directory for your classwork
  - [ ] **Clone** your class repository
- [ ] Set up emacs
  - [ ] Download and place the class .emacs file
  - [ ] Download and place the doqmnt.el file
  - [ ] Install company
- [ ] Practice with emacs && Git
  - [ ] Add a main() with a "Hello World!" to main.cpp
  - [ ] Compile and test on your machine
  - [ ] **stage**, **commit**, and **push** to GitHub
  - [ ] Remember to add header comments to main.cpp (M-x file-doq)
  - [ ] **stage**, **commit**, and **push** to GitHub (now with comments!)
- [ ] Celebrate! the completion of HW00!
- [ ] Extra credit?

## Working with Git ##
<details>
<summary> Getting going with Git </summary>

If you are here, that means you have successfully created your GitHub account, *and* connected to the class repo :tada:
### Getting Started ###
Creating your GitHub account is something you need to do once, and then never again.  Creating a repo (what happened when you accepted the class assignment), is something you'll likely do once per project - you shouldn't need to do it again for this assignment.
### Setting up SSH with GitHub ###
This is a task you'll need to do once per unique *machine* you work on.  Given the way the CS department Linux machines are set up, you should only need to do this once, and it will work no matter which physical machine you are using (you will need to do it for a home/personal machine if you want to though!)
1. Open a Terminal in Linux (you can click on "Activities" in the upper left, and type Terminal into the search bar)
1. In the terminal, generate an SSH key:
   ```console
   $ ssh-keygen -t ed25519 -C "username@ut.utm.edu"
   ```
   NOTES: the '$' is just there to show that you're on a Linux terminal, and you should put in your own UTM email address in the quotes! (what you signed up on GitHub with)
1. You will be prompted for a file name - press enter to accept the default file location (but remember it!)
1. You will be prompted to enter a passphrase (hit enter for no passphrase - this is the simplest thing to do!)
1. Re-enter your passphrase and press enter (or leave blank and press enter again for no passphrase)

Your SSH keypair should now be complete! :tada:

Now you need to add the public key to GitHub

To do this, we'll use the ``cat`` command, which con*cat*enates the file to your output, so we can easily see it!
1. ```console
   cat .ssh/id_ed25519.pub
   ```
   NOTE: you may have a slightly different name - the key thing is to make sure you have the file that ends with .pub - this is the public key!
1.  copy this from the terminal
    * highlight with the mouse, then hit enter (this copies it to the clipboard)
1. in the browser, click your profile photo on the upper-right of any GitHub page, then select "Settings"
1. in the user settings sidebar, click "SSH and GPG keys"
1. click on "New SSH Key"
1. in the "Title" field, add a helpful label for the key (something like "CS Lab Key" would be good!)
1. paste your key into the "Key" field
1. click "Add SSH key"

At this point, you should be good to go, though you may need to confirm your GitHub password!
We've only brushed the basics of setting up your machine to work with Git, next up: Cloning this repo to the local machine!
</details>

### Cloning the repo ###
<details>
	<summary>Steps to get the repo cloned to your local machine! (Do this once in the lab)</summary>

If you are viewing this in the browser (which you probably are):
1. Click on the download code button
1. Make sure the SSH option is selected
1. You should see a link starting with ``git@`` - click on the clipboard next to it
1. In the terminal, make a folder to hold your CS222 projects
   ```console
   mkdir CSCI222
   ```
   It is up to you if you want to place this in your home directory (where you start by default in the terminal), or if you want to put it into the Documents folder, or Desktop folder (``cd Documents``, for example, first)
1. Now move into the new folder using the 'change directory' (`cd`) command
1. Now you're ready to clone your repo!  In the terminal type in:
   ```console
   git clone
   ```
   And then paste in the link starting with ``git@`` into the terminal (you can do this with a right click!)  This should result in you seeing:
   ```console
   git clone git@...
   ```
   where the ... is the rest of the repository name!
   
   NOTE: you may be asked if it's OK for SSH to talk to a specific IP address.  If prompted, type in 'yes', and continue the clone operation!
1. You should now have a local copy of this repo :tada: double-check that the file structure matches what you're seeing here online (you'll want to use ``ls`` to _list_ the contents of a directory, and ``cd`` to _change directory_, or move into a folder to make sure everything looks good.

Your GitHub setup should now be complete!  We'll be working closely with Git thoughout the semester, so don't worry if it still feels a little weird!
Also, if you want to clone your repository to a personal machine, you'll need to follow these steps again!
</details>

## Setting up emacs ##
<details>
	<summary>Getting used to emacs and setting up your environment</summary>
	
We're going to be using emacs this semester for our software development.  Emacs is a powerful text-editor available freely in Linux.  It is also highly customizable!  Dr. Guerin and I have been working together to create programs that modify emacs for this class!

### Emacs Basics ###
Most of the commands we'll be using this semester will start with either C- or M-, this stands for the Control and Meta keys, respectively.  For example, ``C-x`` means to hold the control key, and then tap 'x'.  On most standard keyboards, the 'Alt' key is mapped to Meta (you can override this behavior if wanted/needed, but we're not going to cover that here)

#### Running emacs ####
In this class, we'll be primarily running emacs in the terminal:
```console
emacs -nw
```
the ``-nw`` is what will force emacs to open in the terminal, as opposed to popping up a new window.  This is useful when running emacs remotely!

#### Some very common commands (as in, you'll see/use all the time) ####
- C-x C-s - save
- C-x C-c - close the buffer (the open window)
- C-x C-f - open a file without closing emacs
- C-g - quit the current command you're entering (super helpful if you mess up/do something by accident)
- C-x space - start marking - useful for cutting, commenting out code, etc
- C-x C-w - cut (more common to cut and paste immediately instead of a coopy)
- C-x C-y - paste (yank from the kill-chain)
- M-x comment-region - will intelligently comment out the marked region
- M-x uncomment-region - will intelligently uncomment the marked region
- C-n - move down a line (down arrow also works)
- C-p - move up a line (up arrow also works)
- C-f - move forwards a character (right arrow)
- M-f - move forwards a word (also C-right arrow)
- C-b - move backwards a character (left arrow)
- M-b - move backwards a word (also C-left arrow)
- C-a - move to the beginning of a line (also home key)
- C-e - move to the end of a line (also end key)
- C-u - undo!

#### Setting up your .emacs file ####
For many Linux programs, you'll use a .<program name> file to customize how that program behaves, generally known as init files.  To customize emacs, we'll be modifying your .emacs file.  This file should live in your home diretory (/home/cs0/<your username>).  You can find a starter .emacs file in <file location>, you either place a copy of the provided file into your home directory, or open up both files and copy it over line by line.  To move the file over:
```console
cp emacs/.emacs ~/.emacs
```
NOTE: this is assuming that you are in the terminal, and when you run ``ls``, you see this README.md file.

NOTE2: "~" is a special shortcut to your home directory!

Next, you'll want to move over the doqmnt file - this is an emacs extension that Dr. Guerin and I have been putting together for you!
First, you'll create a folder to hold the file inside the emacs directory, and then you'll copy over the doqmnt file stored in the emacs folder of this repository:
```console
mkdir ~/.emacs.d/include
cp emacs/doqmnt.el ~/.emacs.d/include
```
Again, this is assuming that you're in the base folder of this repository

The emacs and doqmnt files provide several helpful functions, but of immediate use:
- M-x main - this will insert a main.cpp template at the cursor point - it will include the iostream library, and use the standard namespace
- M-x file-doq - this will add header comments that match the standards for this class
- M-x fun-doq - this will add function comments that match the standards for this class

##### Installing company ####
company-mode is a useful emacs add-on, standing for complete-any - it adds in helpful completion suggestions based on what you're starting to type - helpful when writing anything in emacs, not just C++ code! (though we'll mostly be using it for C++ code in class).

You can find more information about company-mode here: [company-mode](https://company-mode.github.io/)

We will just be following the basic install steps:
1. Open your .emacs file
```console
emacs -nw .emacs
```
1. Type in: ``M-x package-install`` and hit enter
1. Type in: ``company`` and hit enter

  NOTE: if you get an error message about a failure to verify a signature, enter each command below, pressing enter after each line:
  - M-: (setq package-check-signature nil)
  - M-x package-install
  - gnu-elpa-keyring-update
  - M-: (setq package-check-signature allow-unsigned)
  
  Close and re-open the .emacs file, and try to install company again

After installing company, make sure it's always enabled:
1. Go to the end of the file ``M->``
1. Uncomment the last line ``(add-hook 'after-init-hook 'global-company-mode)`` by removing the semicolons
1. Save and exit out of emacs
  - C-x C-s (save)
  - C-x C-c (quit)

NOTE: there are a lot of company options, we only need the basic one for this class! (you're welcome to try out more if you wish!)


</details>

### Practicing with emacs && Git ###
<details>
<summary>Using emacs to make a quick program </summary>

We are now going to use our new, powerful emacs skillz (with a 'z') to make a quick program, showing off that everything is working (and also practicing the important steps of compiling, testing, and then interacting with git through `git add`, `git commit`, and `git push`

1. Open the main.cpp file in this repository
  - cd into the directory, if needed
  - then type in:
  ```console
  emacs -nw main.cpp
  ```
  - this opens up emacs with "no window" (it keeps it in the terminal)
  - NOTE: this is also how you can create a new file - just put the new file name after the ``emacs -nw`` and a new file will be created for you!
 2. Use the super-cool special "main" command that we have in our .emacs file:
   - M-x main
   - be amazed at how awesome it is!
 3. Using your skeleton main(), have it print out "Hello World!"
   - you've got this part!
 4. Save and exit emacs
   - C-x
   - C-s
    (saving should now be done)
   - C-x
   - C-c
   (this should exit you out of emacs, and bring you back to the console)
 5. Time to test your program!
   Remember: it's always good to test things before submitting them...
   - compile with g++:
   ```console
   g++ main.cpp -Wall -Wextra -o hello
   ```
   - this *should* happily compile (please reach out for help if you're getting errors)
   - with a happy compilation, you should now have an executable called hello (it should be green and exciting when you type in `ls`
   - run your program!
   ```console
   ./hello
   ```
   - profit! (though make sure you're printing out "Hello World!"
6. Once your program is running correctly, it's time to get your program into git!
  * First, check the **status** of your repository:
  ```console
  git status
  ```
   - you **should** see that main.cpp has been modified!
  * Next, tell git that you want this modified main.cpp to be **staged** for a commit:
  ```console
  git add main.cpp
  ```
    - if you run ``git status`` again, you should now see that main.cpp is added for commit!
  * Next, you want to **commit** your changes to your local repository:
  ```console
  git commit -m "Created my Hello World! program!"
  ```
   - NOTE: the '-m' flag is so you can add a **m**essage to your commit.
   - it doesn't need to match the above sample, but please make it say something useful, if not for your own sanity then for mine...
   - if you don't attach a message, you'll be dumped into a text editor to add a message (git enforces you leaving a note on every commit!)
  * Your main.cpp should now be committed to your local repository (:tada:yay!:tada:), but wait, it's not yet into GitHub (where it actually needs to be to count for homework...).  To get it out to GitHub, you need to **push** your commit
  ```console
  git push
  ```
NOTE: you don't need to push to GitHub for every local commit (though it is a good habit to get into, so you don't forget to push your homework...), a single push will handle multiple local commits!
  - You should now be able to see tests running on your assignment!
  - Did they pass?  Did you remember the "!" at the end of "Hello World"?
 - if they didn't pass, open your main.cpp up again, make the changes you need, then **stage**, **commit**, and **push** your changes!

###### Wait!!!
we're missing the header comments from our main.cpp - we need those for this class, and GitHub can't check for that in tests...
 Time to add in comments!
 1. Open up main.cpp again:
    ```console
    emacs -nw main.cpp
    ```
 2. Add in some file comments!
      - ``M-x file-doq`` - make sure to answer any questions it asks you
      - marvel over the awesomeness of that doqmnt file you told emacs about!
    * Save and exit emacs
      - C-x C-s
      - C-x C-c
  3. Compile and run your program to confirm you're still seeing the correct output
  ```console
  g++ main.cpp -Wall -Wextra -o hello
  ./hello
  ```
  4. **stage**, **commit**, and then **push** your updated file!
    * `git add main.cpp`
    * `git commit -m "added in header comments"`
    * `git push`
  5. Watch your tests running...
    - if they were passing before, they should still be passing!
  :tada: Celebrate! :tada: as we have completed the required portion of this lab!
 What about extra credit?
   - [ ] Submit a screenshot of the test passing on Canvas
   - [ ] In the CheatSheets folder, edit the helpers.md file to finish filling out the documentation! (don't forget to **stage**, **commit**, and **push** these changes!
:octocat:
</details>