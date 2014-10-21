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


 Data bag "clusters" example:

    {
      "id": "fqdn",
       "chef-hostsfile" : [{
          "127.0.1.1": {
             "action": "remove"
          }
        },{
          "10.7.0.28": {
             "domain": "squid1.mydomain",
             "aliases": ["squid1"]
          }
        },{
          "10.7.0.29": {
             "domain": "squid2.mydomain",
             "aliases": ["squid2"]
          }
        },{
          "10.7.0.27": {
             "domain": "squid.mydomain",
             "aliases": ["squid"]
        }
       }],
       ...

### chef-hostsfile::default

Include `chef-hostsfile` in your node's `run_list`:

```json
{
  "override_attributes" => {
    "chef-nodeAttributes" => {
      "databag_name" => "clusters"
    }
  },
  "run_list": [
    "recipe[chef-nodeAttributes::default]",
    "recipe[chef-hostsfile::default]"
  ]
}
```

## License and Authors

Author:: PE, pf. (<peychart@mail.pf>)
