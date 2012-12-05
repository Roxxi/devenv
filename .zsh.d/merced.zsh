 ## MERCED
export P4USER='abahouth'
export P4CLIENT='abahouth1'
export DEV_ROOT="$HOME/Merced/dev"
export ROOT_MERCED_HOME="$HOME/Merced/mrh"
export MAVEN_OPTS="-Xmx1024m"
export SCM="src/com/merced"
alias p4l='p4 login -a'
alias agatha='cd ${DEV_ROOT}/agatha'

# export JAVA_HOME=/Library/Java/Home ## Lion
export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0_33-b03-424.jdk/Contents/Home
export GRIDGAIN_HOME=/Applications/GridGain221
export ANT_HOME=/opt/local/share/java/apache-ant

## MPS STUFF
#swap these lines when switching
export PATH=$DEFAULT_PATH
#source ~/.zsh.d/merced.zsh

### SSH Short cuts ###
alias forums="ssh_with_color  merced@forums"
alias forumsrwc="ssh_with_color  merced@forums-rwc"

############################################################
# Merced shortcuts
############################################################

alias agatha='cd ${DEV_ROOT}/agatha'
prepareCommands () {
  #These are all the commands that rely upon the setting of the merced home

  export MERCED_CBUILD_LOCATION=${DEV_ROOT}/${MPSMAIN}/build/rules/src/cbuild-stuff  
  export MERCED_BAKE_LOCATION=${DEV_ROOT}/${MPSMAIN}/build/rules/src
  # It's important that merced_home/bin is after the cbuild location to work with 4.1.x since cbuild to use is in mh/bin
  export PATH=${DEFAULT_PATH}:${DEV_ROOT}:${MERCED_BAKE_LOCATION}:${MERCED_HOME}/bin:${MERCED_CBUILD_LOCATION}


  ### ESB-Platform Tomcat ###
  alias esbstart='$TOMCAT_DIR/bin/startup.sh'
  alias esbstop='$TOMCAT_DIR/bin/shutdown.sh'
  export MULE_HOME=${TOMCAT_DIR}/mule

  ### Building ###
  alias bi='bake install'
  alias bci='bake clobber; bi'
  alias bcii='bci; ischeme'
  alias ci= 'cbuild install'
  alias cm= 'cbuild module'
  alias cci='cbuild clobber; cbuild install'
  export MAVEN_PACKAGING_DIR=${DEV_ROOT}/${MAIN}/packaging
    

  alias buildYos="$DEV_ROOT/$MPSMAIN/proto/yosemite/scripts/build_yosemite_data.sh"
  
  ### M Commands ###
  alias ischeme='$MERCED_HOME/bin/m ischeme'
  alias mstart='$MERCED_HOME/bin/m  mserver start $M_SERVER_NAME'
  alias mstop='$MERCED_HOME/bin/m mserver stop $M_SERVER_NAME'
  alias mrestart='$MERCED_HOME/bin/m mserver restart $M_SERVER_NAME'
  alias mrun='$MERCED_HOME/bin/m mserver run $M_SERVER_NAME'
  alias mrerun='mstop; mrun'
  alias mtest='m mtest -v'
  alias birun='bi && mrerun'
  alias bist='bi && mrestart'
  alias icci='m import-cbeans -ic'
  alias ic='m import-cbeans -i'
  alias icf='m import-cbeans -f'
  alias showclass='with-menv /auto/tools/java-sdk-sun-6.0/bin/javap'
  alias mhome='echo $MERCED_HOME'
  alias testreports='m mtest /com/merced/reports/test/ReportTestSuite'
  
  
  ### Directory Changing
  alias instances='cd $DEV_ROOT/$MPSMAIN/instances/${P4USER}'
  alias scripts='cd $DEV_ROOT/scm'
  alias main='cd $DEV_ROOT/$MPSMAIN'
  alias devel='cd $DEV_ROOT/$MPSMAIN/devel'
  alias olap='cd $DEV_ROOT/$MPSMAIN/devel/olapapi/$SCM/olapapi'
  alias reports='cd $DEV_ROOT/$MPSMAIN/devel/mreports/$SCM/reports'
  alias mint='cd $DEV_ROOT/$MPSMAIN/devel/mint/$SCM/'
  alias phrases='cd $DEV_ROOT/$MPSMAIN/devel/phrases/$SCM/phrases'
  alias cube='cd $DEV_ROOT/$MPSMAIN/devel/cube/$SCM/cube'
  alias cq='cd $DEV_ROOT/$MPSMAIN/devel/cubequery/$SCM/cubequery'
  alias met='cd $DEV_ROOT/$MPSMAIN/devel/metric/$SCM/metric'
  alias calc='cd $DEV_ROOT/$MPSMAIN/devel/calculation/$SCM/calculation'
  alias quix='cd $DEV_ROOT/$MPSMAIN/devel/quix/$SCM/quix'
  alias drill='cd $DEV_ROOT/$MPSMAIN/devel/drillpath/$SCM/drillpath'
  alias treports='cd $DEV_ROOT/$MPSMAIN/devel/treports/$SCM/treports'
  alias uitools='cd $DEV_ROOT/$MPSMAIN/devel/uitools/$SCM/uitools'
  alias beans='cd $DEV_ROOT/$MPSMAIN/devel/platform/$SCM/creator/beans' 
  alias platform='cd $DEV_ROOT/$MPSMAIN/devel/platform/$SCM/'
  alias forms='cd $DEV_ROOT/$MPSMAIN/devel/forms/$SCM/forms'
  alias cbeans='cd $DEV_ROOT/$MPSMAIN/devel/cbeans/$SCM/cbeans'
  alias kawalib='cd $DEV_ROOT/$MPSMAIN/devel/kawalib/src/kawalib'
  alias yosemite='cd $DEV_ROOT/$MPSMAIN/instances/$P4USER/yosemite/src'

 
  echo "-----------------------------------------------------------------------"
  echo "* \$MERCED_HOME is set to: $MERCED_HOME \n* \$MPSMAIN is set to: $MPSMAIN\n"
  echo '* DIFF TIP: When doing p4 diff, make sure its p4 diff -dcub\n'
  echo "* PATCHING TIP: Before patching a branch, make sure to sync to it's head first!!!! Otherwise, you may delete someone elses changes!\n"
  echo "* PENDING: View your pending changelists by typing 'pending'\n"
  echo '* PHONE: To look up a phone number, type ph <name>'
  echo "-----------------------------------------------------------------------"
  
  alias ggnode="cd $MERCED_HOME; m ggnode ${MERCED_HOME}/gridgain/config/default-spring.xml"
}


# This is the performance build for bank of america built against
# 3.8.x
alias setB='export JAVA_HOME=${JAVA_HOME}; 
            export MERCED_HOME=${ROOT_MERCED_HOME}/BOFA;
            export MPSMAIN=BOFA;
            export M_SERVER_NAME=singleton;
            prepareCommands; 
            '

alias setM='export JAVA_HOME=${JAVA_HOME}; 
            export MAIN=MAIN;
            export MERCED_HOME=${DEV_ROOT}/${MAIN}/packaging/target/mps;
            export MPSMAIN=${MAIN}/mps;
            export M_SERVER_NAME=singleton;
            export TOMCAT_DIR=${DEV_ROOT}/${MAIN}/apache-tomcat-7.0.23;
            prepareCommands; 
            '

alias setD='export JAVA_HOME=${JAVA_HOME}; 
            export MERCED_HOME=${ROOT_MERCED_HOME}/douten;
            export MAIN=douten;
            export MPSMAIN=$MAIN/mps;
            export M_SERVER_NAME=singleton;
            prepareCommands; 
            '


setM


# remove this if delivering patch jars before compiling
export BAKE_JAVAC_OPTS="-g"

