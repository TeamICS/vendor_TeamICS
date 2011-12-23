#!/sbin/sh
#
# Backup and restore proprietary Android system files
#

C=/tmp/backupdir
S=/system
V=TeamICS

PROCEED=1;

check_prereq() {
   if ( ! grep -q "^ro.modversion=.*$V.*" /system/build.prop );
   then
      echo "Not backing up files from incompatible version.";
      PROCEED=0;
   fi
}

check_installscript() {
   if [ -f "/tmp/.installscript" ] && [ $PROCEED -ne 0 ];
   then
      # We have an install script, and ROM versions match!
      # We now need to check and see if we have force_backup
      # in either /etc or /tmp/backupdir 
      if [ -f "$S/etc/force_backuptool" ] || [ -f "$C/force_backuptool" ];
      then
         echo "force_backuptool file found, Forcing backuptool."
      else
         echo "/tmp/.installscript found. Skipping backuptool."
         PROCEED=0;
      fi
   fi
}

get_files() {
    cat <<EOF
framework/com.google.android.maps.jar
framework/com.google.android.media.effects.jar
lib/libvoicesearch.so
etc/permissions/com.google.android.media.effects.xml
etc/permissions/com.google.android.maps.xml
etc/permissions/features.xml
app/MediaUploader.apk
app/GoogleFeedback.apk
app/GoogleTTS.apk
app/CalendarGoogle.apk app/Calendar.apk
app/MarketUpdater.apk
app/GoogleServicesFramework.apk
app/YouTube.apk
app/GenieWidget.apk
app/GooglePackageVerifierUpdater.apk
app/SetupWizard.apk app/Provision.apk
app/GoogleEarth.apk
app/ChromeBookmarksSyncAdapter.apk
app/GoogleQuickSearchBox.apk app/QuickSearchBox.apk
app/GoogleLoginService.apk
app/Talk.apk
app/Maps.apk
app/GooglePackageVerifier.apk
app/GoogleBackupTransport.apk
app/GalleryGoogle.apk app/Gallery.apk
app/Vending.apk
app/GoogleContactsSyncAdapter.apk
app/Gmail.apk
app/OneTimeInitializer.apk
app/NetworkLocation.apk
app/GooglePartnerSetup.apk
app/BooksPhone.apk
app/CarHomeGoogle.apk
app/CarHomeLauncher.apk
app/Facebook.apk
app/FOTAKill.apk
app/GoogleCalendarSyncAdapter.apk
app/googlevoice.apk
app/kickback.apk
app/LatinImeTutorial.apk
app/MapsSapphire.apk
app/PassionQuickOffice.apk
app/Quickoffice.apk
app/soundback.apk
app/Street.apk
app/Talk2.apk
app/talkback.apk
app/Twitter.apk
app/VoiceSearch.apk
etc/hosts
etc/custom_backup_list.txt
etc/force_backuptool
EOF
}

get_custom_files() {
   local L
   if [ -f "$C/custom_backup_list.txt" ];
   then
      [ ! -f $C/fixed_custom_backup_list.txt ] && tr -d '\r' < $C/custom_backup_list.txt \
            > $C/fixed_custom_backup_list.txt
      L=`cat $C/fixed_custom_backup_list.txt`
      cat <<EOF
$L
EOF
   fi
}

backup_file() {
   if [ -e "$1" ];
   then
      if [ -n "$2" ];
      then
         echo "$2  $1" | md5sum -c -
         if [ $? -ne 0 ];
         then
            echo "MD5Sum check for $1 failed!";
            exit $?;
         fi
      fi
      
      local F=`basename $1`
      
      # dont backup any apps that have odex files, they are useless
      if ( echo $F | grep -q "\.apk$" ) && [ -e `echo $1 | sed -e 's/\.apk$/\.odex/'` ];
      then
         echo "Skipping odexed apk $1";
      else
         cp -p $1 $C/$F
      fi
   fi
}

restore_file() {
   local FILE=`basename $1`
   local DIR=`dirname $1`
   if [ -e "$C/$FILE" ];
   then
      if [ ! -d "$DIR" ];
      then
         mkdir -p $DIR;
      fi
      cp -p $C/$FILE $1;
      if [ -n "$2" ];
      then
         rm $2;
      fi
   fi
}

# don't (u)mount system if already done
UMOUNT=0

case "$1" in
   backup)
      if [ ! -f "$S/build.prop" ]; then
         mount $S
         UMOUNT=1
      fi
      check_prereq;
      check_installscript;
      if [ $PROCEED -ne 0 ];
      then
         rm -rf $C
         mkdir -p $C
         for file_list in get_files get_custom_files; do
           $file_list | while read FILE REPLACEMENT; do
              backup_file $S/$FILE
           done
         done
      fi
      if [ $UMOUNT -ne 0 ]; then
         umount $S
      fi
   ;;
   restore)
      if [ ! -f "$S/build.prop" ]; then
         mount $S
         UMOUNT=1
      fi
      check_prereq;
      check_installscript;
      if [ $PROCEED -ne 0 ];
      then
         for file_list in get_files get_custom_files; do
           $file_list | while read FILE REPLACEMENT; do
              R=""
              [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
              restore_file $S/$FILE $R
           done
         done
         rm -rf $C
      fi
      if [ $UMOUNT -ne 0 ]; then
         umount $S
      fi
      sync
   ;;
   *)
      echo "Usage: $0 {backup|restore}"
      exit 1
esac

exit 0
