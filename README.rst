ICAT configuration
==================

This repository contains the configuration files for the various
`ICAT`_ components.

The actual content is organised in branches.  The master branch is
reserved for example configuration files that were included in the
distribution, having <file>.example renamed to <file>.  Site and
installation specific configuration is in a specific branch
respectively.  Note that these specific branches contain secrets
and will thus not be pushed to public repositories.

On the master branch, the example configuration from each new
version of a component will overwrite the corresponding files from
the previous version.  So you will need to take care to branch
specific configuration off the right commit that corresponds to
right upstream version.


.. _ICAT: http://www.icatproject.org/

