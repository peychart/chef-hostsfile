# chef-hostsfile-cookbook

 This chef cookbook allows to have a default recipe to the "hostsfile" cookbook...

## Supported Platforms

 Ubuntu/debian

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chef-hostsfile']</tt></td>
    <td>Hash</td>
    <td>entries array</td>
    <td><tt>[{}]</tt></td>
  </tr>
</table>

## Usage

Exemple1:
 Data bag "node" example:

    {
      "id": "squid1_my_domain",
       "chef-hostsfile" : [{
          "127.0.1.1": {
             "action": "remove"
          }
        },{
          "10.7.0.28": {
             "domain": "squid1.my.domain",
             "aliases": ["squid1"]
          }
        },{
          "10.7.0.29": {
             "domain": "squid2.my.domain",
             "aliases": ["squid2"]
          }
        },{
          "10.7.0.27": {
             "domain": "squid.my.domain",
             "aliases": ["squid"]
        }
       }],
       ...

 Must be load with the 'chef-nodeAttributes' cookbook.

Exemple2:
 Data bag "service" example:

    {
      "id": "hostsfile",
      "chef-hostsfile": [
        {
          ":ipaddress": {
            "domain": ":fqdn",
            "aliases": [
              ":hostname",
              "me"
            ]
          }
        }
      ]
    }

 Must be load with the 'chef-serviceAttributes' cookbook (see below).

 NOTICE: an attribute name with a colon as first character is substitute with its search value in the ohai database...


### chef-hostsfile::default

Include `chef-hostsfile` in your node's `run_list`:

```json
{
  "override_attributes" => {
    "chef-nodeAttributes" => {
      "service" => "hostsfile"
    }
  },
  "run_list": [
    "recipe[chef-serviceAttributes::default]",
    "recipe[chef-hostsfile::default]"
  ]
}
```

## License and Authors

Author:: PE, pf. (<peychart@mail.pf>)
