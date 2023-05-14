<p align="center">
    <img alt="Orangutan Logo" src="/assets/img/logo.png" width="180" />
    <h3 align="center">Orangutan</h3>
    <p align="center">An Online Free Chat Rooms System, Set up in Minutes.</p>
    <p align="center">
        <a href="https://github.com/Clivern/Orangutan/actions/workflows/ci.yml">
            <img src="https://github.com/Clivern/Orangutan/actions/workflows/ci.yml/badge.svg"/>
        </a>
        <a href="https://github.com/Clivern/Orangutan/releases">
            <img src="https://img.shields.io/badge/Version-0.1.0-1abc9c.svg">
        </a>
        <a href="https://github.com/Clivern/Orangutan/blob/master/LICENSE">
            <img src="https://img.shields.io/badge/LICENSE-MIT-orange.svg">
        </a>
    </p>
</p>

Orangutan is an online free chat rooms system with an unexpected focus on privacy. It is a platform where you can have a live discussion without registration! It supports also a private conversations. And once you signout, all your informations and messages gets wiped out. Even for registered users, the platform doesn't store conversations.


### Getting Started

To install dependencies.

```zsh
$ make deps
```

To create and migrate your database.

```zsh
$ make migrate
```

To start the application.

```zsh
$ make run
```

Now you can visit [localhost:4000](http://localhost:4000) from your browser.

To run test cases:

```zsh
$ make ci
```

To list all commands:

```zsh
$ make
```

To run `postgresql` with `docker`

```zsh
$ docker run -itd \
    -e POSTGRES_USER=orangutan \
    -e POSTGRES_PASSWORD=orangutan \
    -e POSTGRES_DB=orangutan_dev \
    -p 5432:5432 \
    --name postgresql \
    postgres:15.2
```


### Versioning

For transparency into our release cycle and in striving to maintain backward compatibility, `Orangutan` is maintained under the [Semantic Versioning guidelines](https://semver.org/) and release process is predictable and business-friendly.

See the [Releases section of our GitHub project](https://github.com/clivern/orangutan/releases) for changelogs for each release version of `Orangutan`. It contains summaries of the most noteworthy changes made in each release. Also see the [Milestones section](https://github.com/clivern/orangutan/milestones) for the future roadmap.


### Bug tracker

If you have any suggestions, bug reports, or annoyances please report them to our issue tracker at https://github.com/clivern/orangutan/issues


### Security Issues

If you discover a security vulnerability within `Orangutan`, please send an email to [hello@clivern.com](mailto:hello@clivern.com)


### Contributing

We are an open source, community-driven project so please feel free to join us. see the [contributing guidelines](CONTRIBUTING.md) for more details.


### License

© 2022, Clivern. Released under [MIT License](https://opensource.org/licenses/mit-license.php).

**Orangutan** is authored and maintained by [@clivern](http://github.com/clivern).
