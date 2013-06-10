<?php /* #?ini charset="utf-8"?
# File: ezjscore.ini.append.php
# Purpose:  
# Granite Horizon CRM

[ezjscServer]
FunctionList[]=getDataSet

[ezjscServer_ghcrmfetch]
Class=GHCRMFetch
File=extension/ghcrm/classes/ghcrmfetch.php
Functions[]=getDataSet

[eZJSCore]

Packer=enabled

# enable / disable loading the YUI / jQuery files from external servers
LoadFromCDN=enabled
PreferredLibrary=jquery

*/ ?>
