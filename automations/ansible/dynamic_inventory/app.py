#!/opt/homebrew/bin/python3
import subprocess
import json

# runs multipass list --format=json, and returns the std out result
def get_multipass_instances():
    try:
        result = subprocess.run(["multipass", "list", "--format=json"], capture_output=True, text=True)
        result.check_returncode()
        instances = json.loads(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"Error retrieving instances: {e}")
        return []
    
    return instances["list"]

# we are constructing the hosts dynamically with proper groups defined, all the instances named node-* will be under nodes group and the remaning shall have their group name same as their instance name
def format_inventory(instances):
    inventory = {
        "_meta": {
            "hostvars": {}
        },
        "nodes": {
            "hosts": []
        },
        "grafana":{
            "hosts":[]
        },
        "prometheus":{
            "hosts":[]
        },
        "elasticsearch":{
            "hosts":[]
        }
    }

    for instance in instances:
        name = instance["name"]
        state = instance["state"]
        if state == "Running":
            ip_address = instance["ipv4"][0]
            if name.startswith("node-"):
                inventory["nodes"]["hosts"].append(name)
            else:
                if name not in inventory:
                    inventory[name] = {
                        "hosts": []
                    }
                inventory[name]["hosts"].append(name)

            # Add host variables
            inventory["_meta"]["hostvars"][name] = {
                "ansible_host": ip_address,
                "name": name,
                "state": state,
                "ipv4": instance["ipv4"]
            }

    return inventory


def main():
    instances = get_multipass_instances()
    inventory = format_inventory(instances)
    print(json.dumps(inventory, indent=2))

if __name__ == "__main__":
    main()