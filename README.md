# kong-formula

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build status](https://ci.appveyor.com/api/projects/status/j6ni2kepilfnutkc/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/kong-formula/branch/master) |

SaltStack Formula for [Kong API Gateway](https://github.com/Kong/kong).


## Available states

| States | Descriptions |
| ------ | ------------ |
| `kong.config` | Transfer source files and configure. |
| `kong.service.postgres` | Deploy Postgres pod. |
| `kong.service.postgres.destroy` | Destroy Postgres pod. |
| `kong.service.kong` | Deploy Kong pod. |
| `kong.service.kong.destroy` | Destroy Kong pod. |
