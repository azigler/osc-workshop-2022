# osc-workshop-2022/mattermost-incident-resolution

> 2022 Mattermost Open Source Collaboration Workshop

## Install

Enter the following commands in a terminal:

```
git clone -b mattermost-incident-resolution https://github.com/azigler/osc-workshop-2022 && cd osc-workshop-2022
sh init.sh
sh start.sh
```

Follow the directions for each Docker container:

### Mattermost

http://localhost:8065

- In System Console:
  - Enable integrations to override usernames: `true`
  - Enable integrations to override profile picture icons: `true`

### Healthchecks

http://localhost:8000

- Create Mattermost integration (use `host.docker.internal` instead of `localhost`)
- Copy a ping URL for deckofcards below (use `host.docker.internal` instead of `localhost`)
    - In Healthchecks, set the Period and Grace Time for the ping to both be 1 minute

### Deckofcards

http://localhost:8005

[OpenAPI specification](https://app.swaggerhub.com/apis/Thumbworks/DeckOfCards/1.0.0)

- Set `HEALTHCHECKS_PING_URL` in `./deckofcards/spades/settings.py` to the Healthchecks ping URL from above (use `host.docker.internal` instead of `localhost`)

- Rebuild `deckofcards`:

```
sudo docker-compose up -d --build
```

## Usage

Once everything is set up above, you can easily simulate an outage with the following command:

```
sudo docker stop deckofcards
```

Make sure that in Healthchecks, you set the Period and Grace Time for the ping to both be 1 minute. After a minute, Healthchecks will report the outage to Mattermost.

To simulate resolving the outage, use the following command:

```
sudo docker start deckofcards
```

After a minute, Healthchecks will report the restored service to Mattermost.
