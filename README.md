All Your Files Kept Minimal.
Run `ayfkm` after `npm install` to trim out cruft.

Put this in your package.json `devDependencies`:

    "ayfkm": "*"

then run this:

    npm install && ./node_modules/.bin/ayfkm


# Status

Not yet functional. Come back later please!


# Install

    npm install ayfkm


# TODO

- warning: this deletes files with default call. That seems bad.
- basic functionality
    - default (from cruft): example, examples, test, tests, doc, man
        **/example
        **/examples
        **/test
        **/tests
        **/doc
        **/man
        **/.travis.yml

    how about this:
        $ cat .ayfkm
        dashdash/examples
        jsprim/deps
        .bin/m*
        **/tst

    how to get *options* in there if need? a pragma:
        # this is a comment, next is a pragma (syntax a la Go)
        # +pragma: aggressive

- add more defaults from my imgadm Makefile?
- .ayfkm.json support (or perhaps flat file? see ^^
- https://www.npmjs.com/package/minimatch ? glob
- docs
- remove dirs made empty
- `ayfkm ./dir/path/to/node_modules`
- `ayfkm foo` for "./node_modules/foo" clean out
- dashdash cruft removal
- pragma aggressive: README.md, drop npm server-added fields to package.json,
  license files okay?
- crowdsource .ayfkm directives for npm modules? website, mirrors npm modules,
  tied to module major version?, `ayfkm --import foo`


# See Also

- [`npm install cruft`](https://github.com/timoxley/cruft)
