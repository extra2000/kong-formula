# Changelog

## [1.1.0](https://github.com/extra2000/kong-formula/compare/v1.0.2...v1.1.0) (2021-03-16)


### Features

* **network:** Add option to use host networking mode ([eafbdeb](https://github.com/extra2000/kong-formula/commit/eafbdeb9a55282672b7f6fbfc0d74a6e1ec11277))

### [1.0.2](https://github.com/extra2000/kong-formula/compare/v1.0.1...v1.0.2) (2021-03-14)


### Code Refactoring

* **defaults.yaml:** Rename postgres image from `docker.io/postgres:13.1-alpine` to `docker.io/library/postgres:13.1-alpine` ([8a9d1d9](https://github.com/extra2000/kong-formula/commit/8a9d1d93e8a4bd691a8cc52600686c3b5c212fc8))
* **pods:** Explicitly define `capabilities` ([a3d6325](https://github.com/extra2000/kong-formula/commit/a3d6325ec9b7cd9b53c4be428e72af6bb0535481))
* **service:** Rename state from `dead` to `destroy` ([8df36c0](https://github.com/extra2000/kong-formula/commit/8df36c0d49471bba9f0e365ef33841154b56f19a))


### Fixes

* **service:** Ensure images are successfully pulled and destroy existing pods before deploying new pods ([f22613f](https://github.com/extra2000/kong-formula/commit/f22613f52226be7620a731b66d308cc562e7469d))


### Documentations

* **README:** Change `dead` to `destroy` ([99d1809](https://github.com/extra2000/kong-formula/commit/99d1809960cd7d857359a0a1782cae912e925f82))

### [1.0.1](https://github.com/extra2000/kong-formula/compare/v1.0.0...v1.0.1) (2021-03-09)


### Fixes

* **network:** Make `bridge` customizable to prevent pod networking conflicts ([eb2059b](https://github.com/extra2000/kong-formula/commit/eb2059b16cccaf4b108cded29b2253e568fe121c))
* **pods:** Remove Podman 2.x workarounds ([bad5dcd](https://github.com/extra2000/kong-formula/commit/bad5dcdf302bd48585313e9bc3058b381ed4e5da))

## 1.0.0 (2021-01-24)


### Features

* Add implementations to `kong` states ([639e0c3](https://github.com/extra2000/kong-formula/commit/639e0c362a64ef742d0a2b34744d756ed5f3ffca))


### Continuous Integrations

* Add AppVeyor with `semantic-release` bot ([94c9650](https://github.com/extra2000/kong-formula/commit/94c96508f1c954c63432a91261d71d26aeb8bc13))


### Documentations

* **pillar:** Add `pillar.example` ([028dd9c](https://github.com/extra2000/kong-formula/commit/028dd9cd6c84bdc25952811198fa61d58fe91daf))
* **README:** Update `README.md` ([3206ed7](https://github.com/extra2000/kong-formula/commit/3206ed79ebab4c5a6eee554c1d7cb0d5d26a5400))
