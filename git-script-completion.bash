#!/usr/bin/env bash

_git_update_branch ()
{
  __gitcomp_nl "$(__git_refs)"
}

_git_stash_branch ()
{
  __gitcomp_nl "$(__git_refs)"
}

_git_publish ()
{
    # Return remotes (defaults to all of them)
  __gitcomp_nl "$(__git_remotes)"
}

_git_bulk_fetch ()
{
    # Return remotes (defaults to all of them)
  __gitcomp_nl "$(__git_remotes)"
}

_git_pp_checkout ()
{
  __gitcomp_nl "$(__git_refs)"
}

_git_pp_branch ()
{
  __gitcomp_nl "$(__git_refs)"
}
