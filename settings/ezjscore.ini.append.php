<?php /* #?ini charset="utf-8"?
# File: ezjscore.ini.append.php
# Purpose: contains ezjscore settings
# Granite Horizon CRM

[ezjscServer]
FunctionList[]=ghcrm_get_dataset

[ezjscServer_ghcrmfetch]
Class=GHCRMFetch
File=extension/ghcrm/classes/ghcrmfetch.php
Functions[]=ghcrm_get_dataset

# These extension relies on jquery. If you don't have it loaded already then you should consider loading it.
#[eZJSCore]
#PreferredLibrary=jquery

*/ ?>
