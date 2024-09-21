# JanusExample

This is an example app with with a SQlite database and a Stories context.

After the setup try these 2 functions to reproduce the error:

```elixir
# error
JanusExample.Stories.list_public_stories()


# no Janus error, just a missing story
JanusExample.Stories.fetch_one("missing_uuid")
```
