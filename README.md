# osc-workshop-2022/gitlab-with-https

> 2022 Mattermost Open Source Collaboration Workshop

# Introduction

While every software development team needs a different assortment of tools, all of them require some form of both source control (git) and asynchronous collaboration (chat, forums, GitHub issues). In this blog post you will learn how to initialize your own source control via GitLab and your own asynchronous chat via Mattermost via a turnkey example. Once you’re up and running, you’ll learn how to add extra developer-centric features to put your workflow in the fast lane. The best part? Everything (well, almost everything) we’ll be using is open source!

To get started, you will need a computer using amd64 architecture that meets [GitLab’s system requirements](https://docs.gitlab.com/ee/install/requirements.html). This repository will assume you are using Ubuntu 20.04.

## Architecture

[AWS EC2](https://aws.amazon.com/ec2/)

- c5.xlarge (4 vCPU, 8 GB RAM)
- Canonical, Ubuntu, 20.04 LTS, amd64 focal image build on 2021-11-29
- 15 GB storage

Security group ports:
- 80 (gitlab)
- 443 (gitlab)
- 22 (reserved)
- 2255 (gitlab)
- 8000 (healthchecks)
- 8005 (deckofcards)

This repository assumes your user is `ubuntu` and you are cloning into `/home/ubuntu` AKA `~/` AKA `$PATH`.

Before you begin, export your root hostname to your bash environment (e.g., `export HOSTNAME=example.com`).

```
sudo apt-get update
sudo apt install docker.io docker-compose certbot
git clone https://github.com/azigler/osc-workshop-2022 && cd osc-workshop-2022
sh init.sh
sh start.sh

# after some time...

sudo docker logs -f gitlab

# finally...

sudo cat ./gitlab/config/initial_root_password
```

## GitLab

- On your local machine:
  - [create SSH key](https://docs.gitlab.com/ee/user/ssh.html): 
    - `ssh-keygen -t ed25519 -C "YOUR_KEY"`
    - new files: `~/.ssh/YOUR_KEY` and `~/.ssh/YOUR_KEY.pub`

- Add contents of `YOUR_KEY.pub` to YOUR_GITLAB_URL/-/profile/keys

- On your local machine, create `~/.ssh/config`:

```
Host YOUR_GITLAB_URL
  Hostname YOUR_GITLAB_URL
  User git
  Port 2255
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/YOUR_KEY
```

- You can now git clone locally from GitLab:

```
git clone ssh://git@YOUR_GITLAB_URL:2255/gitlab-instance-a2db7621/Monitoring.git
```

## Mattermost

- In System Console:
  - Enable integrations to override usernames: `true`
  - Enable integrations to override profile picture icons: `true`
  - Enable OAuth 2.0 Service Provider: `true`
  - Enable Bot Account Creation: `true`

- Follow `jira` DM instructions to set up Jira plugin:
  - Jira Cloud
  - Organization URL: https://mm-workshop.atlassian.net

- Add Jira subscription to a Mattermost channgel: `/jira subscribe edit`

- https://mattermost.gitbook.io/plugin-gitlab/setup/configuration
 - Issue Create, Issue Deleted, Issue Updated: Any
 - Task

- [Set up GitLab plugin](https://github.com/mattermost/mattermost-plugin-gitlab/blob/master/docs/setup/configuration.md)

## Healthchecks

- Create Mattermost integration
- Copy a ping URL for deckofcards below

## Deckofcards

[OpenAPI specification](https://app.swaggerhub.com/apis/Thumbworks/DeckOfCards/1.0.0)

- Set `HEALTHCHECKS_PING_URL` in `./deckofcards/spades/settings.py` to the Healthchecks ping URL from above

- Rebuild `deckofcards`:

```
sudo docker-compose up -d --build
```
