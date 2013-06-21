<?php /* #?ini charset="utf-8"?
# File: ezjscore.ini.append.php
# Purpose: contains ezjscore settings
# Granite Horizon CRM

[ezjscServer]
FunctionList[]=getDataSet

[ezjscServer_ghcrmfetch]
Class=GHCRMFetch
File=extension/ghcrm/classes/ghcrmfetch.php
Functions[]=getDataSet

# These extension relies on jquery. If you don't have it loaded already then you should consider loading it.
#[eZJSCore]
#PreferredLibrary=jquery

*/ ?>
