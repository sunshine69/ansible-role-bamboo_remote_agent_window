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

- `install_chocolatey_pkg` - Optional - Flag to enable install the chocolatey packages - default is no.
  It is usefull if you rebuild bamboo agent only on top of a existing working
  dotnet build and SDK system and do not want to install the latest version.
  Set it to True is you want to pull the latest version but it might break.
- `bamboo_agent_depends_chocolatey_packages` - optional
- `build_project_depends_chocolatey_packages` - optional
- `bamboo_agent_build_project_extra_chocolatey_packages` - optional - extra packages in addition to the two above.
- `bamboo_agent_build_project_npm_chocolatey_packages` - optional - extra npm packages required.
- `role_chocolatey_packages` - optional - is the union of the three above. They
   have default values required for bamboo-agent to build dotnetcore and window SDK

- `bamboo_agent_user_name` - optional - default: bamboo
- `bamboo_agent_user_password` - required - no default and need to be set in inventory vault data.

These above variables purposes are explainable by its name.

- `bamboo_agent_home` - optional - default: c:\bamboo_agent

 directory where bamboo agent will put all its files and
 its build files etc. Should be large enough.

- `bamboo_agent_jarfile_name` - Optional - Default: atlassian-bamboo-agent-installer-5.15.7.jar based on current bamboo server.

 The exact jar file name - get it from the bamboo
 server. Each server has one specific for its version or deployment, be sure to
 get correct one.

- `bamboo_agent_jarfile_url` - Optional - Values might need to be updated in role
 or provided in inventory if bamboo server changes.

 The full url to get the agent jar file - example:
 "https://ci.xvt.technology/agentServer/agentInstaller/{{ bamboo_agent_jarfile_name }}"

- `bamboo_agent_server_url` - Optional - Values might need to be updated in role
   or provided in inventory if bamboo server changes.

 The url to contact to the bamboo server - eg.
 "https://{{ bamboo_server }}/agentServer/"

- `bamboo_token` - required. Values might need to be updated in role
 or provided in inventory if bamboo server changes.

 The secret (or not so) to put into the bamboo agent launch
 command to contact to the bamboo server. The value is get from the bamboo
 server GUI. Login and get somewhere to the agent status there should be a
 button 'Install remote agent' - get to that page and read. Many information is
 from there as well.

- `bamboo_agent_launch_cmd` - Optional - Default auto created based on the other
 variables above

 The agent complete launch command.

- `bamboo_agent_capabilities` - Optional -
 contains the textual lines of the bamboo-capabilities.properties file to set
 our custom capabilities.
 The default value always has a variable below ...

- `cross_account_capability` - Optional - Default: empty
 deploy into a line <cross_account_capability>=yes into the cap file.

- `bamboo_agent_extra_capabilities` - Optional - Default: empty
 This will be appended to the default
 bamboo_agent_capabilities to allow inventory to add more lines into the
 capability file.

 So by default if bamboo_agent_capabilities is not provided it is defaulted to
 the first line contains `cross_account_capability`=yes and then
 `bamboo_agent_extra_capabilities`

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
