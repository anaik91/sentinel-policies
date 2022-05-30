# Sentinel Policies
Sentinel Policies are rules which are enforced on Terraform runs to validate that the plan and corresponding resources are in compliance with company policies.

# Policies and Policy Sets
Policies are written using the Sentinel language. Policies are the guardrails that prevent Terraform runs from performing dangerous actions. Upon evaluation, policies will adhere to a predefined enforcement level.

Policies are managed as parts of versioned policy sets, which allow individual policy files to be stored in a supported VCS provider or uploaded via the Terraform Cloud API.

---
**NOTE** 
It's also possible to manage policies and policy sets individually. However, this is a deprecated feature in Terraform Cloud, and we recommend always using versioned policy sets to manage policies.
---
Policy sets are groups of policies that can be enforced on workspaces. A policy set can be enforced on designated workspaces, or to all workspaces in the organization.

After the plan stage of a Terraform run, Terraform Cloud checks every Sentinel policy that should be enforced on the run's workspace. This includes policies from global policy sets, and from any policy sets that are explicitly assigned to the workspace.


# List Of Policies

Sentinel File | Description |
---|---|
compute_block_ssh_keys.sentinel  | Enforcing block-project-ssh-keys metadata in google_compute_instance & google_compute_instance_template  | 
enable_network_firewall_logs.sentinel  | Enforcing logging on all google_compute_firewall | 
enable_network_flow_logs.sentinel  | Enforcing logging on google_compute_subnetwork across all VPCs | 
enable_network_private_google_access.sentinel  | Enforcing private_ip_google_access  on google_compute_subnetwork across all VPCs | 
enable_single_user_only_notebook | Enforcing Single User Admin for all google_notebooks_instance


# Enforcement levels

Sentinel has three enforcement levels:

* **Advisory**: The policy is allowed to fail. However, a warning should be shown to the user or logged.

* **Soft Mandatory**: The policy must pass unless an override is specified. The semantics of "override" are specific to each Sentinel-enabled application. The purpose of this level is to provide a level of privilege separation for a behavior. Additionally, the override provides non-repudiation since at least the primary actor was explicitly overriding a failed policy.

* **Hard Mandatory**: The policy must pass no matter what. The only way to override a hard mandatory policy is to explicitly remove the policy. Hard mandatory is the default enforcement level. It should be used in situations where an override is not possible.


# Configuring Enforcement Levels

Every policy set requires a configuration file named `sentinel.hcl`. This configuration file defines:

* Each policy that should be checked in the set.
* The enforcement level of each policy in the set.
* Any modules which need to be made available to policies in the set.

The sentinel.hcl configuration file is placed in `policies` folder which contains  entries which look like this .

```
policy "compute_block_ssh_keys" {
    source = "./compute_block_ssh_keys.sentinel"
    enforcement_level = "advisory"
}

policy "enable_network_firewall_logs" {
    source = "./enable_network_firewall_logs.sentinel"
    enforcement_level = "advisory"
}

policy "enable_network_flow_logs" {
    source = "./enable_network_flow_logs.sentinel"
    enforcement_level = "advisory"
}

policy "enable_network_private_google_access" {
    source = "./enable_network_private_google_access.sentinel"
    enforcement_level = "advisory"
}

policy "enable_single_user_only_notebook" {
    source = "./enable_single_user_only_notebook.sentinel"
    enforcement_level = "soft-mandatory"
}
```

You can change the `enforcement_level` on each policy defined basd on need to one of the below values 
* `advisory`
* `soft-mandatory `
* `hard-mandatory `
