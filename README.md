## Cain

To start the application:

- Install dependencies with `make deps`
- Create and migrate your database with `make migrate`
- Start the application with `make run` or `make i`

Now you can visit `localhost:4000`(http://localhost:4000) from your browser.


### Database

To run `postgresql` with `docker`

```zsh
$ docker run -itd \
  -e POSTGRES_USER=cain \
  -e POSTGRES_PASSWORD=cain \
  -p 5432:5432 \
  --name postgresql \
  postgres:latest
```


### Versioning

For transparency into our release cycle and in striving to maintain backward compatibility, `Cain` is maintained under the [Semantic Versioning guidelines](https://semver.org/) and release process is predictable and business-friendly.

See the [Releases section of our GitHub project](https://github.com/clivern/cain/releases) for changelogs for each release version of `Cain`. It contains summaries of the most noteworthy changes made in each release.


### Bug tracker

If you have any suggestions, bug reports, or annoyances please report them to our issue tracker at https://github.com/clivern/cain/issues


### Security Issues

If you discover a security vulnerability within `Cain`, please send an email to [hello@clivern.com](mailto:hello@clivern.com)


### Contributing

We are an open source, community-driven project so please feel free to join us. see the [contributing guidelines](CONTRIBUTING.md) for more details.


### License

© 2022, Clivern. Released under [MIT License](https://opensource.org/licenses/mit-license.php).

**Cain** is authored and maintained by [@clivern](http://github.com/clivern).
