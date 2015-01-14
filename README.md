kthxbai (*Kill Those Huge eXtra Bits Absentmindedly Installed*)

Run `kthxbai` after `npm install` to trim out parts of "node\_modules/..."
that aren't required for *running* your node.js dependencies.  Default
(hopefully reasonable) file patterns are included. Customize with a ".kthxbai"
file in your repo.

# Status

Some basic parts working. The docs and current implementation don't yet agree.
Come back later please!


# Install

    npm install -g kthxbai

See below if installing globally isn't your thing.


# Usage

First, create a ".kthxbai" config file for your project as follows.  This will
include the [default file patterns](./skel/kthxbai) (patterns use
[glob](https://www.npmjs.com/package/glob) syntax and are implicitly for paths
under "./node\_modules").

    kthxbai --init

Then you can then trim "./node\_modules" with:

    kthxbai

Here is an example run (use `-v` or `--verbose` to list every file being
removed):

    $ kthxbai --init
    "/Users/trentm/tm/node-bunyan/.kthxbai" created with default patterns
    $ kthxbai
        75 files/dirs removed under "/Users/trentm/tm/node-bunyan/node_modules"
        3209616 bytes -> 2496922 bytes (22%)


## I don't want a '.kthxbai' file in my project

As long as you only want/need the default file patterns, then you can trim
node\_modules without a config file with:

    kthxbai --force

There are a couple reasons `--force` or a config file is required:

1. The default `kthxbai` behaviour is to delete files. That's dangerous and
   invasive. Requiring the config file is an "opt-in".
2. Creating a config file allows the default file patterns to be explicitly
   listed. Explicit is good and it also makes adding extra patterns
   clearer.


## I don't want to install `kthxbai` globally

`npm install -g ...` might not be your thing. However adding a dependency on
`kthxbai` when the point is to reduce the size of your deps is ironic. The
answer is
[devDependencies](https://docs.npmjs.com/files/package.json#devdependencies)
and, optionally, the `rm-self` kthxbai pragma.

Put this in your "package.json" (manually or by running
`npm install --save kthxbai`):

    ...
    "devDependencies": {
        "kthxbai": "*"
    },
    ...

and this somewhere in your ".kthxbai":

    # +pragma: rm-self


# ".kthxbai" config file syntax

XXX

TODO: Doc the best practice of blank-line-separated and comment-preceded
sections.

## Pragmas

Pragmas are optional special comments in ".kthxbai" files with this form:

    # +pragma: PRAGMA1 [PRAGMA2...]

For example:

    # +pragma: rm-self

Supported pragmas:

- `rm-self`: Will result a locally installed "kthxbai" node module being removed
  when `kthxbai` is run.
- `scrub-package-json`: Remove npm server-added fields to package.json files.


# TODO

- s/--force/-y/ and have it prompt
- XXXs and TODOs in docs
- support dir handling:
    kthxbai  # $projDir/node_modules/
    kthxbai . # Error out if not a "node_modules" dir or subdir
    kthxbai ./path/to/foo   # same error out
    kthxbai foo    # -> $projDir/node_modules/foo
- dashdash cruft removal
- discussion of that ticket and my view... near the top. I don't want the name
  to misrepresent my opinion.
    https://github.com/npm/npm/issues/5264
- patterns/ dir with docs on how to PR to add more:
        patterns/re/restify@2   <--- or something usable with semver there
  (make sure to exclude this dir in .npmignore!)
  And 'import' support:
        kthxbai --import [<package-name> ...]
        kthxbai --import    # for every package name in package.json#dependencies
        kthxbai --import foo bar


Someday/Maybe:

- add more defaults from my imgadm Makefile?
- pragma aggressive: README.md, license files okay?,
- what about reducing to a single file? e.g. bunyan to just
  "node\_modules/bunyan.js"
- remove dirs made empty


# See Also

- [A npm/npm issue discussing minimal package
  installs.](https://github.com/npm/npm/issues/5264)

- [`npm install cruft`](https://github.com/timoxley/cruft)
