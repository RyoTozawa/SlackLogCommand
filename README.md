# SlackLogCommand
./main チャンネル名 で、jsonでチャットログを吐き出します。

# Dependency
- os
- httpclient
- json
- dotenv
- uri
- import times

# Setup
- Set the `.env` current directory. And, set the environment viriable
> SLACK_TOKEN : auth channel.list / channel.history
- Do this command
> nim c -r main.nim
- After compiling, you can use as with c.

# Usage
- `./main [Channel Name(you want to get)]`

# Licence
This software is released under the MIT License, see LICENSE.

# Authors
- [RyoTozawa](https://github.com/RyoTozawa)

# References
- [Official](https://nim-lang.org/)
- [nim_syntax.md](https://gist.github.com/miyakogi/b1df00c8bc99927d9d0d)
- [Nim帳](http://nim-memo.hatenablog.com/entry/2016/10/12/045707)
