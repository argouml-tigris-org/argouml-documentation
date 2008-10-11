#! /bin/sh
#

# $Id$

#
 
# Always use the ant that comes with ArgoUML
if [ -e `pwd`/tools ] ; then
    ANT_HOME=`pwd`/tools/apache-ant-1.7.0
else
    echo "***************************************************************"
    echo "  ERROR: tools directory not found."
    echo "***************************************************************"
    exit 1
fi

echo ANT_HOME is: $ANT_HOME
echo
echo Starting Ant...
echo

echo Checking JAVA_HOME...
if [ -e "$JAVA_HOME/bin" ] ; then
    echo "JAVA_HOME is set OK."
else
    echo "***************************************************************"
    echo "  WARNING: JAVA_HOME not set correctly or no JRE installed.    "
    echo "***************************************************************"
fi


$ANT_HOME/bin/ant $*

exit
