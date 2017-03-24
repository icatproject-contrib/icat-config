DOWNLOADDIR = $(HOME)/Downloads
COMPONENTS = authn.anon authn.db authn.ldap authn.simple	\
	     icat.server ids.server ids.storage_file topcat

# unpack: unzip all distributions from the DOWNLOADDIR to their
# respective directories.
unpack:
	for d in $(COMPONENTS); \
	do \
		distfile=`cat $$d/VERSION | tr " " "-"`-distro.zip; \
		unzip $(DOWNLOADDIR)/$$distfile; \
	done

# distclean: remove all files from the distributions, leaving only the
# configuration files maintained by this repository.
distclean:
	for d in $(COMPONENTS); \
	do \
		rm -f $$d/*.jar $$d/*.war $$d/*.example $$d/*.pyc $$d/*~  \
		      $$d/setup $$d/setup_utils.py \
		      $$d/LICENSE.txt $$d/README.txt; \
	done
	rm -f icat.server/fix_floats_oracle.sql icat.server/icatadmin   \
	      icat.server/indices.sql icat.server/rules.py              \
	      icat.server/testicat icat.server/upgrade_*
	rm -rf topcat/migrations

.PHONY: distclean unpack
