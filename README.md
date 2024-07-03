# Dailymotion Player with Objective C and Event Listener

This is the sample code for the webview

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
    />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>webview test</title>
  </head>

  <body style="margin: 0px;">
    <div
      class="dm-player"
      playerId="x1bgs"
      owners="suaradotcom"
      sort="recent"
    ></div>

    <!-- Please replace the library URL to include your unique Player library ID created with your account and accessed via the Partner HQ or REST API -->

    <script src="https://geo.dailymotion.com/libs/player.js"></script>

    <div id="my-dailymotion-player">My Player placeholder</div>
    <script>
      window.onload = () => {
        window.loadThePlayer({
          videoId: "x84sh87",
        });
      };
      window.loadThePlayer = (dailymotion_info) => {
        dailymotion
          .createPlayer("my-dailymotion-player", {
            video: dailymotion_info.videoId,
          })
          .then((player) => {
            window.webkit.messageHandlers.iOS.postMessage("Player is created");
            window.player = player;
            player.on(dailymotion.events.VIDEO_PLAY, () => {
              window.webkit.messageHandlers.iOS.postMessage("played");
            });
            player.on(dailymotion.events.VIDEO_PAUSE, () => {
              window.webkit.messageHandlers.iOS.postMessage("paused");
            });
            player.on(dailymotion.events.AD_PLAY, () => {
              window.webkit.messageHandlers.iOS.postMessage("played");
            });
            player.on(dailymotion.events.AD_PAUSE, () => {
              window.webkit.messageHandlers.iOS.postMessage("paused");
            });
            player.on(dailymotion.events.PLAYER_VOLUMECHANGE, (state) => {
              window.webkit.messageHandlers.iOS.postMessage(
                state.playerIsMuted ? "muted" : "unmuted"
              );
            });
          })
          .catch((e) => console.error(e));
      };
    </script>
  </body>
</html>
```
