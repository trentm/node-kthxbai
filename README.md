*All Your Files Kept Minimal.*

Run `ayfkm` after `npm install` to trim out cruft. Here "cruft" means any
files that aren't required for *running* your node module dependencies.
Default (hopefully reasonable) cruft patterns are included. Customize
with a ".ayfkm" file in your repo.

# Status

Some basic parts working. The docs and current implementation don't yet agree.
Come back later please!


# Install

    npm install -g ayfkm

See below if installing globally isn't your thing.


# Usage

First, create a ".ayfkm" config file for your project as follows.  This will
include the [default cruft patterns](./skel/ayfkm) (patterns use
[glob](https://www.npmjs.com/package/glob) syntax and are implicitly for paths
under "./node\_modules").

    ayfkm --init

Then you can clean out the cruft with:

    ayfkm

Here is an example run (use `-v,--verbose` to list every file being removed):

    $ ayfkm --init
    "/Users/trentm/tm/node-bunyan/.ayfkm" created with default patterns
    $ ayfkm
        75 files/dirs removed under "/Users/trentm/tm/node-bunyan/node_modules"
        3209616 bytes -> 2496922 bytes (22%)


## I don't want a '.ayfkm' file in my project

As long as you only want/need the default cruft patterns, then you can clean
cruft without a config file with:

    ayfkm --force

There are a couple reasons `--force` or a config file is required:

1. The default `ayfkm` behaviour is to delete files. That's dangerous and
   invasive. Requiring the config file is an "opt-in".
2. Creating a config file allows the default cruft patterns to be explicitly
   listed. Explicit is good and it also makes adding extra cruft patterns
   clearer.


## I don't want to install `ayfkm` globally

`npm install -g ...` might not be your thing. However adding a dependency on
`ayfkm` when the point is to reduce the size of your deps is ironic. The
answer is
[devDependencies](https://docs.npmjs.com/files/package.json#devdependencies)
and, optionally, the `rm-self` ayfkm pragma.

Put this in your "package.json":

    ...
    "devDependencies": {
        "ayfkm": "*"
    },
    ...

and this somewhere in your ".ayfkm":

    # +pragma: rm-self


# ".ayfkm" config file syntax

XXX

TODO: Doc the best practice of blank-line-separated and comment-preceded
sections.


# TODO

- 'rm-self' pragma
- XXXs in docs
- support dir handling:
    ayfkm  # $projDir/node_modules/
    ayfkm . # Error out if not a "node_modules" dir or subdir
    ayfkm ./path/to/foo   # same error out
    ayfkm foo    # -> $projDir/node_modules/foo
- dashdash cruft removal
- discussion of that ticket and my view... near the top. I don't want the name
  to misrepresent my opinion
- patterns/ dir with docs on how to PR to add more:
        patterns/re/restify@2   <--- or something usable with semver there
  (make sure to exclude this dir in .npmignore!)
  And 'import' support:
        ayfkm --import [<package-name> ...]
        ayfkm --import    # for every package name in package.json#dependencies
        ayfkm --import foo bar
- add more defaults from my imgadm Makefile?
- pragma aggressive: README.md, drop npm server-added fields to package.json,
  license files okay?
- remove dirs made empty


# See Also

- [A npm/npm issue discussing minimal package
  installs.](https://github.com/npm/npm/issues/5264)

- [`npm install cruft`](https://github.com/timoxley/cruft)
