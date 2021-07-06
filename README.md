<p align="center">
    <img alt="Chat Logo" src="/assets/img/logo.png" width="180" />
    <h3 align="center">Chat</h3>
    <p align="center">An Online Free Chat Rooms System with an Unexpected Focus on Privacy, Set up in Minutes.</p>
    <p align="center">
        <a href="https://github.com/Clivern/Chat/actions/workflows/ci.yml">
            <img src="https://github.com/Clivern/Chat/actions/workflows/ci.yml/badge.svg"/>
        </a>
        <a href="https://github.com/Clivern/Chat/releases">
            <img src="https://img.shields.io/badge/Version-0.1.0-1abc9c.svg">
        </a>
        <a href="https://github.com/Clivern/Chat/blob/master/LICENSE">
            <img src="https://img.shields.io/badge/LICENSE-MIT-orange.svg">
        </a>
    </p>
</p>

`Chat` is an online free chat rooms system with an unexpected focus on privacy. It is a platform where you can have a live discussion without registration! It supports also a private conversations. And once you signout, all your informations and messages gets wiped out. Even for registered users, the platform doesn't store conversations.


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
  -e POSTGRES_USER=chat \
  -e POSTGRES_PASSWORD=chat \
  -p 5432:5432 \
  --name postgresql \
  postgres:latest
```


### Versioning

For transparency into our release cycle and in striving to maintain backward compatibility, `Chat` is maintained under the [Semantic Versioning guidelines](https://semver.org/) and release process is predictable and business-friendly.

See the [Releases section of our GitHub project](https://github.com/clivern/chat/releases) for changelogs for each release version of `Chat`. It contains summaries of the most noteworthy changes made in each release. Also see the [Milestones section](https://github.com/clivern/chat/milestones) for the future roadmap.


### Bug tracker

If you have any suggestions, bug reports, or annoyances please report them to our issue tracker at https://github.com/clivern/chat/issues


### Security Issues

If you discover a security vulnerability within `Chat`, please send an email to [hello@clivern.com](mailto:hello@clivern.com)


### Contributing

We are an open source, community-driven project so please feel free to join us. see the [contributing guidelines](CONTRIBUTING.md) for more details.


### License

© 2022, `Chat`. Released under [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).

**Chat** is authored and maintained by [@Clivern](https://github.com/clivern).
