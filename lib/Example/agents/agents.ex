{:ok, pid} = Agent.start_link(fn -> [] end, name: :daniel)

Agent.update(pid, &["eggs" | &1])

Agent.get(:daniel, & &1)

Agent.get(:daniel, fn state -> state end)

Agent.get_and_update(:daniel, fn state -> {state, ["bacon" | state]} end)

Agent.get(:daniel, fn state -> state end)

Agent.stop(pid)

# Agent.get(:daniel, fn state -> state end)
