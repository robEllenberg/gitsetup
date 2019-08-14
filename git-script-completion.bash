#!/usr/bin/env bash

_git_update_branch ()
{
  # you can return anything here for the autocompletion for example all the branches
  __gitcomp_nl "$(__git_refs)"
}

_git_publish ()
{
  # you can return anything here for the autocompletion for example all the branches
  __gitcomp_nl "$(__git_refs)"
}
