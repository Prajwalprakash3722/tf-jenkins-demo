# Dynamic Inventory

- We need to somehow feed the ansible with the instance ip addresses and name, initially I wrote a bash file which parsed `multipass list` result and wrote to hosts.ini. This was very manual
grouping of the nodes were cumbersome

- Inspired by Prasad's suggestion, we explored dynamic inventory management. Ansible requires hosts to be structured in a specific JSON format, facilitating grouping and variable assignment.

```json
{
    "group001": {
        "hosts": ["host001", "host002"],
        "vars": {
            "var1": true
        },
        "children": ["group002"]
    },
    "group002": {
        "hosts": ["host003","host004"],
        "vars": {
            "var2": 500
        },
        "children":[]
    }

}
```

## Implementation

- Formatting Output: Ultilizing multipass's `-format=json` option, we obtained instance information in JSON format.

- Dynamic Parsing: Drawing inspiration from ec2.py, a popular AWS dynamic inventory tool, we used Python's subprocess module to execute multipass list and process its JSON output.
JSON Structure: We structured the inventory JSON to mirror Ansible's requirements, with groups, hosts.

```json
{
    "list": [
        {
            "ipv4": [
                "192.168.64.250"
            ],
            "name": "node-1",
            "release": "Ubuntu 22.04 LTS",
            "state": "Running"
        },
        {
            "ipv4": [
                "192.168.64.247"
            ],
            "name": "loki",
            "release": "Ubuntu 22.04 LTS",
            "state": "Running"
        },
        {
            "ipv4": [
                "192.168.64.248"
            ],
            "name": "node-2",
            "release": "Ubuntu 22.04 LTS",
            "state": "Running"
        },
        {
            "ipv4": [
                "192.168.64.251"
            ],
            "name": "prometheus",
            "release": "Ubuntu 22.04 LTS",
            "state": "Running"
        },
        {
            "ipv4": [
                "192.168.64.249"
            ],
            "name": "grafana",
            "release": "Ubuntu 22.04 LTS",
            "state": "Running"
        }
    ]
}

```

## Result
- Efficiency: Easier inventory management, eliminating manual parsing and supports dynamic updates.
- Scalability: Easily scale up inventory management without additional manual effort.
- Consistency: Ensured consistent inventory format, enhancing predictability and reliability.

```json
{
  "_meta": {
    "hostvars": {
      "node-1": {
        "ansible_host": "192.168.64.250",
        "name": "node-1",
        "state": "Running",
        "ipv4": [
          "192.168.64.250"
        ]
      },
      "loki": {
        "ansible_host": "192.168.64.247",
        "name": "loki",
        "state": "Running",
        "ipv4": [
          "192.168.64.247"
        ]
      },
      "node-2": {
        "ansible_host": "192.168.64.248",
        "name": "node-2",
        "state": "Running",
        "ipv4": [
          "192.168.64.248"
        ]
      },
      "prometheus": {
        "ansible_host": "192.168.64.251",
        "name": "prometheus",
        "state": "Running",
        "ipv4": [
          "192.168.64.251"
        ]
      },
      "grafana": {
        "ansible_host": "192.168.64.249",
        "name": "grafana",
        "state": "Running",
        "ipv4": [
          "192.168.64.249"
        ]
      }
    }
  },
  "nodes": {
    "hosts": [
      "node-1",
      "node-2"
    ]
  },
  "loki": {
    "hosts": [
      "loki"
    ]
  },
  "prometheus": {
    "hosts": [
      "prometheus"
    ]
  },
  "grafana": {
    "hosts": [
      "grafana"
    ]
  }
}
```

