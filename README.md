bamboo_remote_agent_window
=========

Deploy a bamboo remote agent run on window server 2016 and sutiable to build
dotnet projects.

This is for act2 legacy project thus efforts has been made to be generic but
somehow it is best to consult the software requirements of the project to
figure it out what it is in this role. And you will see not much aprt from some
window and dot net sdk stuff.

Requirements
------------

- role win_base has been run to apply some basic window setup.

Role Variables
--------------

`bamboo_agent_depends_chocolatey_packages` 
`build_project_depends_chocolatey_packages`
`role_chocolatey_packages` - is the union of the two above. 

`bamboo_agent_user_name: bamboo`
`bamboo_agent_user_password`

These variables are name explainable.

`bamboo_agent_home` - directory where bamboo agent will put all its files and
 its build files etc. Should be large enough.

`bamboo_agent_jarfile_name` - The exact jar file name - get it from the bamboo
 server. Each server has one specific for its version or deployment, be sure to
 get correct one.

`bamboo_agent_jarfile_url` - The full url to get the agent jar file - example:
 "https://ci.xvt.technology/agentServer/agentInstaller/{{ bamboo_agent_jarfile_name }}"

`bamboo_agent_server_url` - The url to contact to the bamboo server - eg.
 "https://{{ bamboo_server }}/agentServer/"

`bamboo_token` - The secret (or not so) to put into the bamboo agent launch
 command to contact to the bamboo server. The value is get from the bamboo
 server GUI. Login and get somewhere to the agent status there should be a
 button 'Install remote agent' - get to that page and read. Many information is
 from there as well.

`bamboo_agent_launch_cmd` - The agent complete launch command.

`bamboo_agent_capabilities` - contains the textual lines of the
 bamboo-capabilities.properties file to set our custom capabilities.
 The default value always has a variable below ...

`cross_account_capability` - deploy into a line <cross_account_capability>=yes into the cap file.

`bamboo_agent_extra_capabilities` - This will be appended to the default
 bamboo_agent_capabilities to allow inventory to add more lines into the
 capability file.

So by default if bamboo_agent_capabilities is not provided it is defaulted to the first line contains `cross_account_capability`=yes and then `bamboo_agent_extra_capabilities`

Dependencies
------------


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
