Create Scalarizr Repository
===========================

This repository of scripts lets you create and manage custom Scalarizr
repositories.

Usage
-----

  + Clone this repository **on a fresh new host**:
    `git clone https://github.com/Scalr/create-scalarizr-repo.git`
  + Run the `entrypoint.sh` script.

Whenever you'd like to refresh your repositories, just run `entrypoint.sh`
again.


Caveats
-------

This script does not delete old Scalarizr packages. You might want to add
a cron job to delete those and save disk space.


Reporting Issues
----------------

If you run into a problem, file an issue on GitHub:
https://github.com/Scalr/create-scalarizr-repo/issues


License
-------

Apache 2.0.
