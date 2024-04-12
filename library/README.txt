# setup sample erlang project
alias rb=rebar3
rb new lib name=library
# or checkout my repository
# rb ct
cd library

# setup proper for this project
echo '{project_plugins, [rebar3_proper]}.' >> rebar.config
echo '{profiles, [{test, [ {deps, [proper]}
                         , {erl_opts, [nowarn_export_all]}
                         ]}]}.' >> rebar.config
rb help proper
rb new proper name=basic
cat test/prop_basic.erl

rb proper
rb proper -m prop_basic
rb new proper_statem stateful
alias next='git reset --hard $(git rev-list --topo-order HEAD..TOP | tail -1)'
alias prev='git reset --hard HEAD^'

#######
## Get example value:
proper_gen:pick(Generator).
