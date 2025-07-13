# Datagram Node Setup Guide

This guide will walk you through setting up your Datagram node. By following these steps, you'll be able to contribute to the Datagram network and monitor your node's status.

-----

## 1\. Sign Up for Datagram

First, you'll need a Datagram account to manage your nodes and licenses.

  * [Signup Here](https://dashboard.datagram.network?ref=905737663)

## 2\. Obtain Your License Key

After signing up, you'll need to get your unique license key.

  * **Copy your license key from:** [Here](https://dashboard.datagram.network/wallet?tab=licenses)


## 3\. Install Prerequisites (if needed)

You'll need `wget` to download the Datagram CLI and `screen` to run your node in a persistent session.

  * **Install `wget` and `screen`** using your system's package manager. For Debian/Ubuntu, you'd use:

    ```bash
    sudo apt update
    sudo apt install wget screen -y
    ```

## 4\. Create a Screen Session

Using `screen` allows your Datagram node to continue running even if you close your terminal.

  * **Create a new screen session** named `datagram`:

    ```bash
    screen -S datagram
    ```

## 5\. Set Up Datagram Folder

It's good practice to keep your Datagram files organized in their own directory.

  * **Create and enter the `datagram` folder:**

    ```bash
    mkdir datagram
    cd datagram
    ```


## 6\. Download Datagram CLI

Now, download the Datagram command-line interface (CLI) tool.

  * **Download the CLI:**

    ```bash
    wget https://github.com/Datagram-Group/datagram-cli-release/releases/latest/download/datagram-cli-x86_64-linux

    ```

## 7\. Make the CLI Executable

You need to give the downloaded file execution permissions.

  * **Grant execution permissions:**

    ```bash
    chmod +x datagram-cli-x86_64-linux
    ```

## 8\. Run Your Datagram Node

Finally, run your Datagram node using your license key. **Replace `<YOUR_LICENSE_KEY>` with the key you copied in Step 2.**

  * **Run the node:**

    ```bash
    ./datagram-cli-x86_64-linux run -- -key <YOUR_LICENSE_KEY>
    ```


## 9\. Verify Node Connection

After running the node, check its status on your Datagram dashboard.

  * **Check if your node is connected:** [https://dashboard.datagram.network/overview](https://dashboard.datagram.network/overview)
    It may take a few moments for the status to update.


## 10\. Detach from Screen Session

Once your node is running in the `screen` session, you can safely detach from it without stopping the node.

  * **To detach from the `datagram` screen session**, press `Ctrl+A` then `D`.

-----

## Reconnecting to Your Screen Session

If you need to access your Datagram node's terminal later (e.g., to check logs or stop the node), you can reconnect to your `screen` session.

  * **To re-enter the `datagram` screen session:**

    ```bash
    screen -r datagram
    ```
