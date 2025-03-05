REPO_URL = https://repo.icatproject.org/repo/org/icatproject
COMPONENTS = authn.anon authn.db authn.ldap authn.simple authn.oidc	\
	     icat.server icat.lucene icat.oaipmh			\
	     ids.server ids.storage_file

# unpack: unzip all distributions from the DOWNLOADDIR to their
# respective directories.
unpack:
	tmpfile=`mktemp`; \
	for d in $(COMPONENTS); \
	do \
	    ver=`cat $$d/VERSION | cut --delimiter=" " --fields=2`; \
	    url=$(REPO_URL)/$$d/$$ver/$$d-$$ver-distro.zip; \
	    (curl --silent --show-error --location --output $$tmpfile $$url && \
	     unzip -q $$tmpfile) || exit 1; \
	done; \
	rm -f $$tmpfile
	find $(COMPONENTS) -type f | xargs chmod go-w,a-x
	find $(COMPONENTS) -type f -name setup | xargs chmod a+x
	chmod a+x icat.server/icatadmin icat.server/testicat

# distclean: remove all files from the distributions, leaving only the
# configuration files maintained by this repository.
distclean:
	for d in $(COMPONENTS); \
	do \
		rm -rf $$d/__pycache__; \
		rm -f $$d/*.jar $$d/*.war $$d/*.example $$d/*.pyc $$d/*~  \
		      $$d/setup $$d/setup_utils.py \
		      $$d/LICENSE.txt $$d/README.txt; \
	done
	rm -f icat.lucene/parse_synonyms.py                             \
	      icat.server/create_triggers_* icat.server/drop_triggers_* \
	      icat.server/fix_floats_oracle.sql icat.server/icatadmin   \
	      icat.server/indices.sql icat.server/rules.py              \
	      icat.server/testicat icat.server/upgrade_*

.PHONY: distclean unpack
