import sys
import os
import re
import subprocess

dn = sys.argv[1]
en = dn + "-0.ebuild"
buf = open(os.path.join(dn, en)).read()

# parse
assert "romhustler.org" in buf
romId = re.search("EROM_ID=['\"](.*)['\"]", buf, re.M).group(1)
romName = re.search("EROM_NAME=(\\$?'|\")(.*)['\"]", buf, re.M).group(2)
romMain = re.search("EROM_MAIN_FILE=(\\$?'|\")(.*)['\"]", buf, re.M).group(2)
srcuri = re.search("SRC_URI=\"(.*)\"", buf, re.M).group(1)

# generate
os.rename(os.path.join(dn, en), os.path.join("/root", en))
buf = open(os.path.join(dn, "..", "baseball", "baseball-0.ebuild")).read()
buf = re.sub("ROM_NAME=.*", "ROM_NAME=\"%s\"" % (romName), buf, re.M)
buf = re.sub("MAIN_ROM_FILE=.*", "MAIN_ROM_FILE='%s'" % (romMain), buf, re.M)
buf = re.sub("HOMEPAGE=.*", "HOMEPAGE=\"https://romhustler.org/rom/nes/%s\"" % (romId), buf, re.M)
buf = re.sub("SRC_URI=.*", "SRC_URI=\"%s\"" % (srcuri), buf, re.M)
with open(os.path.join(dn, en), "w") as f:
    f.write(buf)

# generate
os.chdir(dn)
subprocess.run(["/usr/bin/ebuild", en, "manifest"])
subprocess.run(["/usr/bin/emerge", "-1", "games-nes/%s" % (dn)])
