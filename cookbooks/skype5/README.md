DESCRIPTION
===========

Installs Skype 5 and ChatStyle [Brief](http://media.miekd.com/brief/) for Mac OS X.

CHANGES
=======

- 1.0.4: use dmg_package LWRP
- 1.0.3: notify ruby block
- 1.0.2: update url for non-beta version of Skype 5 on OSX. To upgrade, remove Skype.app from /Applications.

REQUIREMENTS
============

## Platform

* Mac OS X

## Cookbooks

* dmg

ATTRIBUTES
==========

* `node["skype5"]["chat_style"]` - URL to a ChatStyle zip file to download. Default is the Brief chat style.

USAGE
=====

Use the skype5 default recipe to install Skype 5. Set the `node["skype5"]["chat_style"]` to another ChatStyle URL if you don't want the Brief style, or set it to false if you don't want any ChatStyle installed.

LICENSE AND AUTHOR
==================

Copyright 2010, Joshua Timberman (<cookbooks@housepub.org>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
