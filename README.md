# Multi_Machine_Vagrant_Homework

**By : Erica P da Silva Correia**

#### Description :

The sample application has the ability to connect to a database. 
We need to provision our development environment with a vm for the database and one for the database.
Vagrant is capable of running two or more virtual machines at once with different configurations.

**Tasks:**

1. Research how to create a multi machine vagrant environment
2. Add a second virtual machine called "db" to your Vagrant file
3. Configure the db machine with a different IP from the app
4. Provision the db machine with a MongoDB database
	
**Notes**

When you have the second machine running further configuration of the app is required to make it use the database. 
We will cover this in the next lesson.
You can test your database is working correctly by running the test suite in the test folder. There are two sets of tests. 
One for the app VM and one for the db VM. 
Make them all pass.
cd testrake spec

**Steps**

1. sudo chown -R vagrant site
2. chmod -R 700 site
3. cd site
4. cd images
5. file - see that they're jpgs
6. man -k rename
7. lookup how to use rename
8. rename "s/txt/jpg/g" * .txt
9. rm puppy *
10. cd ..
11. ls -a
12. mv .index.html index.html
13. chmod g+r,o+rwx *


-----

#### Tech Used :
**Virtual Box, Vagrant, Bash**

-----
##### how to download :


1. go to the github page [**https://github.com/EricaDaSilvaCorreia**](https://github.com/EricaDaSilvaCorreia)
2. Click repositories and select the repository [**Development_Environment_Lab**](https://github.com/EricaDaSilvaCorreia/Development_Environment_Lab)
3. Click 'Clone or Download'
4. Choose between **Open in Desktop**, **Download ZIP**, **Clone with SSH**, **Clone with HTTPs**

-----
##### how to run :


1. Once Cloned or Downloaded, make sure you have Virtual box and Vagrant installed on your machine.
2. If you don't have Virtual Box installed, follow this link:[**Virtual Box**](https://www.virtualbox.org/wiki/Downloads)
If you don't have Vagrant installed, follow this link: [**Download Vagrant**](https://www.vagrantup.com/downloads.html)
3. Once installed, Open your terminal and check if vagrant has been downloaded.
4. In your terminal surn the command 'vagrant init' followed by the name of the machine image you want your virtual machine to have. in this case we are running **'vagrant init ubuntu/xenial64'**
5. Once that is done running, open your vagrant file in your text editor of choice and remove the commented out code you won't need.
6. In your text editor, check if the box name is correct and save. You should see something like this :

~~~

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

end
~~~

7. In your terminal enter the command **'vagrant up'** (depending on how many times you have run this it could take between 5 minutes to an hour).
8. Once that is done, in your terminal enter the command **'vagrant ssh'** to enter the virtual machine.
9. Still in your terminal enter the command **'sudo vagrant apt-get update && apt-get upgrade'** this will check for any updates that may have been uploaded after the version was posted and immediately upgrade.
10. Following that we will install nginx **'sudo vagrant apt-get install nginx -y'**
11. Then enter **'curl http://localhost'** to check if nginx has been installed. You should see the html of the site appear.
12. Enter the command **'ifconfig'** to get the current address of your virtual machine (inet addr).
13. Go back to the vagrant file in your text editor and inside the Vagrant.configure("2") you can add a network like so :


~~~
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.network "private_network", ip:"192.168.12.120"

end
~~~

and Save the file before going back to your terminal. this sets up ip address that you can access from your browser on your normal machine. Open a browser and enter http:// (chosen ip) to check if it works.

14. Return to you terminal and enter the command **'vagrant reload'** to allow the virtual machine to run the changes to the config file.
15. Once this is done, enter the command  **'vagrant ssh'** to enter your machine.

-----


##### Challenges :

Overall, there weren't any challenges with this homework. It was mostly a question of research and trying things out. My main obstacle was that the rake spec wouldn't run in test :

~~~
rake aborted!
LoadError: cannot load such file -- rspec/core/rake_task
/home/vagrant/db/tests/rakefile:2:in `<top (required)>'
(See full trace by running task with --trace)
~~~


but I went through the files and checked that the requirements were met.

I also looked into having app use the database in db but couldn't find a good source of information for that. Will keep trying so I may update if I find something.

-----

##### Take-Aways :

All in all I think today was very interesting. I really enjoyed the research aspect of this task to find the correct way to implement multiple machines in the same vagrant file. Aside from running the tests, I couldn't find a concrete method to get app to use the database in db so I'm looking forward to learning about that tomorrow.

I give it a 7/10.

-----
