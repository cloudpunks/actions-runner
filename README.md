# actions-runner

[![Docker Build](https://github.com/cloudpunks/actions-runner/workflows/docker/badge.svg)](https://github.com/cloudpunks/actions-runner/actions/workflows/docker.yml?query=workflow%3Adocker) [![GitHub Repo](https://img.shields.io/badge/github-repo-yellowgreen)](https://github.com/cloudpunks/actions-runner) [![Upstream Repo](https://img.shields.io/badge/upstream-repo-yellow)](https://github.com/actions/runner)

Within this repository we define a customized image for self-hosted GitHub
Actions runners. You should not use this runner image without forking it as
this could disappear at any point in time.

## Versions

To get an overview about the available tags please take a look at [GHCR][ghcr].

## Security

If you find a security issue please contact
[ops@cloudpunks.de](mailto:ops@cloudpunks.de) first.

## Contributing

We use [mise][mise] to manage all required tools and their versions. Install it
by following the [official installation instructions][mise-install], then run
the following commands inside the repository to activate mise and install all
tools defined in `mise.toml`:

```console
mise trust
mise install
```

Generally we are following [conventional commits][commits] when we apply
changes. That way we are able to generate proper changelogs for every release.
Please use always pull requests to integrate new functionalities or to fix
issues.

For the release process we are following [semantic versioning][semver] which
clearly indicates if a new version just resolves bugs, includes new features or
even includes breaking changes.

After installing the tools via `mise install` as described above set up the
pre-commit hooks so they run automatically on every commit:

```console
pre-commit install --hook-type pre-commit --hook-type commit-msg
```

> `pre-commit` is managed by mise and will be available after `mise install`.

If you have changed something on the source you should simply commit following
the mentioned conventions:

```console
git checkout -b feat/new-feature
git add --all
git commit -m 'feat: added awesome new feature'
git push --set-upstream origin feat/new-feature
```

After pushing your changes into the Git repository you should create a pull
request on GitHub. If the pull request have been merged and everything built
fine it will also create automatically a new release at least once a week.

## Authors

-   [Thomas Boerger](https://github.com/tboerger)

## License

Apache-2.0

## Copyright

```
Copyright (c) 2023 cloudpunks GmbH <info@cloudpunks.de>
```

[ghcr]: https://github.com/cloudpunks/actions-runner/pkgs/container/actions-runner
[mise]: https://mise.jdx.dev/
[mise-install]: https://mise.jdx.dev/getting-started.html
[commits]: https://www.conventionalcommits.org/en/v1.0.0/
[semver]: https://semver.org/
