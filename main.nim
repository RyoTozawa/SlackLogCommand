import os
import httpclient, json
import dotenv
import uri
import times
let env = initDotEnv()
env.load()

proc get_channel(): JsonNode =
    var cha_url = r"https://slack.com/api/channels.list"
    var data = newMultipartData()
    data["token"] = getEnv("SLACK_TOKEN")
    var client = newHttpClient()
    var channel_list =  parseJson(client.postContent(cha_url, multipart=data))
    result = channel_list["channels"]


proc get_ID(j: JsonNode, n: string): string =
    for channel in j:
        var name = channel["name"].str
        if name == n:
            result = channel["id"].str
            return result

proc get_history(i: string): JsonNode =
  var his_url:string = r"https://slack.com/api/channels.history"
  var data = newMultipartData()
  data["token"] = getEnv("SLACK_TOKEN")
  data["channel"] = i
  var client = newHttpClient()
  var cha_his =  parseJson(client.postContent(his_url, multipart=data))
  result = cha_his

var channel_name:string = nil
let paramNam:int = os.paramCount()
echo paramNam
if paramNam == 1:
  channel_name = os.paramStr(1)
  var id = get_ID(get_channel(), channel_name)
  let now: TimeInfo = getLocalTime(getTime())
  let nowStr: string = format(now, "yyyyMMddHHmmss")
  var file_name: string = channel_name & "_" & nowStr & ".json"
  block:
    var f : File = open(file_name, fmReadWrite)
    defer :
      f.write(get_history(id)["messages"])
      close(f)
      echo "closed"
else:
  echo "invaild command"