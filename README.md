# devspace-terminal
A lightweight cloud-based development environment using DevSpace and code-server (Visual Studio Code)

## Overview

Terminal is a light-weight development environment that compliments DevSpace for software development.
By running inside the cluster you're developing against, operations are lightning fast and uploads are quick.
Terminal also manages a web-based VSCode installation too, so you can edit your files directly.

## How It Works

First, you deploy terminal from your computer into the cluster.
Then you enter the terminal and clone your repositories.
Then you connect to the web-based VSCode IDE and edit your tests and code.
When you are ready to start your app, then you run `$ devspace dev` from within terminal.
The port forwarding rules are setup to forward traffic from your app pod, to the terminal pod, and then to your computer.

## Requirements

1.  Have a kubernetes cluster setup and Loft installed
1.  Have `devspace` CLI and the Loft plugin installed

## Quickstart

1.  Ensure you have a space selected (or create a new one)
1.  Locally, `$ cd ~/workspace/devspace-terminal`
1.  Start terminal by `$ devspace dev`
    -  leave this running in the background
1.  In another terminal window, enter the terminal shell by `$ devspace enter -c terminal`
1.  Clone your git repositories by:
    1.  `Terminal $ cd ~/workspace`
    1.  `Terminal $ git clone git@github.com:noizwaves/fitness.git`
    1.  `Terminal $ cd fitness`
    1.  `Terminal $ git checkout using-terminal`
1.  Launch VSCode by:
    1.  Starting the server component by `Terminal $ code-server &`
    1.  Navigating to [http://localhost:8080](http://localhost:8080)
    1.  Opening the folder `~/workspace/fitness`
1.  Start the app by `Terminal $ devspace dev`
1.  Open the app locally at [http://localhost:3000](http://localhost:3000)

## Features

1.  Automatic pass-through of SSH key for GitHub and Loft configuration
1.  Synchronization of key development configurations via the `./home` directory:
    1.  `~/.gitconfig` for Git configuration
    1.  `~/.aliases` for custom aliases, functions, and prompts
    1.  `~/local/share/code-server/User/settings.json` for VS Code settings
