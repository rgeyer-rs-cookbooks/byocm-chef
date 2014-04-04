byocm-chef Cookbook
===================

A cookbook for enabling better interoperability with RightScale when doing Chef
BYOCM

Requirements
------------

Attributes
----------
#### byocm-chef::serialize
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['byocm-chef']['rs_sketchy']</tt></td>
    <td>String</td>
    <td>The Sketchy Hostname assigned by RightScale</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['byocm-chef']['rs_instance_uuid']</tt></td>
    <td>String</td>
    <td>The instance uuid assigned by RightScale</td>
    <td></td>
  </tr>
</table>

Usage
-----
#### byocm-chef::serialize

Serialize is meant to be used on the RightScale ServerTemplate in the Boot
runlist, before the chef::install_client recipe is run.  This ensures that the
serialized JSON file is in place for byocm-chef::deserialize to fetch before
any chef-client converges might happen.

#### byocm-chef::deserialize

Meant to be run as the first thing in your roles runlist so that RightScale
specific values are available to code run by chef-client against your own
Chef server.

License and Authors
-------------------
Authors: Ryan J. Geyer <me@ryangeyer.com>
