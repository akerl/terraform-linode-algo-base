terraform-linode-algo-base
=========

[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Terraform module that creates a [Linode](https://linode.com) with package updates and the [Algo](https://github.com/trailofbits/algo) repo deployed but not configured.

## Usage

```
module "vpn" {
  source  = "github.com/akerl/terraform-linode-algo-base"
  name = "vpn"
  ssh_keys = ["PUT_YOUR_PUBKEY_HERE"]

  users = [
    "alfa",
    "beta",
  ]
}
```

## License

terraform-linode-algo-base is released under the MIT License. See the bundled LICENSE file for details.
